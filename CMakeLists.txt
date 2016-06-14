cmake_minimum_required(VERSION 2.8)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake")

# set up the Microchip cross toolchain
set(CMAKE_TOOLCHAIN_FILE CMake/toolchain-xc16.cmake)

project(cashcontrol C)

find_package(MStack)

add_executable(${CMAKE_PROJECT_NAME}
    src/main.c
    src/usb_descriptors.c
)

set_property(
    TARGET ${CMAKE_PROJECT_NAME}
    PROPERTY C_STANDARD 99
)

target_link_libraries(${CMAKE_PROJECT_NAME} MStack_HID)

# necessary so MStack can find usb_config.h
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE src)

bin2hex(${CMAKE_PROJECT_NAME})


add_custom_target(flash
    DEPENDS ${CMAKE_PROJECT_NAME}
    COMMAND ipecmd -P${XC16_CPU_MODEL} -TPICD3 -F${CMAKE_PROJECT_NAME}.hex -M -OL
    VERBATIM
    COMMENT Flashing to target device
)
