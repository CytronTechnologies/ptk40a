/*******************************************************************************
* This file provides the functions for the SPI module on PTK40A, using PIC18F
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <p18cxxx.h>	//include the PIC18F model of PIC header file
#include "system.h"
#include "spi.h"


/*******************************************************************************
* PUBLIC FUNCTION: spi_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the SPI module.
*
*******************************************************************************/
void spi_initialize(void)
{
	// Set the SDO as output. SDI is automatically controlled by the SPI module.
	#if defined (__18F4520)
	TRISCbits.TRISC5 = 0;
	#elif defined (__18F455)
	TRISCbits.TRISC7 = 0;	//PIC18F4550 SDO pin is located at RC7, 
						//but PTK40A cannot use SPI if PIC18F4550 is used
	#endif
	
	// deactivate Chip Select, the EEPROM is not activate
	SPI_EEPROM_CSN = 1;
	
	// Input data sampled at middle of data output time.
	SSPSTATbits.SMP = 0;
	
	// Select SPI mode 1, 1.
	SSPSTATbits.CKE = 1;		// Output data changes on transition from active to idle clock state.
					// Rising edge
	SSPCON1bits.CKP = 0;		// Idle state for clock is a low level.
	
	// SPI Master mode, clock = FOSC/4.
	SSPCON1bits.SSPM3 = 0;
	SSPCON1bits.SSPM2 = 0;
	SSPCON1bits.SSPM1 = 0;
	SSPCON1bits.SSPM0 = 0;
	
	// Clear the Write Collision Detect bit.
	SSPCON1bits.WCOL = 0;
	
	// Enable the MSSP module.
	SSPCON1bits.SSPEN = 1;
}



/*******************************************************************************
* PUBLIC FUNCTION: uc_send_receive_spi
*
* PARAMETERS:
* ~ uc_data		- The data to send.
*
* RETURN:
* ~ The data received from the SPI.
*
* DESCRIPTIONS:
* Send and receive the data using the SPI.
*
*******************************************************************************/
unsigned char uc_send_receive_spi(unsigned char uc_data)
{	
	// Send the data
	SSPBUF = uc_data;
	
	// Wait for the SPI module to finish sending / receiving.
	while(SSPSTATbits.BF == 0);
	
	// Return the received data.
	return SSPBUF;
}
