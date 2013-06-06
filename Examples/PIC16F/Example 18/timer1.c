/*******************************************************************************
* This file provides the functions for the Timer1 module, using 32.768KHz Crystal with PIC16F877A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
#include "system.h"
#include "timer1.h"



/*******************************************************************************
* PRIVATE GLOBAL VARIABLES                                                     *
*******************************************************************************/

// The variables for the RTC.
static unsigned char suc_seconds = 0;
static unsigned char suc_minutes = 0;
static unsigned char suc_hours = 0;



/*******************************************************************************
* PUBLIC FUNCTION: timer1_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the Timer 1 module.
*
*******************************************************************************/
void timer1_initialize(void)
{
	TMR1L = 0x00;
	TMR1H = 0x80;	// Load the Timer 1 so that it interrupts every second.
	
	T1OSCEN = 1;	// Enable Timer 1 Oscillator.
	TMR1CS = 1;		// Select external clock.
	
	TMR1IF = 0;		// Clear Timer 1 interrupt flag.
	TMR1IE = 1;		// Enable Timer 1 overflow interrupt.
	PEIE = 1;		// Enable all unmasked peripheral interrupts.
	GIE = 1;		// Enable all unmasked interrupts.
	
	TMR1ON = 1;		// Turn on Timer 1.
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_timer1_get_seconds
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for seconds.
*
* DESCRIPTIONS:
* Get the value for seconds.
*
*******************************************************************************/
unsigned char uc_timer1_get_seconds(void)
{
	return suc_seconds;
}	



/*******************************************************************************
* PUBLIC FUNCTION: timer1_set_seconds
*
* PARAMETERS:
* ~ uc_value	- The value for seconds.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for seconds.
*
*******************************************************************************/
void timer1_set_seconds(unsigned char uc_value)
{
	suc_seconds = uc_value;
	
	// Reload the Timer 1 register.
	TMR1L = 0x00;
	TMR1H = 0x80;
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_timer1_get_minutes
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for minutes.
*
* DESCRIPTIONS:
* Get the value for minutes.
*
*******************************************************************************/
unsigned char uc_timer1_get_minutes(void)
{
	return suc_minutes;
}	



/*******************************************************************************
* PUBLIC FUNCTION: timer1_set_minutes
*
* PARAMETERS:
* ~ uc_value	- The value for minutes.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for minutes.
*
*******************************************************************************/
void timer1_set_minutes(unsigned char uc_value)
{
	suc_minutes = uc_value;
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_timer1_get_hours
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for hours.
*
* DESCRIPTIONS:
* Get the value for hours.
*
*******************************************************************************/
unsigned char uc_timer1_get_hours(void)
{
	return suc_hours;
}	



/*******************************************************************************
* PUBLIC FUNCTION: timer1_set_hours
*
* PARAMETERS:
* ~ uc_value	- The value for hours.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for hours.
*
*******************************************************************************/
void timer1_set_hours(unsigned char uc_value)
{
	suc_hours = uc_value;
}	



/*******************************************************************************
* Interrupt Service Routine for Timer 1
*
* DESCRIPTIONS:
* This is the ISR for the Timer 1 overflow interrupt, this is to serve as Real Time Clock.
*
*******************************************************************************/
void timer1_isr(void)
{
	// Clear the interrupt flag.
	TMR1IF = 0;
	
	// Reload the Timer 1 register value so that it interrupts every second.
	TMR1H = 0x80;
	
	// Increase the variable for seconds.
	suc_seconds++;
	
	// Increase the variable for minutes if > 59 seconds.
	if (suc_seconds > 59) {
		suc_minutes++;
		
		// Clear the variable for seconds.
		suc_seconds = 0;
	}	
	
	// Increase the variable for hours if > 59 minutes.
	if (suc_minutes > 59) {
		suc_hours++;
		
		// Clear the variable for seconds.
		suc_minutes = 0;
	}	
	
	// Clear the variable for hours if > 23 hours.
	if (suc_hours > 23) {
		suc_hours = 0;
	}	

}
