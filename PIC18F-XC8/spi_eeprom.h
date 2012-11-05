/*******************************************************************************
* This file provides the functions for the 25AA020A SPI EEPROM on PTK40A
* Prior to using these functions, user need to initialize the SPI module.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _SPI_EEPROM_H
#define _SPI_EEPROM_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

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
extern unsigned char uc_spi_eeprom_read_single_byte(unsigned char uc_address);



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
extern void spi_eeprom_read_multi_byte(unsigned char uc_address,
									   unsigned char *puc_data_buffer,
									   unsigned char uc_length);



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
extern void spi_eeprom_write_single_byte(unsigned char uc_address, unsigned char uc_data);



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
extern unsigned char b_spi_eeprom_write_multi_byte(char uc_address,
												   const char *kpuc_data_buffer,
												   unsigned char uc_length);



#endif
