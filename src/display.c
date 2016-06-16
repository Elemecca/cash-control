#include <xc.h>
#include <stdint.h>

#include "main.h"
#include "logger.h"
#include "display.h"


void ISR _SPI1Interrupt (void) {
    _SPI1IF = 0;

    uint16_t time = TMR5;
    TMR5 = 0;

    uint8_t read = SPI1BUF;

    char msg[1024];
    snprintf(msg, 1024, "%06u: %02X\n", time, read);
    logger(msg);
}

void dpy_init (void) {
    // configure SPI1 for the host-side display bus
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

    // configure Timer5 to measure SS high time
    _T5CKR = _SS1R; // gate on SPI1 Slave Select
    _T5IE = 0; // disable interrupt
    T5CONbits.TGATE = 1; // gated timer mode
    T5CONbits.TON = 1;
}
