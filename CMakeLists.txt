cmake_minimum_required(VERSION 2.8)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake")
set(CMAKE_TOOLCHAIN_FILE CMake/toolchain-xc16.cmake)

project(cashcontrol C)

add_executable(${CMAKE_PROJECT_NAME}.elf
    src/main.c
)

# Build the HEX file used to flash the device.
# This approach feels wrong: the HEX file should really have a
# make target of its own which should be in the default set.
# However the other form of `add_custom_command` doesn't get
# added to the default target and `add_custom_target` doesn't
# support dependencies for conditional execution. The wrongness
# is reinforced by the fact that we have to tell CMake about the
# extra output file for the clean task.
add_custom_command(
    TARGET ${CMAKE_PROJECT_NAME}.elf
    POST_BUILD
    COMMAND ${XC16_BIN2HEX} ${CMAKE_PROJECT_NAME}.elf
    COMMENT "Creating HEX file for flashing"
    VERBATIM
)
set_directory_properties(
    PROPERTY ADDITIONAL_MAKE_CLEAN_FILES
    ${CMAKE_PROJECT_NAME}.hex
)
