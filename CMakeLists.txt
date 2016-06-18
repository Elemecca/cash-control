cmake_minimum_required(VERSION 3.5)

# set up the Microchip cross toolchain
set(CMAKE_TOOLCHAIN_FILE external/cmake-microchip/toolchain.cmake)

# set the default MCU model
set(MICROCHIP_MCU PIC24FJ32GB002)

project(cashcontrol C)

find_package(MStack)

add_executable(${CMAKE_PROJECT_NAME}
    src/main.c
    src/logger.c
    src/display.c
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
    COMMAND ipecmd -P${MICROCHIP_MCU_MODEL} -TPICD3 -F${CMAKE_PROJECT_NAME}.hex -M -OL
    VERBATIM
    COMMENT Flashing to target device
)
