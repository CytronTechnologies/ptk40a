/*******************************************************************************
* This is the main program for Example 17 using PTK40A PIC Training Board.
*
* Author: ANG JIA YI @ Cytron Technologies Sdn. Bhd.
* Remember to check the Jumper configuration file, also compile and load into PTK40A
*******************************************************************************/
// PTK40A with PIC16F877A 
// This template C file should be compiled with:
// MPLAB IDE v8.63
// HI-TECH C for the PIC10/12/16 MCU Family
// HI-TECH operate in LITE Mode with v9.80
// Last Updated date: 1 June 2012
// Please email support@cytron.com.my if you have any problem

#include <htc.h>		//include hitech C header file
#include "system.h"		//include system header file for PTK40A
#include "adc.h"		//include adc header file, to configure analog pin to digital pin
#include "lcd.h"		//include lcd header file, to enable the functions for LCD
#include "timer1.h"    	// include timer header file, to enable the function for timer1

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
	unsigned char value = 0;	// declare a variable to store 
	unsigned char pre_second = 2, second = 0; //declara the variable to store data
	unsigned char pre_minute = 2, minute = 0; //declara the variable to store data
	unsigned char pre_hour = 2, hour = 0; //declara the variable to store data
	unsigned char pending;
	
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


	// Initialize timer1
	timer1_initialize();	//Initialize timer1 before use

	// Initialize LCD
	lcd_initialize();	//Initialize LCD before use
	

	beep(1); 	//buzzer sound for twice

	LCD_BACKLIGHT = 1;	//activate LCD Backlight

		
	// Please refer to PTK40A schematic for the connection
	// press keypress will display the value on LCD, you will need to release keypad to see value
	//Display Real Time Clock using Timer 1 interrupt. Setting of Hour, Minute and second
	
	timer1_set_seconds(0);
	timer1_set_minutes(0);
	timer1_set_hours(0);	
	lcd_putstr("1=+h 2=+m 3=+S");
	lcd_goto(0x44);
	lcd_putstr("00:00:00");
	while(1) 	// create an infinite loop
	{
		// Reset the seconds.

			if(SW1==0)
			{
				while(SW1==0);
				delay_ms(100);
				timer1_set_hours(hour+=1);	
			}
			else if(SW2==0)
			{
				while(SW2==0);
				delay_ms(200);
				timer1_set_minutes(minute+=1);	
			}
			else if(SW3==0)
			{
				while(SW3==0);
				delay_ms(200);
				timer1_set_seconds(second+=1);	
			}			
			else
			{
				second = uc_timer1_get_seconds();	//obtain second from timer
				minute = uc_timer1_get_minutes();	//obtain second from timer
				hour = uc_timer1_get_hours();	//obtain second from timer
				if(pre_second != second)
				{
					pre_second = second;	//update previous second with current second
					lcd_goto(0xCA);
					lcd_bcd(2,second);	
					beep(1);			
				}	
				if(pre_minute != minute)
				{
					pre_minute = minute;	//update previous second with current second
					lcd_goto(0xC7);
					lcd_bcd(2,minute);	
					beep(1);			
				}	
				if(pre_hour != hour)
				{
					pre_hour = hour;	//update previous second with current second
					lcd_goto(0xC4);
					lcd_bcd(2,hour);	
					beep(1);			
				}			
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


void interrupt w(void)
{
	
	if(TMR1IF == 1)
	timer1_isr();
	
}
	