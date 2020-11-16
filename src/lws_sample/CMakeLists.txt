cmake_minimum_required(VERSION 3.2)
project (hello)

include_directories(${PROJ_SDK_DIR}/lws/include)

link_directories(${PROJ_SDK_DIR}/lws/lib/${SDK})


add_executable(lws_server lws_server.cpp)
target_link_libraries(
lws_server
libwebsockets.a
)

install(TARGETS lws_server DESTINATION ${PROJ_INSTALL_BIN_DIR}/${CMAKE_BUILD_TYPE})
