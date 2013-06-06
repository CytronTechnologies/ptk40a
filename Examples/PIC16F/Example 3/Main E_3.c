/*******************************************************************************
* This is the main program for Example 3 using PTK40A PIC Training Board.
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
#include "seg7.h"		//include seg7 header file, to work with 7 segment on PTK40A

/*******************************************************************************
* DEVICE CONFIGURATION WORDS                                                   *
*******************************************************************************/
// This configuration bits are for PIC16F877A using 20MHz Crystal or HS for OSC
#if((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ <= 80)) //if Hi-Tech V9.80 or lower version of compiler is being used
__CONFIG(HS &			// High Speed Crystal.
		 WDTDIS &		// Disable Watchdog Timer.
		 PWRTEN &		// Enable Power Up Timer.
		 BORDIS &		// Disable Brown Out Reset.
		 LVPDIS);		// Disable Low Voltage Programming.

#elif((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ > 80)) //else if Hi-Tech greater than V9.80 compiler is being used
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
	unsigned char value = 0;	// declare a variable to store 
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
	
	// Initialize 7 segments
	seg7_initialize();	//Ensure 7 segment is blank at beginning
	
	beep(2);	//buzzer sound twice
	
	// There are two 7 segment (common cathode) on PTK40A, each 7-segment is drive using CD4511 encoder
	// Please refer to CD4511 datasheet and PTK40A schematic for the connection
	// Pressing SW1 will start the display of 7 segments
	// It will increase from 00 to 99 with interval around 0.5 second and repeat 
	while (SW1 == 1) continue; 	//wait for SW1 to be press
	
	while(1) 	// create an infinite loop
	{
		for(value = 0; value <100; value ++)
		{
			seg7_com_dis(value);	// this the value on two unit of 7 segment
			delay_ms(500);			// delay for around 0.5 second
		}
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


