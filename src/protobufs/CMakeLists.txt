set(PROJ_PROTO_COMMAND "${PROJ_SDK_DIR}/protobuf/bin/protoc")

file(GLOB PROTOBUF_DEFINITION_FILES "*.proto")

foreach(file ${PROTOBUF_DEFINITION_FILES})
    get_filename_component(protoFileName ${file} NAME)
    set(oldLdLibPath ENV{LD_LIBRARY_PATH})
    set(ENV{LD_LIBRARY_PATH} "${PROJ_SDK_DIR}/protobuf/lib/protobuf-native/;${oldLdLibPath}")
    set(PROTOBUF_ARGUMENTS "protoc -I=${CMAKE_CURRENT_SOURCE_DIR} --cpp_out=\"${CMAKE_CURRENT_SOURCE_DIR}\" \"${protoFileName}\"")
    execute_process(COMMAND ${PROJ_PROTO_COMMAND} -I=${CMAKE_CURRENT_SOURCE_DIR} --cpp_out=${CMAKE_CURRENT_SOURCE_DIR} ${protoFileName}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        RESULT_VARIABLE PROTOBUF_RESULT)
    set(ENV{LD_LIBRARY_PATH} ${oldLdLibPath})
endforeach()

file(GLOB PROTOBUF_SOURCE_FILES "*.pb.cc")

include_directories(${PROJ_SDK_DIR}/protobuf/include)

add_library(app_protobufs SHARED ${PROTOBUF_SOURCE_FILES})
add_library(app_protobufs_static STATIC ${PROTOBUF_SOURCE_FILES})
install(TARGETS app_protobufs DESTINATION ${PROJ_INSTALL_LIB_DIR}/${CMAKE_BUILD_TYPE})
install(TARGETS app_protobufs_static DESTINATION ${PROJ_INSTALL_LIB_DIR}/${CMAKE_BUILD_TYPE}/static)


