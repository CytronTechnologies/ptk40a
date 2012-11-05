/*******************************************************************************
* This file provides the functions for the Timer0 module, connect to encoder on PTK40A
* For PIC18F
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <xc.h>	//include the PIC18F model of PIC header file
#include "system.h"
#include "timer0.h"


/*******************************************************************************
* PRIVATE GLOBAL VARIABLES                                                     *
*******************************************************************************/


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
	//Timer 0 8bit/16bit Control Bit
	//T0CONbits.T08BIT = 0;	//Timer 0 is operating in 16-bit mode
	T08BIT = 0;	//Timer 0 is operating in 16-bit mode
	// Timer 0 clock source select bit
	//T0CONbits.T0CS = 1;		// transition on T0CKI 
	T0CS = 1;		// transition on T0CKI 
	// Timer 0 source edge select bit
	//T0CONbits.T0SE = 1; 		// increment on high to low transition
	T0SE = 1; 		// increment on high to low transition
	// Prescales Assignment Bit
	//T0CONbits.PSA = 1;		// Prescaler is assigned to WDT
	PSA = 1;		// Prescaler is assigned to WDT
	//Clear the timer buffer		
	TMR0H = 0x00;	//timer0 of PIC18F is configurable to 16-bit
	TMR0L = 0x00;	
	
	// Timer 0 interrupt bits
	//INTCONbits.TMR0IF = 0;		// Clear Timer 0 interrupt flag.
	//INTCONbits.TMR0IE = 1;		// Enable Timer 0 overflow interrupt.
	//INTCONbits.GIE = 1;		// Enable all unmasked interrupts.
	TMR0IF = 0;		// Clear Timer 0 interrupt flag.
	TMR0IE = 1;		// Enable Timer 0 overflow interrupt.
	GIE = 1;		// Enable all unmasked interrupts.
	
	//T0CONbits.TMR0ON = 1; //enable Timer 0
	TMR0ON = 1;	//enable Timer 0
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
	
	return TMR0;
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
	TMR0H = ui_value & 0xff00;
	TMR0L = (unsigned char)ui_value;
	
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
		//INTCONbits.TMR0IF = 0;	
		TMR0IF = 0;		
}
