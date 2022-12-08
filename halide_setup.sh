#!/bin/bash


# This script is used to setup the Halide environment on a new machine.
if [ ! -d "./halide" ]
then
    wget https://github.com/halide/Halide/releases/download/v14.0.0/Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
    tar -xvzf Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
    rm Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
    mv Halide-14.0.0-x86-64-linux halide
    mkdir bin
fi

export HALIDE_DIR=$PWD/halide


