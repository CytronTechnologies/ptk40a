/*******************************************************************************
* This is the header file that describes the system properties for PTK40A
* For PIC18F using MPLAB C18 Compiler
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/
// Oscillator Frequency, 
#if defined (__18F4550)
#define	_XTAL_FREQ		48000000	//if PIC18F4550 is defined, default configuration bits will 
									//result in Fosc to 48MHz with 20MHz Crystal

#elif defined (__18F4520)
#define	_XTAL_FREQ		20000000	//if PIC18F4520 is defined, default configuration bits will 
									//result in Fosc to 20MHz with 20MHz Crystal
#endif
									
// UART baud rate
#define UART_BAUD		9600

// I/O Connections.
// Parallel 2x16 Character LCD
#define LCD_E				LATAbits.LATA3	// E clock pin is connected to RA3	
#define LCD_RS			LATAbits.LATA2	// RS pin is used for LCD to differentiate data is command or character, RA2
#define LCD_BACKLIGHT	LATAbits.LATA1	// Back light of LCD, active high, connected to RA1

#define	LCD_DATA		LATD	// Data Latch of LCD is connected to PORTD, 8 bit mode
								// DB7(LCD) = RD7(PIC)
								// DB6(LCD) = RD6(PIC)
								// DB5(LCD) = RD5(PIC)
								// DB4(LCD) = RD4(PIC)
								// DB3(LCD) = RD3(PIC)
								// DB2(LCD) = RD2(PIC)
								// DB1(LCD) = RD1(PIC)
								// DB0(LCD) = RD0(PIC)

// most of the output port is connected to LED. 
//Thus, no dedicated LED is allocated for PTK40A

// Push button on PTK40A, pull high
#define SW1		PORTBbits.RB0
#define SW2		PORTBbits.RB1
#define SW3		PORTBbits.RB2

// Digital input pin, pull high
#define DIGITAL_IN		PORTBbits.RB3

// Relay, is an output, active high
#define RELAY			LATAbits.LATA5

// Buzzer, active high
#define BUZZER		LATCbits.LATC2

// L293B, H-Bridge IC to drive either DC brush or Stepper Motor
#define L293_EN		LATCbits.LATC2		// this pin is connected to Enable of L293 H-bridge driver, it is being use for speed control

// L293 pin for DC Brushed Motor
#define M1		LATBbits.LATB4
#define M2		LATBbits.LATB5

// L293 pin for stepper motor
#define X			LATBbits.LATB4
#define XN		LATBbits.LATB5
#define Y			LATBbits.LATB6
#define YN		LATBbits.LATB7

// RC Servo signal pin
#define SERVO	LATEbits.LATE2

// 7-segment decoder
#define S7_0		LATDbits.LATD0	//connected to CD4511 
#define S7_1		LATDbits.LATD1	//connected to CD4511 
#define S7_2		LATDbits.LATD2	//connected to CD4511 
#define S7_3		LATDbits.LATD3	//connected to CD4511 
#define S7_DATA		LATD	
#define S7_L1		LATEbits.LATE1	//connected to CD4511 7-Seg1's Latch Enable 
#define S7_L2		LATEbits.LATE0	//connected to CD4511 7-Seg2's Latch Enable 

// 4x4 Keypad
#define KP_R1		LATDbits.LATD4	// Row 1
#define KP_R2		LATDbits.LATD5	// Row 2
#define KP_R3		LATDbits.LATD6	// Row 3
#define KP_R4		LATDbits.LATD7	// Row 4

#define KP_C1		PORTBbits.RB0		// Colomn 1
#define KP_C2		PORTBbits.RB1		// Colomn 2
#define KP_C3		PORTBbits.RB2		// Colomn 3
#define KP_C4		PORTBbits.RB3		// Colomn 4

//SPI EEPROM Chip 25AA020A
#define SPI_EEPROM_CSN	LATAbits.LATA5		//SPI Chip Select pin

//SK's Reset pin
#define SK_RESET		LATEbits.LATE2