cmake_minimum_required(VERSION 3.2)

project(hello)
#include(tools-${SDK}.cmake)
#include(tools-arm.cmake)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O3")

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

set(PROJ_INSTALL_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set(PROJ_INSTALL_BIN_DIR ${PROJECT_SOURCE_DIR}/bin)
set(PROJ_INSTALL_LIB_DIR ${PROJECT_SOURCE_DIR}/lib)
set(PROJ_SDK_DIR ${PROJECT_SOURCE_DIR}/sdk)

include_directories(${PROJ_INSTALL_INCLUDE_DIR})

add_subdirectory(src)
