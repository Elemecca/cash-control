#include <xc.h>
#include <stdint.h>

#include "usb.h"
#include "usb_hid.h"
#include "usb_config.h"

#include "main.h"
#include "logger.h"
#include "display.h"



#ifdef __PIC24FJ32GB002__
    _CONFIG1( 0xFFFF
        & JTAGEN_OFF // disable JTAG so we can use its pins for IO
        & ICS_PGx3   // run the emulator on the normal ICSP port
        & FWDTEN_OFF // disable the watchdog timer (TODO: for now)
    )
    _CONFIG2( 0xFFFF
        // start up with the FRC oscillator configured for USB
        // this results in a 32 MHz system clock at startup
        & FNOSC_FRCPLL
        & PLL96MHZ_ON
        & PLLDIV_NODIV // FRC defaults to 4 MHz

        // completely disable the primary (external) oscillator
        & POSCMOD_NONE // disable primary oscillator
        & IESO_OFF     // disable two-speed startup
        & FCKSM_CSDCMD // disable clock switching & monitor
        & OSCIOFNC_ON  // OSCO pin functions as IO
    )
    _CONFIG3( 0xFFFF
        & SOSCSEL_IO // disable the secondary (external) oscillator
    )
    _CONFIG4( 0xFFFF
        & RTCOSC_LPRC // use the LPRC for the RTCC as the SOSC is off
    )
#else
    #error "unsupported MCU model"
#endif



int main (void) {
    logger_init();
    logger("\n********** DEVICE BOOT **********\n");

    dpy_init();
    logger("Display handler initialized\n");

    usb_init();
    logger("USB initialized\n");

    while (1);
    return 0;
}



int8_t usb_app_unknown_setup_request_cb (const struct setup_packet *setup) {
    return process_hid_setup_request( setup );
}
