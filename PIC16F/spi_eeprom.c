/*******************************************************************************
* This file provides the functions for the 25AA020A SPI EEPROM on PTK40A
* Prior to using these functions, user need to initialize the SPI module.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
#include "system.h"
#include "spi.h"
#include "spi_eeprom.h"



/*******************************************************************************
* PRIVATE CONSTANTS                                                            *
*******************************************************************************/

// The command code for the SPI EEPROM.
#define CMD_READ	0x03		// Read data from the selected address.
#define CMD_WRITE	0x02		// Write data to the selected address.
#define CMD_WRDI	0x04		// Reset the write enable latch.
#define CMD_WREN	0x06		// Set the write enable latch.
#define CMD_RDSR	0x05		// Read STATUS register.
#define CMD_WRSR	0x01		// Write STATUS register.



/*******************************************************************************
* PUBLIC FUNCTION: uc_spi_eeprom_read_single_byte
*
* PARAMETERS:
* ~ uc_address	- The address of the data we want to read.
*
* RETURN:
* ~ The data at the selected address.
*
* DESCRIPTIONS:
* Read a single byte of data from the SPI EEPROM.
*
*******************************************************************************/
unsigned char uc_spi_eeprom_read_single_byte(unsigned char uc_address)
{
	unsigned char uc_data;
	
	// Read from the EEPROM.
	SPI_EEPROM_CSN = 0;						// Activate the Chip Select.	
	uc_send_receive_spi(CMD_READ);			// Send the read command.
	uc_send_receive_spi(uc_address);		// Send the address.
	uc_data = uc_send_receive_spi(0xff);	// Read the data.
	SPI_EEPROM_CSN = 1;						// Deactivate the Chip Select.
	
	// Return the data.
	return uc_data;
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_spi_eeprom_read_multi_byte
*
* PARAMETERS:
* ~ uc_address		- The beginning address of the data we want to read.
* ~ puc_data_buffer	- Pointer to the location to store the data. User have to
*					  ensure that there is enough space in the data buffer to
*					  store the data.
* ~ uc_length		- Number of bytes to read from the SPI EEPROM.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Read multiple bytes of data from the SPI EEPROM. The address will roll over
* to 0x00 when we reach the end of the memory.
*
*******************************************************************************/
void spi_eeprom_read_multi_byte(unsigned char uc_address,
								unsigned char *puc_data_buffer,
								unsigned char uc_length)
{
	// Read the specified length of data from the EEPROM.
	SPI_EEPROM_CSN = 0;									// Activate the Chip Select.
	uc_send_receive_spi(CMD_READ);						// Send the read command.
	uc_send_receive_spi(uc_address);					// Send the address.
	
	while (uc_length-- > 0) {
		
		*puc_data_buffer++ = uc_send_receive_spi(0xff);	// Read the data.
	}	
	
	SPI_EEPROM_CSN = 1;									// Deactivate the Chip Select.
}



/*******************************************************************************
* PUBLIC FUNCTION: spi_eeprom_write_single_byte
*
* PARAMETERS:
* ~ uc_address	- The address that we want to write to.
* ~ uc_data		- The data that we want to write.
*
* RETURN:
* ~ The data at the selected address.
*
* DESCRIPTIONS:
* Read a single byte of data from the SPI EEPROM.
*
*******************************************************************************/
void spi_eeprom_write_single_byte(unsigned char uc_address, unsigned char uc_data)
{
	unsigned char uc_status;
	
	// Set the write enable latch.
	SPI_EEPROM_CSN = 0;					// Activate the Chip Select.	
	uc_send_receive_spi(CMD_WREN);		// Send the command.	
	SPI_EEPROM_CSN = 1;					// Deactivate the Chip Select.
	
	__delay_us(1);
	
	// Write to the EEPROM.
	SPI_EEPROM_CSN = 0;					// Activate the Chip Select.	
	uc_send_receive_spi(CMD_WRITE);		// Send the write command.
	uc_send_receive_spi(uc_address);	// Send the address.
	uc_send_receive_spi(uc_data);		// Send the data.
	SPI_EEPROM_CSN = 1;					// Deactivate the Chip Select.
	
	__delay_us(1);
	
	// Wait for the write to complete.
	do {
		// Read the status register of the SPI EEPROM.
		SPI_EEPROM_CSN = 0;						// Activate the Chip Select.		
		uc_send_receive_spi(CMD_RDSR);			// Send the command.
		uc_status = uc_send_receive_spi(0xff);	// Read the data.
		SPI_EEPROM_CSN = 1;						// Deactivate the Chip Select.
		
		// Mask out the other bit except the Write-In-Process bit.
		uc_status &= 0x01;
	} while (uc_status != 0);
}



/*******************************************************************************
* PUBLIC FUNCTION: b_spi_eeprom_write_multi_byte
*
* PARAMETERS:
* ~ uc_address			- The address that we want to write to.
* ~ kpuc_data_buffer	- Pointer to the beginning of the data we want to write.
* ~ uc_length			- Number of bytes to write to the SPI EEPROM.
*						  Maximum = 16 bytes.
*
* RETURN:
* ~ Return 0 if the data is written successfully.
* ~ Return 1 if failed.
*
* DESCRIPTIONS:
* Write multiple bytes of data to the SPI EEPROM. The maximum length is 16
* bytes and it shouldn't cross the page boundary where the page address begins
* with XXXX 0000 and ends with XXXX 1111.
*
*******************************************************************************/
unsigned char b_spi_eeprom_write_multi_byte(char uc_address,
											const char *kpuc_data_buffer,
											unsigned char uc_length)
{
	unsigned char uc_status;
	
	// Make sure the length is not over 16 bytes.
	if (uc_length > 16) {
		return 1;
	}	
	
	// Make sure it won't cross the SPI EEPROM page boundary.
	if ((uc_address + uc_length - 1) > (uc_address | 0x0f)) {
		return 1;
	}	
	
	// Set the write enable latch.
	SPI_EEPROM_CSN = 0;				// Activate the Chip Select.
	uc_send_receive_spi(CMD_WREN);	// Send the command.	
	SPI_EEPROM_CSN = 1;				// Deactivate the Chip Select.
	
	__delay_us(1);
	
	// Write to the EEPROM.
	SPI_EEPROM_CSN = 0;								// Activate the Chip Select.
	uc_send_receive_spi(CMD_WRITE);					// Send the write command.
	uc_send_receive_spi(uc_address);				// Send the address.
	
	while (uc_length-- > 0) {
		 uc_send_receive_spi(*kpuc_data_buffer++);	// Write the data.
	}	
	
	SPI_EEPROM_CSN = 1;								// Deactivate the Chip Select.
	
	__delay_us(1);
	
	// Wait for the write to complete.
	do {
		// Read the status register of the SPI EEPROM.
		SPI_EEPROM_CSN = 0;						// Activate the Chip Select.
		uc_send_receive_spi(CMD_RDSR);			// Send the command.
		uc_status = uc_send_receive_spi(0xff);	// Read the data.
		SPI_EEPROM_CSN = 1;						// Deactivate the Chip Select.
		
		// Mask out the other bit except the Write-In-Process bit.
		uc_status &= 0x01;
	} while (uc_status != 0);
	
	return 0;
}
