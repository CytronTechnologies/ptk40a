/*******************************************************************************
* This is the main program for Example 9 using PTK40A PIC Training Board.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
* Remember to check the Jumper configuration file, also compile and load into PTK40A
*******************************************************************************/
// PTK40A with PIC18F4550 or PIC18F4520
// This template C file should be compiled with:
// MPLAB X IDE v1.70
// XC8 C Compiler for the 8-bit PIC Family
// XC8 Compiler operates in LITE Mode with v1.12
// Last Updated date: 10 June 2014
// Please email support@cytron.com.my if you have any problem


#include <xc.h>         //include the PIC18F model of PIC header file
#include "system.h"	//include system header file for PTK40A
#include "adc.h"	//include adc functions header file



/*******************************************************************************
* DEVICE CONFIGURATION WORDS                                                   *
*******************************************************************************/
#if defined (__18F4520) 		//if this test file is compiled for PIC18F4520
	//Configuration bits for PIC18F4520
	#pragma config OSC = HS		// Maximum Fosc is 40MHz, so if 20MHz external crystal is used, need to select HS
	//#pragma config OSC = HSPLL	// Maximum Fosc is 40MHz, so HSPLL is select, please change external crystal to 10MHz
	//#pragma config OSC = INTIO67	// Using internal 8MHz Oscillator, RA6 and RA7 as normal IO pin
	#pragma config FCMEN = ON 	// Fail-Safe Clock Monitor Enable bit
	#pragma config IESO = ON		// Internal/External Oscillator Switchover Enable bit
	#pragma config PWRT = ON		// Power Up Timer Enable bit 
	#pragma config BOREN = OFF 	// Brown-out Reset Enable bits
	#pragma config WDT = OFF 		// Watch-Dog Timer Enable bit
	#pragma config CCP2MX = PORTC	//CCP2 at RC1
	#pragma config PBADEN = ON	// PORTB analog pin as analog input after Reset	
	#pragma config LPT1OSC = OFF	// Timer 1 configured for high power operation 
	#pragma config MCLRE = ON		// MCLR pin enable, RE3 input disabled
	#pragma config STVREN = ON	//Stack overflow will cause Reset
	#pragma config LVP = OFF 		// Low voltage programming disable
	#pragma config XINST = OFF		// Instruction set extension and Indexed Addressing mode enabled 
	#pragma config DEBUG = OFF	// Debug disable, RB6 and RB7 as normal IO

#elif defined (__18F4550) 	//if this test file is compiled for PIC18F4550
	//Configuration bits for PIC18F4550
	//#pragma config FOSC = HS		// Maximum Fosc is 48MHz, so if 20MHz external crystal is used, need to select HS
	#pragma config FOSC = HSPLL_HS		// Maximum Fosc is 48MHz, so HSPLL is select, 20MHz can be used, but need to select correct CPUDIV
	//#pragma config FOSC = INTOSC_HS	// Using internal Oscillator, HS use for USB
	#pragma config PLLDIV = 5		//20MHz divide by 5 to obtain 4MHz to enter PLL and become 96MHz
	#pragma config CPUDIV = OSC1_PLL2	//Primary Oscillator source is 96MHz/2
	#pragma config USBDIV = 2		//USB peripheral clock source from 96MHz / 2
	#pragma config FCMEN = ON 	// Fail-Safe Clock Monitor Enable bit
	#pragma config IESO = ON		// Internal/External Oscillator Switchover Enable bit
	#pragma config PWRT = ON		// Power Up Timer Enable bit 
	#pragma config BOR = OFF 	// Brown-out Reset Enable bits
	#pragma config WDT = OFF 		// Watch-Dog Timer Enable bit
	#pragma config VREGEN = ON	//Enable USB Voltage Regulator
	#pragma config CCP2MX = ON	//CCP2 at RC1
	#pragma config PBADEN = ON	// PORTB analog pin as analog input after Reset	
	#pragma config LPT1OSC = OFF	// Timer 1 configured for high power operation 
	#pragma config MCLRE = ON		// MCLR pin enable, RE3 input disabled
	#pragma config STVREN = ON	//Stack overflow will cause Reset
	#pragma config LVP = OFF 		// Low voltage programming disable
	#pragma config XINST = OFF		// Instruction set extension and Indexed Addressing mode enabled 			
	#pragma config DEBUG = OFF	// Debug disable, RB6 and RB7 as normal IO
	#pragma config WRTB = ON		//Boot Block Write Protect Enable
