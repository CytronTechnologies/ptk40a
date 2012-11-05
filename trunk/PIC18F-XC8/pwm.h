/*******************************************************************************
* This file provides the functions for the PWM module on PTK40A, using PIC18F
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _PWM_H
#define _PWM_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

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
extern void pwm_initialize(void);


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
extern void pwm_uninitialize(void);


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
extern void pwm_set_duty_cycle(unsigned int ui_duty_cycle);



#endif
