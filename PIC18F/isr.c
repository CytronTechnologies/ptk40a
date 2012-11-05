/*******************************************************************************
* This file provides the interrupt service routine, ISR for PTK40A using PIC18F
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <p18cxxx.h>	//include the PIC18F model of PIC header file
#include "system.h"
#include "timer0.h"
#include "timer1.h"

// Declare for local function prototypes
void ISRHigh(void);

/*******************************************************************************
* Interrupt Service Routine
*
* DESCRIPTIONS:
* This is the main ISR 
* There is 2 interrupt vectors in PIC18F, we are using high priority interrupt only
*******************************************************************************/

#pragma	code InterruptVectorHigh = 0x08
void InterruptVectorHigh(void)
{
 	_asm
		goto ISRHigh		// jump to interrupt routine
	_endasm
}
#pragma code

#pragma	code InterruptVectorLow = 0x18
void InterruptVectorLow(void)
{
 	_asm
		goto ISRHigh			// jump to interrupt routine
	_endasm
}
#pragma code

#pragma interrupt ISRHigh
void ISRHigh(void)
{
	// check if Timer 1 is overflow
	if (PIR1bits.TMR1IF == 1) 
	{		
		timer1_isr();		// call timer 1 ISR		
	}
	
	// check if Timer 0 is overflow
	if (INTCONbits.TMR0IF == 1) 
	{
		timer0_isr();		// call timer 0 ISR			
	}
}

