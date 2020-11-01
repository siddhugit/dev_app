cmake_minimum_required(VERSION 3.2)
project (hello)

include_directories(../adder)
include_directories(../protobufs)
include_directories(${PROJ_SDK_DIR}/protobuf/include)

link_directories(${PROJ_SDK_DIR}/protobuf/lib/protobuf-${SDK}/static)


add_executable(hello hello.cpp)
target_link_libraries(
hello
adder_static
app_protobufs_static
libprotobuf.a
pthread
)

install(TARGETS hello DESTINATION ${PROJ_INSTALL_BIN_DIR}/${CMAKE_BUILD_TYPE})
