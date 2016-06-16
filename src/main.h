#ifndef MAIN_H_
#define MAIN_H_

// the _ISR macro in the device header causes a warning about auto_psv
// see the XC16 Compiler Manual, section 14.8.2
#define ISR      __attribute__((interrupt, no_auto_psv))
#define ISR_PSV  __attribute__((interrupt, auto_psv))

#endif
