#include"Halide.h"
using namespace Halide;

/*
    Generators are a more structured way to do ahead-of-time
    compilation of Halide pipelines. Instead of writing an int main(),
    we define a class that inherits from Halide::Generator.
*/

class Blur:public Generator<Blur>{
    public:

    Input<Buffer<uint8_t>> input{"input",2};        // Input image
    Output<Buffer<uint8_t>> result{"result",2};     // Output image
    void generate(){
        Var x,y;

        Func clamped = BoundaryConditions::repeat_edge(input);  // Repeat the edges of the input image

        Func input_16;
        input_16(x,y) = cast<uint16_t>(clamped(x,y));           // Cast the input image to 16-bit

        Func blur_x;                                            // Blur in the x direction
        blur_x(x,y) =   (input_16(x-1,y) + 
                        input_16(x,y) + 
                        input_16(x+1,y))/3;

        Func blur_y;                                            // Blur in the y direction
        blur_y(x,y) =   (blur_x(x,y-1) + 
                        blur_x(x,y) + 
                        blur_x(x,y+1))/3;

        result(x,y) = cast<uint8_t>(blur_y(x,y));               // Cast the output image back to 8-bit
        /*  
            We have to prepare a schedule for the consumer before the schedule for the producer.
            That is why we will be scheduling result first, then input_16, then blur_x, then blur_y.
        */
        const int vec = 32;
        Var xi,yi;
        result
            .compute_root()
            .tile(x,y,xi,yi,256,32)  //Tiling done while computing the result from the input image
            .vectorize(xi,vec)       //Vectorization done while computing the result from the input image
            .parallel(y);            //Parallelization done while computing the result from the input image

        blur_x
            .store_at(result,x)      //Storing the intermediate result of blur_x at the result tile
            .compute_at(result,x)    //Computing the intermediate result of blur_x at the result tile
            .vectorize(x,vec);       

        input_16
            .compute_at(result,x)    
            .vectorize(x,vec);       

        clamped
            .compute_at(blur_x,y)   
            .vectorize(_0,vec);     
    }
};
HALIDE_REGISTER_GENERATOR(Blur,"blur");

/*
    compute_root()
    The compute_root() directive tells Halide to compute the function at the outermost level of the schedule tree.
    That is, it will compute all the function once ahead in time.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.compute_root();

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y = 0; y < height+1; y++) 
        {
            for (int x = 0; x < width+1; x++) 
            {
                g[y][x] = x*y;
            }
        }
        for (int y = 0; y < height; y++) 
        {
            for (int x = 0; x < width; x++) 
            {
                f[y][x] = g[y][x] + g[y+1][x] + g[y][x+1] + g[y+1][x+1];
            }
        }
*/
/*
    store_at()
    The store_at() directive tells Halide to store the function at a particular level of the schedule tree.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.store_at(f, y);

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y = 0; y < height; y++) 
        {
            for (int x = 0; x < width+1; x++) 
            {
                g[y][x] = x*y;
            }
            for (int x = 0; x < width; x++) 
            {
                f[y][x] = g[y][x] + g[y+1][x] + g[y][x+1] + g[y+1][x+1];
            }
        }
*/
/*
    compute_at()
    The compute_at() directive tells Halide to compute the function at a particular level of the schedule tree.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.compute_at(f, y);

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y = 0; y < height; y++) 
        {
            for (int x = 0; x < width+1; x++) 
            {
                g[y][x] = x*y;
            }
            for (int x = 0; x < width; x++) 
            {
                f[y][x] = g[y][x] + g[y+1][x] + g[y][x+1] + g[y+1][x+1];
            }
        }
*/
/*
    tile()
    The tile() directive tells Halide to split a function into tiles of a given size.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.tile(x, y, x, y, 8, 8);

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y_outer = 0; y_outer < (height+1)/8; y_outer++) 
        {
            for (int x_outer = 0; x_outer < (width+1)/8; x_outer++) 
            {
                for (int y_inner = 0; y_inner < 8; y_inner++) 
                {
                    for (int x_inner = 0; x_inner < 8; x_inner++) 
                    {
                        g[y_outer*8 + y_inner][x_outer*8 + x_inner] = (x_outer*8 + x_inner)*(y_outer*8 + y_inner);
                    }
                }
            }
        }
        for (int y = 0; y < height; y++) 
        {
            for (int x = 0; x < width; x++) 
            {
                f[y][x] = g[y][x] + g[y+1][x] + g[y][x+1] + g[y+1][x+1];
            }
        }
*/    
/*
    vectorize()
    The vectorize() directive tells Halide to vectorize a function.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.vectorize(x, 8);

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y = 0; y < height+1; y++) 
        {
            for (int x_outer = 0; x_outer < (width+1)/8; x_outer++) 
            {
                for (int x_inner = 0; x_inner < 8; x_inner++) 
                {
                    g[y][x_outer*8 + x_inner] = (x_outer*8 + x_inner)*y;
                }
            }
        }
        for (int y = 0; y < height; y++) 
        {
            for (int x = 0; x < width; x++) 
            {
                f[y][x] = g[y][x] + g[y+1][x] + g[y][x+1] + g[y+1][x+1];
            }
        }
*/
/*
    parallel()
    The parallel() directive tells Halide to parallelize a function.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.parallel(y);

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y = 0; y < height+1; y++) 
        {
            for (int x = 0; x < width+1; x++) 
            {
                g[y][x] = x*y;
            }
        }
        for (int y = 0; y < height; y++) 
        {
            for (int x = 0; x < width; x++) 
            {
                f[y][x] = g[y][x] + g[y+1][x] + g[y][x+1] + g[y+1][x+1];
            }
        }
*/
/*
    clamp()
    The clamp() directive tells Halide to clamp a function.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.clamp(y, 0, height-1);

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y = 0; y < height+1; y++) 
        {
            for (int x = 0; x < width+1; x++) 
            {
                g[y][x] = x*y;
            }
        }
*/
/*
    repeat_edge()
    The repeat_edge() directive tells Halide to repeat_edge a function.
    This is one of the methods of scheduling and further parellize and combination is required to be done on the pipeline.
    Without that lots of space and time will be required to execute all the function separately.

    So, in halide saying
        Func f,g;
        Var x,y;
        g(x, y) = x*y;
        f(x, y) = g(x, y) + g(x, y+1) + g(x+1, y) + g(x+1, y+1);
        g.repeat_edge(y);

    is equivalent to saying
        int f[height][width];
        int g[height+1][width+1];
        for (int y = 0; y < height+1; y++)
        {
            for (int x = 0; x < width+1; x++)
            {
                g[y][x] = x*y;
            }
        }
*/