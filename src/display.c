#include <xc.h>
#include <stdint.h>

#include "main.h"
#include "logger.h"
#include "display.h"

int spi_new_frame = 0;

void ISR _INT2Interrupt (void) {
    _INT2IF = 0;
    spi_new_frame = 1;
}

void ISR _SPI1Interrupt (void) {
    _SPI1IF = 0;

    uint8_t read = SPI1BUF;
    char msg[] = { ' ', '0', '0', '\0' };

    if (spi_new_frame) msg[0] = '\n';
    spi_new_frame = 0;

    msg[1] += ((read >> 4) & 0x0F);
    if (msg[1] > '9') msg[1] += 7;

    msg[2] += (read & 0x0F);
    if (msg[2] > '9') msg[2] += 7;

    logger(msg);
}

void dpy_init (void) {
    _TRISB9 = 1;
    _TRISB8 = 1;
    _TRISB7 = 1;

    // configure SPI1 for the host-side display bus
    _SS1R  = 9; // SSI = RP9
    _SCK1R = 8; // SCK = RP8
    _SDI1R = 7; // SDI = RP7
    SPI1CON1bits.CKP    = 1; // clock idle high
    SPI1CON1bits.CKE    = 1;
    SPI1CON1bits.SSEN   = 1; // enable slave select
    SPI1CON1bits.DISSDO = 1; // disable the output pin for now
    SPI1CON2bits.SPIBEN = 0; // enable enhanced buffer mode
    _SPI1IF = 0;
    _SPI1IP = 2;
    _SPI1IE = 1; // enable interrupt
    SPI1STATbits.SPIEN  = 1;

    // configure External INT2 to detect SS frames
    _INT2R = _SS1R; // INT2 = SSI
    _INT2EP = 1; // interrupt on falling edge
    _INT2IF = 0;
    _INT2IP = 3; // must be higher than SPI IP
    _INT2IE = 1;
}
