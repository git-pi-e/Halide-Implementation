#include "Halide.h"
using namespace Halide;
class Blur: public Generator<Blur>{
public:
	Input<Buffer<uint8_t>> input{"input",2};
	Output<Buffer<uint8_t>> result{"result",2};
	void generate(){
		Var x,y;
		Func clamped = BoundaryConditions::repeat_edge(input);
		
		Func input_16;
		input_16(x,y)=cast<uint16_t>(clamped(x,y));
		
		Func blur_x;
		blur_x(x,y) = (input_16(x-1,y)+
				input_16(x,y)+
				input_16(x+1,y))/
				9;
		
		Func blur_y;
		blur_y(x,y) = (input_16(x,y-1)+
				input_16(x,y)+
				input_16(x,y+1))/
				9;
		
		result(x,y)=cast<uint8_t>(blur_y(x,y));

	/*	Results:

		Inline Everything:
		No effects applied
		Total Time: 0.085202

		First Set of Schedule
		
		With Vectorization enabled
		Total Time: 0.125271
		Withour Vectorization
		Total Time: 0.30163

		Second Set of Schedule
		
		With Vectorization enabled
		Total Time: 0.0275248
		Withour Vectorization
		Total Time: 0.130743

		Third Set of Schedule
		
		With Vectorization enabled
		Total Time: 0.0339669
		Withour Vectorization
		Total Time: 0.188921

		Fourth Set of Schedule
		
		With Vectorization enabled
		Total Time: 4.65981
		Withour Vectorization
		Total Time: 4.76498

		Fifth Set of Schedule
		
		With Vectorization enabled
		Total Time: 0.0330989
		Withour Vectorization
		Total Time: 0.189323

	*/

		//First Set of Schedule
		// clamped.compute_root();
		// input_16.compute_root();
		// blur_x.compute_root();
		// blur_y.compute_root();
		// result.compute_root();

		//Second Set of Schedule
		// input_16.compute_root();
		// blur_x.compute_root();
		// result.compute_root();

		//Third Set of Schedule
		// Var xi,yi;
		// result.compute_root()
		// 	.tile(x,y,xi,yi,256,32);
		// blur_x.compute_at(result,x);
		// input_16.compute_at(result,x);

		//Fourth Set of Schedule
		// const int vec=32;
		// Var xi,yi;
		// result
		// 	.compute_root()
		// 	.tile(x,y,xi,yi,256,32)
		// 	.vectorize(x,vec);
		// blur_x
		// 	.compute_at(result,x)
		// 	.vectorize(x,vec);
		// input_16
		// 	.compute_at(result,x)
		// 	.vectorize(x,vec);

		//Fifth Set of Schedule
		// const int vec=32;
		// Var xi,yi;
		// result
		// 	.compute_root()
		// 	.tile(x,y,xi,yi,256,32);
		// blur_x
		// 	.compute_at(result,x);
		// input_16
		// 	.compute_at(result,x); 
	}
};
HALIDE_REGISTER_GENERATOR(Blur,blur);
