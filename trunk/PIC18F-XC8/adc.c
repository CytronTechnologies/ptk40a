/*******************************************************************************
* This file provides the functions for the ADC module for PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/
// This file is written for PIC18F, if other model of PIC is uses, please modify accordingly

#include <xc.h>	//include the PIC18F model of PIC header file
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
	// Set Vref+ to Vdd and Vref- to Vss
	//ADCON1bits.VCFG1 = 0;
	//ADCON1bits.VCFG0 = 0;	
	VCFG1 = 0;
	VCFG0 = 0;
	
	// Set AN0 only as analog input, others AN as digital pin
	//ADCON1bits.PCFG3 = 1;
	//ADCON1bits.PCFG2 = 1;
	//ADCON1bits.PCFG1 = 1;
	//ADCON1bits.PCFG0 = 0;	
	PCFG3 = 1;
	PCFG2 = 1;
	PCFG1 = 1;
	PCFG0 = 0;
	// Configure the result to be right justified, will take as 10-bit ADC
	//ADCON2bits.ADFM = 1;
	ADFM = 1;
	// A/D Conversion Clock = FOSC/64.
	//ADCON2bits.ADCS2 = 1;
	//ADCON2bits.ADCS1 = 1;
	//ADCON2bits.ADCS0 = 0;
	ADCS2 = 1;
	ADCS1 = 1;
	ADCS0 = 0;
	// A/D Acquisition Time = 12TAD
	//ADCON2bits.ACQT2 = 1;
	//ADCON2bits.ACQT1 = 0;
	//ADCON2bits.ACQT0 = 1;
	ACQT2 = 1;
	ACQT1 = 0;
	ACQT0 = 1;
	// Turn Off ADC module by default
	//ADCON0bits.ADON = 0;
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
	//ADCON0bits.ADON = 1;
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
	//ADCON0bits.ADON = 0;
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
	//unsigned int temp = 0;
	
	// Select the ADC channel, PTK can only read AN0
//	ADCON0bits.CHS3 = 0;
//	ADCON0bits.CHS2 = 0;
//	ADCON0bits.CHS1 = 0;
//	ADCON0bits.CHS0 = 0;
	CHS3 = 0;
	CHS2 = 0;
	CHS1 = 0;
	CHS0 = 0;
	
	// Start the conversion and wait for it to complete.
	
	//ADCON0bits.GO = 1;		//start ADC conversion, PIC18F will automatic wait for Acquisition time before start convert
	//while (ADCON0bits.DONE == 1);		//wait for ADC to complete the conversion
	GO = 1;		//start ADC conversion, PIC18F will automatic wait for Acquisition time before start convert
	while (DONE == 1);		//wait for ADC to complete the conversion
	
	// Return 10-bit ADC result.
	//temp = (unsigned int)ADRESH << 8;
	//temp = temp + ADRESL;
	//return temp;
	return ADRES;		//ADRES is the 16-bit of ADRESH:ADRESL
}	
