#.rst:
# FindMStack
# -----------
#
# Finds the M-Stack USB stack for Microchip PIC MCUs.

set(MStack_ROOT external/m-stack
    CACHE PATH "the root of the M-Stack source checkout"
)
get_filename_component(MStack_ROOT "${MStack_ROOT}" ABSOLUTE)

set(MStack_USB_ROOT ${MStack_ROOT}/usb)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MStack
    REQUIRED_VARS
        MStack_ROOT
)

if(NOT MStack_FOUND)
    return()
endif()

add_library(MStack INTERFACE)
target_sources(MStack INTERFACE
    ${MStack_USB_ROOT}/src/usb.c
)
target_include_directories(MStack INTERFACE
    ${MStack_ROOT}/usb/include
)

add_library(MStack_HID INTERFACE)
target_sources(MStack_HID INTERFACE
    ${MStack_USB_ROOT}/src/usb_hid.c
)
target_link_libraries(MStack_HID
    INTERFACE MStack
)
