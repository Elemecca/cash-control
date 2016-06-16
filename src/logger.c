#include <xc.h>

#include "main.h"
#include "logger.h"

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

void logger_init (void) {
    // configure UART1 for logging
    _RP0R = 3; // U1TX = RP0
    U1MODEbits.PDSEL = 0; // 8 bits, no parity
    U1MODEbits.STSEL = 0; // 1 stop bit
    U1MODEbits.BRGH  = 1; // high baud rate mode
    U1BRG = 34; // ~ 115200 bps (actually 114285.7, 0.8% error)
    U1STAbits.UTXISEL1 = 1; // interrupt on tx FIFO empty
    _U1TXIF = 0;
    _U1TXIP = 0;
    _U1TXIE = 1; // enable tx interrupt
    _U1RXIE = 0; // disable rx interrupt
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;
}
