/*******************************************************************************
* This file provides the functions of delay for PIC18F on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <p18cxxx.h>	//include the PIC18F model of PIC header file
#include <delays.h>
#include "system.h"
#include "delay18.h"

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
void delay_10us(unsigned int ui_10microsecond)
{
	for( ; ui_10microsecond > 0; ui_10microsecond --)
	{
		#if (_XTAL_FREQ == 20000000)
		Delay10TCYx(5);	//50 instruction cycle with 20MHz oscillator is 10us
		#elif (_XTAL_FREQ == 48000000)
		Delay10TCYx(12);	//120 instruction cycle with 48MHz oscillator is 10us
		#endif
	}	
}


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
void delay_ms(unsigned int ui_millisecond)
{
	for( ; ui_millisecond > 0; ui_millisecond --)
	{
		#if (_XTAL_FREQ == 20000000)
		Delay1KTCYx(5);	//5K instruction cycle with 20MHz oscillator is 1ms
		#elif (_XTAL_FREQ == 48000000)
		Delay1KTCYx(12);	//12K instruction cycle with 48MHz oscillator is 1ms
		#endif
	}		
}	


