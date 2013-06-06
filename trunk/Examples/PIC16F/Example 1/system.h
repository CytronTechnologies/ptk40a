/*******************************************************************************
* This is the header file that describes the system properties for PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

// Oscillator Frequency, if crystal is changed, please change the value of "20000000"
#define	_XTAL_FREQ		20000000

// UART baud rate
#define UART_BAUD		9600

// I/O Connections.
// Parallel 2x16 Character LCD
#define LCD_E			RA3		// E clock pin is connected to RA3	
#define LCD_RS			RA2		// RS pin is used for LCD to differentiate data is command or character, RA2
#define LCD_BACKLIGHT	RA1		// Back light of LCD, active high, connected to RA1

#define	LCD_DATA		PORTD	// Data port of LCD is connected to PORTD, 8 bit mode
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
#define SW1				RB0
#define SW2				RB1
#define SW3				RB2

// Digital input pin, pull high
#define DIGITAL_IN		RB3

// Relay, is an output, active high
#define RELAY			RA5

// Buzzer, active high
#define BUZZER			RC2

// L293B, H-Bridge IC to drive either DC brush or Stepper Motor
#define L293_EN			RC2		// this pin is connected to Enable of L293 H-bridge driver, it is being use for speed control

// L293 pin for DC Brushed Motor
#define M1				RB4
#define M2				RB5

// L293 pin for stepper motor
#define X				RB4
#define XN				RB5
#define Y				RB6
#define YN				RB7

// RC Servo signal pin
#define SERVO			RE2

// 7-segment decoder
#define S7_0			RD0		//connected to CD4511 
#define S7_1			RD1		//connected to CD4511 
#define S7_2			RD2		//connected to CD4511 
#define S7_3			RD3		//connected to CD4511 
#define S7_DATA			PORTD	
#define S7_L1			RE1		//connected to CD4511 7-Seg1's Latch Enable 
#define S7_L2			RE0 	//connected to CD4511 7-Seg2's Latch Enable 

// 4x4 Keypad
#define KP_R1			RD4		// Row 1
#define KP_R2			RD5		// Row 2
#define KP_R3			RD6		// Row 3
#define KP_R4			RD7		// Row 4

#define KP_C1			RB0		// Colomn 1
#define KP_C2			RB1		// Colomn 2
#define KP_C3			RB2		// Colomn 3
#define KP_C4			RB3		// Colomn 4

//SPI EEPROM Chip 25AA020A
#define SPI_EEPROM_CSN	RA5		//SPI Chip Select pin

//SK's Reset pin
#define SK_RESET		RE2