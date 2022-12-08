#HALIDE_DIR ?= ~/data1/BITS/GC/Third\ year/PoPL/Assignment/Halide-14.0.0-x86-64-linux
SRC = blur_generator.cpp #main.cpp

bin/blur_generator: $(SRC)
	c++ $(HALIDE_DIR)/share/Halide/tools/GenGen.cpp $(SRC) -I $(HALIDE_DIR)/include -L $(HALIDE_DIR)/lib -lHalide -Wl,-rpath $(HALIDE_DIR)/lib -o bin/blur_generator

bin/blur.a: bin/blur_generator
	./bin/blur_generator -g blur -o bin target=x86-64-linux-avx-avx2-f16c-fma-sse41

bin/blur.rungen: bin/blur.a
	c++ $(HALIDE_DIR)/share/Halide/tools/RunGenMain.cpp bin/blur.a bin/blur.registration.cpp -I $(HALIDE_DIR)/include  -o bin/blur.rungen -lpng -ljpeg -lz -lpthread -ldl

test: bin/blur.rungen
	./bin/blur.rungen input=input/lenna.png result=output/lenna_blurry.png --benchmarks=all --benchmark_min_time=1 --parsable_output

clean:
	rm -f bin/*
