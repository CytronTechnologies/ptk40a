/*******************************************************************************
* This file provides the functions for the Timer1 module, using 32.768KHz Crystal with PIC16F877A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _TIMER1_H
#define _TIMER1_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

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
extern void timer1_initialize(void);



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
extern unsigned char uc_timer1_get_seconds(void);



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
extern void timer1_set_seconds(unsigned char uc_value);



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
extern unsigned char uc_timer1_get_minutes(void);



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
extern void timer1_set_minutes(unsigned char uc_value);



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
extern unsigned char uc_timer1_get_hours(void);



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
extern void timer1_set_hours(unsigned char uc_value);




/*******************************************************************************
* Interrupt Service Routine for Timer 1
*
* DESCRIPTIONS:
* This is the ISR for the Timer 1 overflow interrupt, this is to serve as Real Time Clock.
*
*******************************************************************************/
extern void timer1_isr(void);

#endif
