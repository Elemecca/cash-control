
#include <xc.h>

#ifdef __PIC24FJ32GB002__
    // start up with the FRC oscillator configured for USB
    // this results in a 32 MHz system clock at startup
    #pragma config FNOSC = FRCPLL
    #pragma config PLL96MHZ = ON
    #pragma config PLLDIV = NODIV // FRC defaults to 4 MHz

    // completely disable the primary (external) oscillator
    #pragma config POSCMOD = NONE // disable primary oscillator
    #pragma config IESO = OFF     // disable two-speed startup
    #pragma config FCKSM = CSDCMD // disable clock switching & monitor
    #pragma config OSCIOFNC = ON  // OSCO pin functions as IO

    // disable the secondary (external) oscillator
    #pragma config SOSCSEL = IO
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
} u1txbuf = { {}, 0, 0 };

void ISR _U1TXInterrupt (void) {
    int next;

    _U1TXIF = 0;

    while (!U1STAbits.UTXBF && u1txbuf.read != u1txbuf.write) {
        U1TXREG = u1txbuf.buffer[ u1txbuf.read ];

        next = u1txbuf.read + 1;
        if (next >= U1TXBUF_LEN) next = 0;
        u1txbuf.read = next;
    }
}

void u1_write (const char const *message) {
    int next;

    const char *character = message;
    while (*character != '\0') {
        if (!U1STAbits.UTXBF && u1txbuf.read == u1txbuf.write) {
            U1TXREG = *character;
        } else if (u1txbuf.write == u1txbuf.read - 1) {
            // the ring buffer is full
            break;
        } else {
            u1txbuf.buffer[ u1txbuf.write ] = *character;

            next = u1txbuf.write + 1;
            if (u1txbuf.write >= U1TXBUF_LEN) next = 0;
            u1txbuf.write = next;
        }

        character++;
    }
}

int main (void) {
    // configure RB0 for a flashing LED
    _TRISB0 = 0;
    _ODB0   = 0;
    _LATB0 = 1;

    // configure UART1
    _U1RXR = 1; // U1RX = RP1
    _RP2R  = 3; // U1TX = RP2
    U1MODEbits.PDSEL = 0; // 8 bits, no parity
    U1MODEbits.STSEL = 0; // 1 stop bit
    U1MODEbits.BRGH  = 1; // high baud rate mode
    U1BRG = 34; // ~ 115200 bps (actually 114285.7, 0.8% error)
    U1STAbits.UTXISEL1 = 1; // interrupt on tx FIFO empty
    _U1TXIE = 1; // enable tx interrupt
    _U1RXIE = 0; // disable rx interrupt

    // enable the UART
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;

    T2CONbits.TCKPS = 0x3; // prescale 1:256
    T2CONbits.TON = 1;
    while (1) {
        _LATB0 = ~_LATB0;
        u1_write( "Hello, world.\n" );

        // sleep for 1s (16 MHz * 1:256)
        TMR2 = 0;
        while (TMR2 < 62500);
    }
    return 0;
}
