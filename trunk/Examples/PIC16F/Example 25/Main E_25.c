/*******************************************************************************
* This is the main program for Example 25 using PTK40A PIC Training Board.
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
#include "uart.h"		//include UART header file, to enable the functions of PWM
#include "lcd.h"		//include LCD header file to enable the function of LCD
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
	unsigned char status = 0;	
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
	
	// Initialize UART
	uart_initialize();	//Ensure UART module is properly configured before it can be used
	
	// Initialize LCD
	lcd_initialize();	//Ensure PWM module is properly configured before it can be used
	
	// PTK40A have an PWM output at JP26 as enternal motor driver for the stepper mot
	// The PTK40A stepper driver motor support model from SDXXX stepper motor driver 
	// Please refer to PTK40A schematic for the connection or user manual or example guide
	//please change all the related jumper to the stepper function
	// for more information please look at the example guide or the user manual
	adc_on();	//activate ADC module in PIC
	LCD_BACKLIGHT=1;	
	lcd_putstr("Sw1=CW   Sw2=CCW\nSW3 = Start&Stop");
	
	uart_transmit('M');	//command to set microstepping on SD02B
	uart_transmit(1);	//No microstepping
	uart_transmit('S');	//command to set speed on SD02B
	uart_transmit(10);	//The speed value
	uart_transmit('O');	//command to turn on SD02B
	uart_transmit('G');	//command to run the stepper motor
	
	while(1) 	// create an infinite loop
	{	
		if(SW3==0)
		{
			while(SW3==0);
			delay_ms(10);
			status = status ^ 0b00000001;//toggle the bit 0
		}
		
		if(status != 0)
		{				
			if(SW1 == 0)
			{
				uart_transmit('<');	//change direction of stepper rotation
			}
			else if(SW2 == 0)
			{
				uart_transmit('>');
			}
			else
			uart_transmit('O');		//enable the SD02B
		}	
		else 
		{
			uart_transmit('F');	//turn off SD02B
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
		pwm_set_duty_cycle(1023);	//buzzer is share at RC2 pin, PWM
		delay_ms(80);
		pwm_set_duty_cycle(0);
		delay_ms(100);
	}
}


