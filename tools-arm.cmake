# CMake toolchain file for building ARM software on OI environment

# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)


file(GLOB LOCAL_ARM_C_COMPILERS "/usr/bin/arm-linux-gnueabihf-gcc-[0-9]*")
if(LOCAL_ARM_C_COMPILERS)
    list(LENGTH LOCAL_ARM_C_COMPILERS listSize)
    if(${listSize} GREATER 0)
        list(GET LOCAL_ARM_C_COMPILERS 0 LOCAL_ARM_C_COMPILER)
    endif()
endif()

file(GLOB LOCAL_ARM_CXX_COMPILERS "/usr/bin/arm-linux-gnueabihf-g++-[0-9]*")
if(LOCAL_ARM_CXX_COMPILERS)
    list(LENGTH LOCAL_ARM_CXX_COMPILERS listSize)
    if(${listSize} GREATER 0)
        list(GET LOCAL_ARM_CXX_COMPILERS 0 LOCAL_ARM_CXX_COMPILER)
    endif()
endif()

# specify the cross compiler
SET(CMAKE_C_COMPILER   ${LOCAL_ARM_C_COMPILER})
SET(CMAKE_CXX_COMPILER ${LOCAL_ARM_CXX_COMPILER})
SET(CMAKE_STRIP /usr/bin/arm-linux-gnueabihf-strip)

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH  /usr/bin)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
