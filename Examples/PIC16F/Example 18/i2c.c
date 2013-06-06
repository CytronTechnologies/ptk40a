/*******************************************************************************
* This file provides the functions for the I2C module for PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
#include "system.h"
#include "i2c.h"



/*******************************************************************************
* PRIVATE GLOBAL VARIABLES                                                     *
*******************************************************************************/

// The flag to indicate whether an I2C error has occured.
unsigned char b_i2c_error_flag = 0;



/*******************************************************************************
* PUBLIC FUNCTION: i2c_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the I2C module.
*
*******************************************************************************/
void i2c_initialize(void)
{
	// Set the SCL and SDA pin as input.
	TRISC3 = 1;
	TRISC4 = 1;
	
	// Set the I2C clock frequency.
	// 400kHz, SSPADD = (FOSC / (4 * F_I2C) ) - 1
	SSPADD = 12;
	
	// Select I2C master mode, clock = FOSC / (4 * (SSPADD+1) ).
	SSPM3 = 1;
	SSPM2 = 0;
	SSPM1 = 0;
	SSPM0 = 0;						
	
	// Clear the Write Collision Detect bit.
	WCOL = 0;
	
	// Clear the Receive Overflow Indicator bit.
	SSPOV = 0;						
	
	// Enable the MSSP module.
	SSPEN = 1;						
}	



/*******************************************************************************
* PUBLIC FUNCTION: b_i2c_check_error_flag
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The error flag of the previous I2C operation.
* ~ Return 0 if no error. Return 1 otherwise.
*
* DESCRIPTIONS:
* This function will check the error flag of the previous I2C operation.
*
*******************************************************************************/
unsigned char b_i2c_check_error_flag(void)
{
	return b_i2c_error_flag;	
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_read
*
* PARAMETERS:
* ~ uc_slave_address	- The I2C slave address.
* ~ uc_register			- The register that we want to read.
*
* RETURN:
* ~ The data that we read from the I2C.
*
* DESCRIPTIONS:
* This function will read a single byte of data using the I2C.
*
*******************************************************************************/
unsigned char uc_i2c_read(unsigned char uc_slave_address, unsigned char uc_register)
{
	// Buffer for the received byte.
	unsigned char uc_received_byte;
	
	// Clear the error flag before we start a new I2C operation.
	b_i2c_error_flag = 0;
	
	// Send start bit.	
	SEN = 1;
	while (SEN == 1);
	
	// Send slave address and indicate to write.
	SSPBUF = (uc_slave_address << 1) & 0xfe;
	
	// Wait for slave to acknowledge.
	#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is used
	while (RW == 1);
	#elif defined (HITECH_V9_82) //if Hi-Tech V9.82 compiler is used	
	while (R_W == 1);
	#endif
	
	// If slave does not acknowledge...
	if (ACKSTAT == 1) {
		// Send stop bit.
		PEN = 1;
		while (PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return 0;
	}
	
	// Send the register address that we want to read.
	SSPBUF = uc_register;
	
	// Wait for slave to acknowledge.
	#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is used
	while (RW == 1);
	#elif defined (HITECH_V9_82) //if Hi-Tech V9.82 compiler is used	
	while (R_W == 1);
	#endif
	
	// If slave does not acknowledge...
	if (ACKSTAT == 1) {
		// Send stop bit.
		PEN = 1;
		while (PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return 0;
	}
	
	
	
	// Send repeated start bit.
	RSEN = 1;
	while (RSEN == 1);
	
	// Send slave address and indicate to read.
	SSPBUF = (uc_slave_address << 1) | 0x01;
	
	// Wait for slave to acknowledge.
	#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is used
	while (RW == 1);
	#elif defined (HITECH_V9_82) //if Hi-Tech V9.82 compiler is used	
	while (R_W == 1);
	#endif
	
	// If slave does not acknowledge...
	if (ACKSTAT == 1) {
		// Send stop bit.
		PEN = 1;
		while (PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return 0;
	}
	
	// Enable receive.
	RCEN = 1;
	
	// Wait until the data is received.
	unsigned long count = 10000L;
	while (BF == 0) {
		
		// If timeout...
		if (--count == 0) {
			// Send stop bit.
			PEN = 1;
			while (PEN == 1);
			
			// Set the error flag and exit.
			b_i2c_error_flag = 1;
			return 0;
		}
	}
	
	// Read the received data.
	uc_received_byte = SSPBUF;
	
	// Send Not Acknowledge.
	ACKDT = 1;
	ACKEN = 1;
	while (ACKEN == 1);
	
	// Send stop bit
	PEN = 1;
	while (PEN == 1);
	
	// Clear the error flag and return the received data.
	b_i2c_error_flag = 0;
	return uc_received_byte;
}



/*******************************************************************************
* PRIVATE FUNCTION: uc_i2c_write
*
* PARAMETERS:
* ~ uc_slave_address	- The I2C slave address.
* ~ uc_register			- The register that we want to write.
* ~ uc_data				- The data that we want to write.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* This function will write a single byte of data using the I2C.
*
*******************************************************************************/
void uc_i2c_write(unsigned char uc_slave_address, unsigned char uc_register, unsigned char uc_data)
{
	// Clear the error flag before we start a new I2C operation.
	b_i2c_error_flag = 0;
	
	// Send start bit.	
	SEN = 1;
	while (SEN == 1);
	
	// Send slave address and indicate to write.
	SSPBUF = (uc_slave_address << 1) & 0xfe;
	
	// Wait for slave to acknowledge.
	#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is used
	while (RW == 1);
	#elif defined (HITECH_V9_82) //if Hi-Tech V9.82 compiler is used	
	while (R_W == 1);
	#endif
	
	// If slave does not acknowledge...
	if (ACKSTAT == 1) {
		// Send stop bit.
		PEN = 1;
		while (PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return;
	}
	
	// Send the register address that we want to write.
	SSPBUF = uc_register;
	
	// Wait for slave to acknowledge.
	#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is used
	while (RW == 1);
	#elif defined (HITECH_V9_82) //if Hi-Tech V9.82 compiler is used	
	while (R_W == 1);
	#endif
	
	// If slave does not acknowledge...
	if (ACKSTAT == 1) {
		// Send stop bit.
		PEN = 1;
		while (PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return;
	}
	
	// Send the data.
	SSPBUF = uc_data;
	
	// Wait for slave to acknowledge.
	#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is used
	while (RW == 1);
	#elif defined (HITECH_V9_82) //if Hi-Tech V9.82 compiler is used	
	while (R_W == 1);
	#endif
	
	// If slave does not acknowledge...
	if (ACKSTAT == 1) {
		// Send stop bit.
		PEN = 1;
		while (PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return;
	}
	
	// Send stop bit
	PEN = 1;
	while (PEN == 1);
	
	// Clear the error flag.
	b_i2c_error_flag = 0;
}
