/*******************************************************************************
* This file provides the functions for the Timer1 module, using 32.768KHz Crystal with PIC16F877A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
#include "system.h"
#include "timer0.h"
#include "timer1.h"



/*******************************************************************************
* Interrupt Service Routine
*
* DESCRIPTIONS:
* This is the main ISR 
*
*******************************************************************************/
void interrupt isr(void)
{
	// check if Timer 1 is overflow
	if (TMR1IF == 1) 
	{		
		timer1_isr();		// call timer 1 ISR		
	}
	// check if Timer 0 is overflow
	if (TMR0IF == 1) 
	{
		timer0_isr();		// call timer 0 ISR			
	}
}
