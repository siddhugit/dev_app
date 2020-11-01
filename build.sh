#!/bin/bash

build_dir=Builds
build_type=${1:-"Debug"}

if [[ ${build_type} != "Debug" && ${build_type} != "Release" ]]; then
	printf "Unsipported build type ${build_type}\n"
	exit
fi

if [[ ! -e ${build_dir}/${build_type} ]]; then
	printf "Creating ${build_dir}/${build_type}\n"
	mkdir -p ${build_dir}/${build_type}
fi

cd ${build_dir}/${build_type} 
cmake -DCMAKE_BUILD_TYPE=${build_type} ../.. || exit
make || exit
make install

