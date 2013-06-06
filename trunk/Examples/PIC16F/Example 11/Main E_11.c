/*******************************************************************************
* This is the main program for Example 11 using PTK40A PIC Training Board.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
* Remember to check the Jumper configuration file, also compile and load into PTK40A
*******************************************************************************/
// PTK40A with PIC16F877A 
// This template C file should be compiled with:
// MPLAB IDE v8.85
// HI-TECH C for the PIC10/12/16 MCU Family
// HI-TECH operate in LITE Mode with v9.80 or v9.83
// Last Updated date: 6 June 2013
// Please email support@cytron.com.my if you have any problem

#include <htc.h>		//include hitech C header file
#include "system.h"		//include system header file for PTK40A
#include "adc.h"		//include adc header file, to configure analog pin to digital pin
#include "lcd.h"		//include lcd header file, to enable the functions for LCD

/*******************************************************************************
* DEVICE CONFIGURATION WORDS                                                   *
*******************************************************************************/
// This configuration bits are for PIC16F877A using 20MHz Crystal or HS for OSC
#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is being used
__CONFIG(HS &			// High Speed Crystal.
		 WDTDIS &		// Disable Watchdog Timer.
		 PWRTEN &		// Enable Power Up Timer.
		 BORDIS &		// Disable Brown Out Reset.
		 LVPDIS);		// Disable Low Voltage Programming.

#elif defined (HITECH_V9_82)		//else if Hi-Tech V9.82 compiler is being used
// If Hi-TECH C Compiler v9.82 is use, this configuration bit should be used
__CONFIG(FOSC_HS &			// High Speed Crystal.
		 WDTE_OFF &		// Disable Watchdog Timer.
		 PWRTE_ON &		// Enable Power Up Timer.
		 BOREN_OFF &		// Disable Brown Out Reset.
		 LVP_OFF);		// Disable Low Voltage Programming.
#endif	//end of pre-processor if condition
/*******************************************************************************
* Defination of label		                                                  *
*******************************************************************************/

/*******************************************************************************
* PRIVATE FUNCTION PROTOTYPES                                                  *
*******************************************************************************/
void delay_ms(unsigned int ui_value);
void beep(unsigned char uc_count);

/*******************************************************************************
* Global Variables                                                             *
*******************************************************************************/

/*******************************************************************************
* MAIN FUNCTION                                                                *
*******************************************************************************/
int main(void)
{
	unsigned char distance = 0;	// declare a variable to store distance 
	// ensure all the hardware port in zero initially
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
	PORTD = 0;
	PORTE = 0;

	// Initialize the I/O port direction, this must be configured according to circuit
	// please refer to PTK40A schematic for details
	// TRISX control pin direction, output pin must be configure as '0'
	// while input must be configure as '1'
	TRISA = 0b00010001;
	TRISB = 0b00001111;
	TRISC = 0b10010011;
	TRISD = 0;
	TRISE = 0;

	// Initialize ADC.
	adc_initialize();	//Ensure pin share with analog is being configured to digital correctly
	
	// Initialize LCD
	lcd_initialize();	//Initialize LCD before use
	
	beep(2); 	//buzzer sound for twice
		
	// PTK40A come with an ADC input (RA0), 3 different sources can be connected to ADC in
	// There are LM35 temperature sensor, Potentiometer and external sensor
	// This example will use external ADC to read information from Ultrasonic Range Finder
	// EZ1 from Maxbotix. 
	// Connect GND of EZ1 to GND of PTK40A (ADC external port)
	// Connect +5 of EZ1 to 5V of PTK40A (ADC external port)
	// Connect AN of EZ1 to IN of PTK40A (ADC external port)
	// Please refer to PTK40A schematic for the connection
	// Please move JP14 to EXT (under ADC)
	adc_on();	//activate ADC module in PIC
		
	LCD_BACKLIGHT = 1;	//activate LCD Backlight
	
	lcd_putstr("Cytron PTK40A");	//display message on LCD
	lcd_2ndline();				//move cursor to 2nd line
	lcd_putstr("Ultrasonic:");
	lcd_goto(0X4E);
	lcd_putchar('"');	// display symbol of inch	
	while(1) 	// create an infinite loop
	{
		// Please refer to EZ1 datasheet for details
		// 1 inch is 10mV from EZ1
		// 10-bit ADC has 4.88mV of resolution
		// Thus inch = ADC x 0.488
		distance = ((unsigned long)ui_adc_read()* 488)/1000;	// read from EZ1 and convert to inch
		lcd_goto(0x4B);	//move cursor to after Ultrasonic: on LCD
		lcd_bcd(3,distance);	// display distance in inch	on LCD	
	}	
	
		
	while(1) continue;	// infinite loop to prevent PIC from reset if there is no more program	
}

/*******************************************************************************
* PRIVATE FUNCTION: delay_ms
*
* PARAMETERS:
* ~ ui_value	- The period for the delay in miliseconds.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Delay in miliseconds.
*
*******************************************************************************/
void delay_ms(unsigned int ui_value)
{
	while (ui_value-- > 0) {
		__delay_ms(1);		// macro from HI-TECH compiler which will generate 1ms delay base on value of _XTAL_FREQ in system.h
	}	
}

/*******************************************************************************
* PRIVATE FUNCTION: beep
*
* PARAMETERS:
* ~ uc_count	- How many times we want to beep.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Beep for the specified number of times.
*
*******************************************************************************/
void beep(unsigned char uc_count)
{
	while (uc_count-- > 0) {
		BUZZER = 1;	//buzzer is share at RC2 pin
		delay_ms(80);
		BUZZER = 0;
		delay_ms(100);
	}
}


