/*******************************************************************************
* This is the main program for Example 10 using PTK40A PIC Training Board.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
* Remember to check the Jumper configuration file, also compile and load into PTK40A
*******************************************************************************/
// PTK40A with PIC16F877A 
// This template C file should be compiled with:
// MPLAB IDE v8.63
// HI-TECH C for the PIC10/12/16 MCU Family
// HI-TECH operate in LITE Mode with v9.80 or v9.83
// Last Updated date: 20 April 2013
// Please email support@cytron.com.my if you have any problem

#include <htc.h>		//include hitech C header file
#include "system.h"		//include system header file for PTK40A
#include "adc.h"		//include adc header file, to configure analog pin to digital pin

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
	
	beep(2); 	//buzzer sound for twice
		
	// PTK40A come with an ADC input (RA0), 3 different source can be connected to ADC in
	// There are LM35 temperature sensor, Potentiometer and external sensor
	// There is also a RC Servo motor
	// Please refer to PTK40A schematic for the connection
	// Turning the potentiometer will change the RC servo motor position
	// Please move JP9 to SERVO, JP14 to POT (under ADC)
	adc_on();	//activate ADC module in PIC
	
	// servo require the PCM at around 20ms period
	while(1) 	// create an infinite loop
	{
		angle = ui_adc_read()>>2;	//read adc value, from potential meter
									//use the 8-bit data only
		SERVO = 1;		// Servo pin HIGH
		delay_10us(50);	// wait for a while
		
		// since it is 10-bit ADC, maximum is 1023
		// but the limit of angle is around 180, thus divide by 4
		// maximum become 255	
		if (angle <= 130) // if the angle value is larger than 130 and less than 0, apply the delay
		{
			delay_10us(angle);	//delay extra depend on adc value from potential meter		
		}	
		else 
		delay_10us(130);	//to make sure that if the value is too big, the servo motor will no overshoot
						
		SERVO = 0;	// Servo pin LOW
		delay_ms(18);	// delay for around 18ms					
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


