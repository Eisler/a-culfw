#ifndef _BOARD_COC_H
#define _BOARD_COC_H

/*********************************/
/* Will I listen on serial line? */
/*********************************/

#define BOOT_SERIAL          	

/* UART Baudrate */
#define BAUDRATE 38400
/* use "Double Speed Operation" */
#define UART_DOUBLESPEED

#define UART_STACKED

/* where is the conditional switch located? */

/*  GPIO3 */

#define BOOT_PORT               PORTC
#define BOOT_DDR                DDRC
#define BOOT_IN                 PINC
#define BOOT_PIN                0
#define BOOT_LOWACTIVE

/*  GPIO2 */

#define SWITCH_PORT             PORTC
#define SWITCH_DDR              DDRC
#define SWITCH_IN               PINC
#define SWITCH_PIN              1
#define SWITCH_LOWACTIVE

#define LED_PORT                PORTC
#define LED_DDR                 DDRC
#define LED_PIN                 6

#define LED1_PORT                PORTC
#define LED1_DDR                 DDRC
#define LED1_PIN                 7

#define LED2_PORT                PORTD
#define LED2_DDR                 DDRD
#define LED2_PIN                 4

#endif


