#!/usr/bin/bash

set -eux

#CC="/usr/bin/clang"
#CCX="/usr/bin/clang++"
CC="/usr/bin/gcc"
CCX="/usr/bin/g++"

BUILDTYPE="RelWithDebInfo"
#BUILDTYPE="Release"

DEPSPATH="../ror-dependencies/build/Dependencies_Linux"

NCPUS=$(nproc --all)


# building dependencies
pushd ror-dependencies
#git clean -fd
#git checkout -- .

mkdir build -p
rm -rf ./build/*
cd build
cmake -DCMAKE_C_COMPILER=${CC} -DCMAKE_CXX_COMPILER=${CCX} -DCMAKE_BUILD_TYPE=${BUILDTYPE} ..
make -j${NCPUS}

popd


# building the game
pushd rigs-of-rods

mkdir build -p
rm -rf ./build/*
cd build
cmake -DCMAKE_C_COMPILER=${CC} -DCMAKE_CXX_COMPILER=${CCX} -DCMAKE_BUILD_TYPE=${BUILDTYPE} -DCMAKE_PREFIX_PATH=${DEPSPATH} ..
make -j${NCPUS}
popd

