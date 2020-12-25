cmake_minimum_required(VERSION 3.2)
project (testsqlite)

include_directories(${PROJ_SDK_DIR}/sqlite/include/${SDK})

link_directories(${PROJ_SDK_DIR}/sqlite/lib/${SDK})


add_executable(testsqlite main.cpp)
target_link_libraries(
testsqlite
libsqlite3.a
pthread
dl
)

install(TARGETS testsqlite DESTINATION ${PROJ_INSTALL_BIN_DIR}/${CMAKE_BUILD_TYPE})
