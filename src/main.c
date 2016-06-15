
#include <xc.h>
#include <stdint.h>

#include "usb.h"
#include "usb_hid.h"
#include "usb_config.h"

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


// the _ISR macro in the device header causes a warning about auto_psv
// see the XC16 Compiler Manual, section 14.8.2
#define ISR __attribute__((interrupt, no_auto_psv))


#define U1TXBUF_LEN 1024

struct {
    char buffer [U1TXBUF_LEN];
    int write;
    int read;
} logbuf = { {}, 0, 0 };

void ISR _U1TXInterrupt (void) {
    int next;

    _U1TXIF = 0;

    while (!U1STAbits.UTXBF && logbuf.read != logbuf.write) {
        U1TXREG = logbuf.buffer[ logbuf.read ];

        next = logbuf.read + 1;
        if (next >= U1TXBUF_LEN) next = 0;
        logbuf.read = next;
    }
}

void logger (const char const *message) {
    int next;

    const char *character = message;
    while (*character != '\0') {
        if (!U1STAbits.UTXBF && logbuf.read == logbuf.write) {
            U1TXREG = *character;
        } else if (logbuf.write == logbuf.read - 1) {
            // the ring buffer is full
            break;
        } else {
            logbuf.buffer[ logbuf.write ] = *character;

            next = logbuf.write + 1;
            if (logbuf.write >= U1TXBUF_LEN) next = 0;
            logbuf.write = next;
        }

        character++;
    }
}


void ISR _SPI1Interrupt (void) {
    _SPI1IF = 0;

    uint16_t time = TMR5;
    TMR5 = 0;

    uint8_t read = SPI1BUF;

    char msg[1024];
    snprintf(msg, 1024, "%06u: %02X\n", time, read);
    logger(msg);
}

int main (void) {
    // configure UART1 for logging
    _RP0R = 3; // U1TX = RP0
    U1MODEbits.PDSEL = 0; // 8 bits, no parity
    U1MODEbits.STSEL = 0; // 1 stop bit
    U1MODEbits.BRGH  = 1; // high baud rate mode
    U1BRG = 34; // ~ 115200 bps (actually 114285.7, 0.8% error)
    U1STAbits.UTXISEL1 = 1; // interrupt on tx FIFO empty
    _U1TXIE = 1; // enable tx interrupt
    _U1RXIE = 0; // disable rx interrupt
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;

    logger("\n********** DEVICE BOOT **********\n");

    // configure SPI1 for display bus
    _SS1R  = 9; // SSI = RP9
    _SCK1R = 8; // SCK = RP8
    _SDI1R = 7; // SDI = RP7
    SPI1CON1bits.CKP    = 1; // clock idle high
    SPI1CON1bits.CKE    = 1;
    SPI1CON1bits.SSEN   = 1; // enable slave select
    SPI1CON1bits.DISSDO = 1; // disable the output pin for now
    SPI1CON2bits.SPIBEN = 0; // enable enhanced buffer mode
    _SPI1IE = 1; // enable interrupt
    SPI1STATbits.SPIEN  = 1;
    logger("SPI bus initialized\n");

    // configure Timer5 to measure SS high time
    _T5CKR = _SS1R; // gate on SPI1 Slave Select
    _T5IE = 0; // disable interrupt
    T5CONbits.TGATE = 1; // gated timer mode
    T5CONbits.TON = 1;
    logger("TMR5 inited for SS timing\n");

    // start up the USB stack
    usb_init();
    logger("USB initialized\n");

    while (1);
    return 0;
}

int8_t usb_app_unknown_setup_request_cb (const struct setup_packet *setup) {
    return process_hid_setup_request( setup );
}
