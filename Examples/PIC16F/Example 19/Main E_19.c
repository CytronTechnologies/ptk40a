/*******************************************************************************
* This is the main program for Example 19 using PTK40A PIC Training Board.
*
* Author: ANG JIA YI @ Cytron Technologies Sdn. Bhd.
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
#include "pwm.h"
#include "skps.h"
#include "uart.h"
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
void delay_10us(unsigned char uc_value);
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
	unsigned char angle = 0;	// declare a variable to store angle
	unsigned char i = 0,j = 0;
	unsigned char lx = 0, ly = 0, ry = 0;
	unsigned int rx = 0;
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

	pwm_initialize();

	uart_initialize();
		
	beep(2); 	//buzzer sound for twice
		
	// PTK40A come SKPS PORT TO USE SKPS
	// SKPS, control DC motor speed and RC servo motor
	// Please connect SKPS at the "Cytron Starter Kit" section
	// Select 9600 as the baud rate on SKPS
	// servo require the PCM at around 20ms period
	// Please move jumper JP9 to SERVO, JP10 to PWM, JP20 & 21 to DC MOTOR
	
	M1 = 1;
	M2 = 0;		// drive motor in a direction
	while(1) 	// create an infinite loop
	{
		lx = uc_skps(p_joy_lx);	//obtain left joystick x axis value
		ly = uc_skps(p_joy_ly); //obtain left joystick y axis value
		rx = uc_skps(p_joy_rx); //obtain right joystick x axis value
		ry = uc_skps(p_joy_ry); //obtain right joystick y axis value
		
		//control dc motor using joyleft
		if(lx==128 && ly==128)
		{
			pwm_set_duty_cycle(0);		
		}	
		//if(lx!=128 && ly!=128)
		else if(ly==0)
		{
			pwm_set_duty_cycle(1000);		//set dc motor speed in differect coordinate
		}
		else if(lx==0)
		{
			pwm_set_duty_cycle(350);
		}
		else if(ly==255)
		{
			pwm_set_duty_cycle(500);
		}
		else if(lx==255)
		{
			pwm_set_duty_cycle(750);
		}
		
		//control servo motor using joyright
		if(ry==0)
		{
		SERVO = 1;		// Servo pin HIGH
		delay_10us(100);
		SERVO = 0;	// Servo pin LOW
		delay_ms(18);	// delay for around 18ms
		}
		else if(rx==0)
		{
		SERVO = 1;		// Servo pin HIGH
		delay_10us(130);
		SERVO = 0;	// Servo pin LOW
		delay_ms(18);	// delay for around 18ms
		}
		else if(ry==255)
		{
		SERVO = 1;		// Servo pin HIGH
		delay_10us(160);
		SERVO = 0;	// Servo pin LOW
		delay_ms(18);	// delay for around 18ms
		}
		else if(rx==255)
		{
		SERVO = 1;		// Servo pin HIGH
		delay_10us(200);
		SERVO = 0;	// Servo pin LOW
		delay_ms(18);	// delay for around 18ms
		}			
	}		
	while(1) continue;	// infinite loop to prevent PIC from reset if there is no more program	
}
/*******************************************************************************
* PRIVATE FUNCTION: delay_10us
*
* PARAMETERS:
* ~ uc_value	- The period for the delay in 10 microseconds.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Delay in 10 microseconds.
*
*******************************************************************************/
void delay_10us(unsigned char uc_value)
{
	while (uc_value-- > 0) {
		__delay_us(10);		// macro from HI-TECH compiler which will generate 10us delay base on value of _XTAL_FREQ in system.h
	}	
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
