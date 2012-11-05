/*******************************************************************************
* This file provides the functions for the Timer0 module, connect to encoder on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/


#ifndef _TIMER0_H
#define _TIMER0_H


/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
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
extern void timer0_initialize(void);






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
extern unsigned int ui_encoder(void);



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
extern void set_encoder(unsigned int ui_value);

	


/*******************************************************************************
* Interrupt Service Routine for Timer 0
*
* DESCRIPTIONS:
* This is the ISR for the Timer 0 overflow and it will become 16-bit.
*
*******************************************************************************/
extern void timer0_isr(void);


#endif
