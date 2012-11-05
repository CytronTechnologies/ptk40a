/*******************************************************************************
* This file provides the functions for the SPI module on PTK40A, using PIC16F877A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
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
	TRISC5 = 0;
	
	// deactivate Chip Select, the EEPROM is not activate
	SPI_EEPROM_CSN = 1;
	
	// Input data sampled at middle of data output time.
	SMP = 0;
	
	// Select SPI mode 1, 1.
	CKE = 1;		// Output data changes on transition from active to idle clock state.
					// Rising edge
	CKP = 0;		// Idle state for clock is a low level.
	
	// SPI Master mode, clock = FOSC/4.
	SSPM3 = 0;
	SSPM2 = 0;
	SSPM1 = 0;
	SSPM0 = 0;
	
	// Clear the Write Collision Detect bit.
	WCOL = 0;
	
	// Enable the MSSP module.
	SSPEN = 1;
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
	while(BF == 0);
	
	// Return the received data.
	return SSPBUF;
}
