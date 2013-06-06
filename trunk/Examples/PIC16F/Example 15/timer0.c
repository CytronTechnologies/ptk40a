/*******************************************************************************
* This file provides the functions for the Timer0 module, connect to encoder on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
#include "system.h"
#include "timer0.h"



/*******************************************************************************
* PRIVATE GLOBAL VARIABLES                                                     *
*******************************************************************************/

// The variables for the Timer 0.
static unsigned int TMR0_16 = 0;
static unsigned char TMR0_16_overflow = 0;



/*******************************************************************************
* PUBLIC FUNCTION: timer0_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the Timer 0 module as encoder counter from brush motor encoder
*
*******************************************************************************/
void timer0_initialize(void)
{
	TMR0 = 0x00;	
	TMR0_16 = 0x0000;

	// Timer 0 clock source select bit
	T0CS = 1;		// transition on T0CKI 
	
	// Timer 0 source edge select bit
	T0SE = 1; 		// increment on high to low transition

	// Prescales Assignment Bit
	PSA = 1;		// Prescaler is assigned to WDT

	// Prescaler Rate Select Bits
	PS2 = 0;	//1:2, but it is not use if the PSA is assigning the prescaler to WDT 
	PS1 = 0;
	PS0 = 0;

	// Timer 0 interrupt bits
	TMR0IF = 0;		// Clear Timer 0 interrupt flag.
	TMR0IE = 1;		// Enable Timer 0 overflow interrupt.
	GIE = 1;		// Enable all unmasked interrupts.
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_encoder_low
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for encoder low byte
*
* DESCRIPTIONS:
* Get the value for encoder low byte.
*
*******************************************************************************/
unsigned char uc_encoder_low(void)
{
	return TMR0;
}	



/*******************************************************************************
* PUBLIC FUNCTION: ui_encoder
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for encoder in 16-bit
*
* DESCRIPTIONS:
* Get the value for encoder in 16-bit.
*
*******************************************************************************/
unsigned int ui_encoder(void)
{
	TMR0_16 = (TMR0_16 & 0xff00) | (unsigned int)TMR0;

	return TMR0_16;
}



/*******************************************************************************
* PUBLIC FUNCTION: set_encoder_low
*
* PARAMETERS:
* ~ uc_value	- The value for low byte of encoder.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for low byte of encoder.
*
*******************************************************************************/
void set_encoder_low(unsigned char uc_value)
{
	TMR0 = uc_value;
}	





/*******************************************************************************
* PUBLIC FUNCTION: set_encoder
*
* PARAMETERS:
* ~ ui_value	- The value for 16-bit encoder.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for 16-bit encoder.
*
*******************************************************************************/
void set_encoder(unsigned int ui_value)
{
	TMR0_16 = ui_value & 0xff00;
	TMR0 = (unsigned char)ui_value;
}	


/*******************************************************************************
* Interrupt Service Routine for Timer 0
*
* DESCRIPTIONS:
* This is the ISR for the Timer 0 overflow and it will become 16-bit.
*
*******************************************************************************/
void timer0_isr(void)
{
	
		// Clear the interrupt flag.
		TMR0IF = 0;
		
		// Increase high byte of timer 0
		TMR0_16 = TMR0_16 + 256;
		
		// check in TMR0H overflow
		if(TMR0_16 == 0) 
		{
			TMR0_16_overflow = 1;
			// user can also place any action needed if 16-bit timer 0 overflow here
		}
		else 
		{
			TMR0_16_overflow = 0;
		}		

}
