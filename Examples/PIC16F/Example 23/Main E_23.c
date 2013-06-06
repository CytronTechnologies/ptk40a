/*******************************************************************************
* This is the main program for Example 23 using PTK40A PIC Training Board.
*
* Author: Ang Jia Yi @ Cytron Technologies Sdn. Bhd.
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
#include "keypad.h"		//include keypad header file, to enable the functions of reading keypad

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
unsigned char password[]={1,2,3,4,5,6};	//default password is 123456
unsigned char key_in[6];

/*******************************************************************************
* MAIN FUNCTION                                                                *
*******************************************************************************/
int main(void)
{
	unsigned char error = 0;	// declare a variable to store 
	unsigned char i = 0;
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
	
	LCD_BACKLIGHT = 1;	//activate LCD Backlight
	
	
	// PTK40A use 4x4 matrix keypad, it have 16 key press.
	// Please refer to PTK40A schematic for the connection
	// Please refer to keypad.c for the details of function works
	// We need to key in the password=123456 to unlock the lock
	// The lock is lock until the correct password is key in
	// Make sure JP7 is move to RELAY, JP10 move to BUZZER
	
	RELAY=0;	//off relay but on the lock system
	while(1) 	// create an infinite loop
	{
		lcd_clear();
		lcd_putstr("Password 6 digit\n:");
		error = 0;
		for(i=0;i<=5;i++)					//keyin password and compare
		{
			key_in[i] = c_wait_keypad();	//record key press
			beep(1);
			if(password[i] != key_in[i])		//compare system password with user key in
			{	
			error ++;						//accumulate error to see error value	
			}	
			lcd_putchar('*');			// to display you have press key but not display out the password
		}
			
		if(error != 0)	//if error is not zero mean there is at least 1 wrong key
		{			
			RELAY=0;	//makesure the magnetic lock is activated
			lcd_clear();
			lcd_putstr("ERROR");		//wrong password pop up error and cannot open
			beep(5);
			delay_ms(4000);			
		}
		else	//else means all keys are correct
		{	
			beep(2);
			RELAY=1;	//deactivate the magnetic lock
			lcd_clear();				//once all check compleate and correct. the lock unlocked
			lcd_putstr("SUCCESS!\nPlease enter!");
			delay_ms(4000);	
			RELAY=0;	//reactive the magnetic lock
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


