/*******************************************************************************
* This file provides the functions of delay for PIC18F on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#ifndef _DELAY18_H
#define _DELAY18_H

/*******************************************************************************
* PRIVATE CONSTANTS                                                            *
*******************************************************************************/

/*******************************************************************************
* PUBLIC FUNCTION: delay_10us
*
* PARAMETERS:
* ~ ui_10microsecond
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* delay for for period 10 microsecond base on ui_10microsecond
* based on _XTAL_FREQ value, ui_10microsecond range from 0-65,535.
*******************************************************************************/
void delay_10us(unsigned int ui_10microsecond);


/*******************************************************************************
* PUBLIC FUNCTION: delay_ms
*
* PARAMETERS:
* ~ ui_millisecond
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* delay for for period millisecond base on ui_millisecond
* based on _XTAL_FREQ value, ui_millisecond range from 0-65,535.
*******************************************************************************/
void delay_ms(unsigned int ui_millisecond);

#endif
