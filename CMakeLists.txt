cmake_minimum_required(VERSION 2.8)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake")

# set up the Microchip cross toolchain
set(CMAKE_TOOLCHAIN_FILE CMake/toolchain-xc16.cmake)

project(cashcontrol C)


add_executable(${CMAKE_PROJECT_NAME}
    src/main.c
)
bin2hex(${CMAKE_PROJECT_NAME})
