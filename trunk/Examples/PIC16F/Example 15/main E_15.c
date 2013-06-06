/*******************************************************************************
* This is the main program for Example 15 using PTK40A PIC Training Board.
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
#include "pwm.h"		//include pwm header file, to enable the functions of PWM
#include "lcd.h"		//include pwm header file, to enable the functions of LCD
#include "timer0.h"		//include timer0 header file, to enable the functions of timer 0
#include "timer1.h"		//include timer1 header file, to enable the functions of timer 1

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
	unsigned int speed = 0;	// declare a variable to store 
	unsigned char seconds = 0; //declara the variable to store data
	unsigned char encoder_value = 0;
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
	
	// Initialize lcd.
	lcd_initialize();	//Ensure LCD module is properly configured before it can be used
	
	// Initialize ADC.
	adc_initialize();	//Ensure pin share with analog is being configured to digital correctly
	
	// Initialize PWM
	pwm_initialize();	//Ensure PWM module is properly configured before it can be used
	
	// Initialize timer0
	timer0_initialize();	//Ensure timer 0 is properly configured before it can be used
	
	// Initialize timer1
	timer1_initialize();	//Ensure timer 1 is properly configured before it can be used
	
	// PTK40A have DC brush motor and potentiometer
	// PTK40A also have a DC motor with encoder blade (RA4) it can be control via digital input and PWM
	// Please refer to PTK40A schematic for the connection
	// Please move JP10 to PWM, JP14 to POT, JP20&21 to DC MOTOR
	// Motor will rotate according to potentiometer, speed will change
	// Read and calculate the speed in RPM, display on LCD
	LCD_BACKLIGHT = 1;	//activate LCD Backlight
	
	adc_on();	//activate ADC module in PIC
	M1 = 1;
	M2 = 0;		// drive motor in a direction
		
	lcd_goto(0x06);
	lcd_putstr("RPM:");
	lcd_goto(0x46);
	lcd_putstr("000");
		
	timer1_set_seconds(0);	//clear the timer 1 register, seconds
	set_encoder(0);			//clear the encoder register
	while(1) 	// create an infinite loop
	{
		speed = ui_adc_read();	// read result from ADC module
		pwm_set_duty_cycle(speed);	// update the speed or the DCmotor
		
		seconds = uc_timer1_get_seconds();	//obtain second from timer
		if(seconds == 10)
		{	
			encoder_value = ui_encoder()*6/8;
			lcd_goto(0x46);				
			lcd_bcd(3,encoder_value);		//update encoder value to LCD
			set_encoder(0);
			timer1_set_seconds(0);	
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


void interrupt service_routine(void)
{
		
	if(TMR1IF == 1)
	timer1_isr();	
	
	if(TMR0IF == 1)
	timer0_isr();	
}