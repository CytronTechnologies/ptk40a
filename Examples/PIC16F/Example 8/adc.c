/*******************************************************************************
* This file provides the functions for the ADC module for PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/
// This file is written for PIC16F877A, if other model of PIC is uses, please modify accordingly


#include <htc.h>
#include "system.h"
#include "adc.h"

/*******************************************************************************
* PUBLIC FUNCTION: adc_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the ADC module.
*
*******************************************************************************/
void adc_initialize(void)
{
	// A/D Conversion Clock = FOSC/64.
	ADCS2 = 1;
	ADCS1 = 1;
	ADCS0 = 0;
	
	// Set AN0 only as analog input, others AN as digital pin
	PCFG3 = 1;
	PCFG2 = 1;
	PCFG1 = 1;
	PCFG0 = 0;
	
	// Configure the result to be right justified, will take as 10-bit ADC
	ADFM = 1;
	
	// Turn Off ADC module by default
	ADON = 0;
}

	
/*******************************************************************************
* PUBLIC FUNCTION: adc_on
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Activate ADC module
*
*******************************************************************************/
void adc_on(void)
{
	// Turn On ADC module
	ADON = 1;
}




/*******************************************************************************
* PUBLIC FUNCTION: adc_off
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Deactivate ADC module
*
*******************************************************************************/
void adc_off(void)
{
	// Turn Off ADC module, to save power
	ADON = 0;
}



/*******************************************************************************
* PUBLIC FUNCTION: ui_adc_read
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The ADC result in 16-bit
*
* DESCRIPTIONS:
* Convert and read the result of the ADC from ANO.
*
*******************************************************************************/
unsigned int ui_adc_read(void)
{
	unsigned int temp = 0;
	// Select the ADC channel, PTK can only read AN0
	CHS2 = 0;
	CHS1 = 0;
	CHS0 = 0;
	
	// Delay 1mS to fully charge the holding capacitor in the ADC module.
	__delay_ms(1);
	
	// Start the conversion and wait for it to complete.
	#if((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ <= 80)) //if Hi-Tech V9.80 or lower version of compiler is being used
	ADGO = 1;				//start ADC conversion
	while (ADGO == 1);		//wait for ADC to complete the conversion
	#elif((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ > 80)) //else if Hi-Tech greater than V9.80 compiler is being used
	GO_DONE = 1;			//start ADC conversion
	while (GO_DONE == 1);		//await for ADC to complete the conversion
	#endif	
	
	// Return 10-bit ADC result.
	temp = (unsigned int)ADRESH << 8;
	temp = temp + ADRESL;
	return temp;
}	
