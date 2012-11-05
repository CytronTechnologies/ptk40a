/*******************************************************************************
* This file provides the interrupt service routine, ISR for PTK40A using PIC18F
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <xc.h>	//include the PIC18F model of PIC header file
#include "system.h"
#include "timer0.h"
#include "timer1.h"

/*******************************************************************************
* Interrupt Service Routine
*
* DESCRIPTIONS:
* This is the main ISR 
* There is 2 interrupt vectors in PIC18F, we are using high priority interrupt only
*******************************************************************************/


void interrupt high_isr(void)
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



void interrupt low_priority low_isr(void)
{

}

