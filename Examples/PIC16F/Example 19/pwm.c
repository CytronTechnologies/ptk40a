/*******************************************************************************
* This file provides the functions for the PWM module on PTK40A, using PIC16F877A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
#include "system.h"
#include "pwm.h"



/*******************************************************************************
* PUBLIC FUNCTION: pwm_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the CCP1 module to operate in PWM mode.
*
*******************************************************************************/
void pwm_initialize(void)
{
	// Setting PWM frequency = 4.88khz, using PIC16F877A with 20MHz Crystal
	PR2 = 0xff;
	T2CKPS1 = 0;
	T2CKPS0 = 1;	// Timer 2 prescale = 4.
	
	CCPR1L = 0;		// Duty cycle = 0;
	TMR2ON = 1;		// Turn on Timer 2.
	
	CCP1M3 = 1;
	CCP1M2 = 1;		// Configure CCP1 module to operate in PWM mode.
	
	CCP1X = 0;		// duty cycle = 0% at initial
	CCP1Y = 0;
	CCPR1L = 0x00;	
}	



/*******************************************************************************
* PUBLIC FUNCTION: pwm_set_duty_cycle
*
* PARAMETERS:
* ~ ui_duty_cycle	- The duty cycle of the PWM, 10 bits.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the duty cycle of the PWM.
*
*******************************************************************************/
void pwm_set_duty_cycle(unsigned int ui_duty_cycle)
{
	CCP1CON = (CCP1CON & 0b11001111) | (0b00110000 & ((unsigned char)(ui_duty_cycle << 4)));
	CCPR1L = ui_duty_cycle >> 2;
}	