#endif
/*******************************************************************************
* Defination of label		                                                  *
*******************************************************************************/


/*******************************************************************************
* PRIVATE FUNCTION PROTOTYPES                                                  *
*******************************************************************************/

void delay_10us(unsigned int ui_microsecond);
void delay_ms(unsigned int ui_millisecond);
void beep(unsigned char uc_count);

/*******************************************************************************
* Global Variables                                                             *
*******************************************************************************/



/*******************************************************************************
* MAIN FUNCTION                                                                *
*******************************************************************************/
int main(void)
{
	unsigned char step = 0;	// declare a variable to store stepper step sequence
	unsigned int delay = 0;	// declare a variable for stepper delay, need to be 16-bit for > 255
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

	// PTK40A come with an ADC input (RA0), 3 different source can be connected to ADC in
	// There are LM35 temperature sensor, Potentiometer and external sensor
	// There is also a stepper motor
	// Please refer to PTK40A schematic for the connection
	// Turning the potentiometer clock wise will change the speed of stepper rotation
	// Please move JP10 to PWM, JP14 to POT, JP20&21 to STEPPER, JP23&24 to UNIPOLAR
	adc_on();	//activate ADC module in PIC
	step = 1;	//initial step is 1
	RC2 = 1;	//RC2 pin is the PWM pin, in stepper case, the PWM is always 1

	while(1) 	// create an infinite loop
	{
		if(step >= 5) step = 1;	// reset the step sequance to 1

		delay = ui_adc_read();
		if (delay > 10) // if delay is larger than 10, enter stepping
		{
			switch (step)
			{
				case 1:
				X = 1;			// step 1
				Y = 0;
				XN = 0;
				YN = 0;
				break;

				case 2:
				X = 0;			// step 2
				Y = 1;
				XN = 0;
				YN = 0;
				break;

				case 3:
				X = 0;			// step 3
				Y = 0;
				XN = 1;
				YN = 0;
				break;

				case 4:
				X = 0;			// step 4
				Y = 0;
				XN = 0;
				YN = 1;
				break;
			}//switch (step)
			delay_ms(delay);
			step ++;	// increase step
		}//if(delay > 10)
	}	// while (1)

	while(1) continue;	// infinite loop to prevent PIC from reset if there is no more program
}




/*******************************************************************************
* PUBLIC FUNCTION: delay_10us
*
* PARAMETERS:
* ~ ui_10microsecond
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* delay for for period 10 microsecond base on ui_10microsecond
* based on _XTAL_FREQ value, ui_10microsecond range from 0-65,535.
*******************************************************************************/
void delay_10us(unsigned int ui_10microsecond)
{
	for( ; ui_10microsecond > 0; ui_10microsecond --)
	{		
		__delay_us(10);	//50 instruction cycle with 20MHz oscillator is 10us
	}	
}


/*******************************************************************************
* PUBLIC FUNCTION: delay_ms
*
* PARAMETERS:
* ~ ui_millisecond
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* delay for for period millisecond base on ui_millisecond
* based on _XTAL_FREQ value, ui_millisecond range from 0-65,535.
*******************************************************************************/
void delay_ms(unsigned int ui_millisecond)
{
	for( ; ui_millisecond > 0; ui_millisecond --)
	{
		__delay_ms(1);
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
	while (uc_count-- > 0) 
	{
		BUZZER = 1;	//buzzer is share at RC2 pin, which is PWM pin
		delay_ms(50);
		BUZZER = 0;
		delay_ms(50);
	}
}

