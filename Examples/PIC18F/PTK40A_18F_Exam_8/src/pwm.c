/*******************************************************************************
* This file provides the functions for the PWM module on PTK40A, using PIC18F
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <xc.h>	//include the PIC18F model of PIC header file
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
	
	//CCP1CONbits.P1M1 = 0;		//standard PWM
	//CCP1CONbits.P1M0 = 0;		//Not in enhanced mode	
	P1M1 = 0;		//standard PWM
	P1M0 = 0;		//Not in enhanced mode	
	// Setting PWM frequency = 4.88Khz, using PIC18F4520 with 20MHz Fosc
	//PWM period = (PR2 + 1) * 4 * Tosc * (TMR2 Prescaler)
	//PR2 = (Fosc * PWM period)/ (4 * TMR2 Prescaler)
	#if (_XTAL_FREQ == 20000000)	//if system oscillator is 20MHz
	PR2 = 255;
	//T2CONbits.T2CKPS1 = 0;
	//T2CONbits.T2CKPS0 = 1;	// Timer 2 prescale = 4.
	T2CKPS1 = 0;
	T2CKPS0 = 1;	// Timer 2 prescale = 4.
	
	#elif (_XTAL_FREQ == 48000000) //if system oscillator is 48MHz
	//Setting PWM frequency = 2.929Khz, using PIC18F4550 with 48MHz Fosc
	PR2 = 255;
	//T2CONbits.T2CKPS1 = 1;
	//T2CONbits.T2CKPS0 = 0;	// Timer 2 prescale = 16.
	T2CKPS1 = 1;
	T2CKPS0 = 0;	// Timer 2 prescale = 16.
	#endif
		
	//CCP1CONbits.CCP1M3 = 1;
	//CCP1CONbits.CCP1M2 = 1;		// Configure CCP1 module to operate in PWM mode.
	CCP1M3 = 1;
	CCP1M2 = 1;		// Configure CCP1 module to operate in PWM mode.
	
	//CCP1CONbits.DC1B0 = 0;		// duty cycle = 0% at initial
	//CCP1CONbits.DC1B1 = 0;
	DC1B0 = 0;		// duty cycle = 0% at initial
	DC1B1 = 0;
	CCPR1L = 0x00;	
	
	//T2CONbits.TMR2ON = 1;		// Turn on Timer 2
	TMR2ON = 1;		// Turn on Timer 2
}	

/*******************************************************************************
* PUBLIC FUNCTION: pwm_uninitialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Uninitialize the CCP1 module to be in normal IO mode
*
*******************************************************************************/
void pwm_uninitialize(void)
{
	// Disable CCP1 module	
	//CCP1CONbits.CCP1M3 = 0;
	//CCP1CONbits.CCP1M2 = 0;		
	//CCP1CONbits.CCP1M1 = 0;
	//CCP1CONbits.CCP1M0 = 0;
	CCP1M3 = 0;
	CCP1M2 = 0;		
	CCP1M1 = 0;
	CCP1M0 = 0;
	
	//CCP1CONbits.DC1B0 = 0;		// clear the PWM register
	//CCP1CONbits.DC1B1 = 0;
	DC1B0 = 0;		// clear the PWM register
	DC1B1 = 0;
	CCPR1L = 0x00;	
	PR2 = 0;	
	
	//T2CONbits.TMR2ON = 0;		// Turn Off Timer 2
	TMR2ON = 0;		// Turn Off Timer 2
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
