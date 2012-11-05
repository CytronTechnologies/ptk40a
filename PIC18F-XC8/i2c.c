/*******************************************************************************
* This file provides the functions for the I2C module for PTK40A
* PIC18F
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <xc.h>	//include the PIC18F model of PIC header file
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
	#if defined (__18F4520)
	TRISCbits.TRISC3 = 1;
	TRISCbits.TRISC4 = 1;
	#elif defined (__18F4550)
	TRISBbits.TRISB0 = 1;	//PIC18F4550 I2C pin is located at RB0 and RB1
	TRISBbits.TRISB1 = 1;	//PTK40A cannot use I2C if PIC18F4550 is used.
	#endif
	
	// Set the I2C clock frequency.
	// 400kHz, SSPADD = (FOSC / (4 * F_I2C) ) - 1
	#if (_XTAL_FREQ == 20000000)
	SSPADD = 12;			//20MHz Fosc
	#elif (_XTAL_FREQ == 48000000)
	SSPADD = 29;			//48MHz Fosc
	#endif
	
	SSPSTATbits.SMP = 0;	//Slew Rate Control enable for 400KHz clock
	
	// Select I2C master mode, clock = FOSC / (4 * (SSPADD+1) ).
	SSPCON1bits.SSPM3 = 1;
	SSPCON1bits.SSPM2 = 0;
	SSPCON1bits.SSPM1 = 0;
	SSPCON1bits.SSPM0 = 0;						
	
	// Clear the Write Collision Detect bit.
	SSPCON1bits.WCOL = 0;
	
	// Clear the Receive Overflow Indicator bit.
	SSPCON1bits.SSPOV = 0;						
	
	// Enable the MSSP module.
	SSPCON1bits.SSPEN = 1;	
	
	// Send stop condition, stop any previous communication
	SSPCON2bits.PEN = 1;
	while (SSPCON2bits.PEN == 1);					
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
unsigned char uc_i2c_read(unsigned char uc_slave_address, unsigned char uc_register_add)
{
	// Buffer for the received byte.
	unsigned char uc_received_byte;
	unsigned long count = 10000;
	// Clear the error flag before we start a new I2C operation.
	b_i2c_error_flag = 0;
	
	// Send start bit.	
	SSPCON2bits.SEN = 1;
	while (SSPCON2bits.SEN == 1);
	
	// Send slave address and indicate to write.
	SSPBUF = (uc_slave_address << 1) & 0xfe;

	
	// Wait for slave to acknowledge.
	//while (SSPSTATbits.R_W == 1);	
	
	i2c_idle();	//wait for the message sending process complete
	
	// If slave does not acknowledge...
	if (SSPCON2bits.ACKSTAT == 1) {
		// Send stop bit.
		SSPCON2bits.PEN = 1;
		while (SSPCON2bits.PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return 0;
	}
	
	// Send the register address that we want to read and I2C will start transmitting out
	SSPBUF = uc_register_add;
	
	// Wait for slave to acknowledge.
	//while (SSPSTATbits.R_W == 1);
	
	i2c_idle();	//wait for the message sending process complete
	
	// If slave does not acknowledge...
	if (SSPCON2bits.ACKSTAT == 1) {
		// Send stop bit.
		SSPCON2bits.PEN = 1;
		while (SSPCON2bits.PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return 0;
	}	
	
	// Send repeated start bit.
	SSPCON2bits.RSEN = 1;
	while (SSPCON2bits.RSEN == 1);
	
	// Send slave address and indicate to read.
	SSPBUF = (uc_slave_address << 1) | 0x01;
	
	// Wait for slave to acknowledge.
	//while (SSPSTATbits.R_W == 1);
	
	i2c_idle();	//wait for the message sending process complete
	
	// If slave does not acknowledge...
	if (SSPCON2bits.ACKSTAT == 1) {
		// Send stop bit.
		SSPCON2bits.PEN = 1;
		while (SSPCON2bits.PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return 0;
	}
	
	// Enable receive.
	SSPCON2bits.RCEN = 1;
	
	// Wait until the data is received.
	while (SSPSTATbits.BF == 0) 
	{		
		// If timeout...
		if (--count == 0)
		{
			// Send stop bit.
			SSPCON2bits.PEN = 1;
			while (SSPCON2bits.PEN == 1);
			
			// Set the error flag and exit.
			b_i2c_error_flag = 1;
			return 0;
		}
	}
	
	// Read the received data.
	uc_received_byte = SSPBUF;
	
	// Send Not Acknowledge.
	SSPCON2bits.ACKDT = 1;
	SSPCON2bits.ACKEN = 1;
	while (SSPCON2bits.ACKEN == 1);
	
	// Send stop bit
	SSPCON2bits.PEN = 1;
	while (SSPCON2bits.PEN == 1);
	
	// Clear the error flag and return the received data.
	b_i2c_error_flag = 0;
	return uc_received_byte;
}



/*******************************************************************************
* PRIVATE FUNCTION: uc_i2c_write
*
* PARAMETERS:
* ~ uc_slave_address	- The I2C slave address.
* ~ uc_register_add	- The register address that we want to write.
* ~ uc_data			- The data that we want to write.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* This function will write a single byte of data using the I2C.
*
*******************************************************************************/
void uc_i2c_write(unsigned char uc_slave_address, unsigned char uc_register_add, unsigned char uc_data)
{
	// Clear the error flag before we start a new I2C operation.
	b_i2c_error_flag = 0;
	
	// Send start bit.	
	SSPCON2bits.SEN = 1;
	while (SSPCON2bits.SEN == 1);
	
	// Send slave address and indicate to write.
	SSPBUF = (uc_slave_address << 1) & 0xfe;
	
	// Wait for slave to acknowledge.
	//while (SSPSTATbits.R_W == 1);
	
	i2c_idle();	//wait for the message sending process complete
	
	// If slave does not acknowledge...
	if (SSPCON2bits.ACKSTAT == 1)
	{
		// Send stop bit.
		SSPCON2bits.PEN = 1;
		while (SSPCON2bits.PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return;
	}
	
	// Send the register address that we want to write.
	SSPBUF = uc_register_add;
	
	// Wait for slave to acknowledge.
	//while (SSPSTATbits.R_W == 1);
	
	i2c_idle();	//wait for the message sending process complete
	
	// If slave does not acknowledge...
	if (SSPCON2bits.ACKSTAT == 1) 
	{
		// Send stop bit.
		SSPCON2bits.PEN = 1;
		while (SSPCON2bits.PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return;
	}
	
	// Send the data.
	SSPBUF = uc_data;
	
	// Wait for slave to acknowledge.
	//while (SSPSTATbits.R_W == 1);
	
	i2c_idle();	//wait for the message sending process complete
	
	// If slave does not acknowledge...
	if (SSPCON2bits.ACKSTAT == 1) {
		// Send stop bit.
		SSPCON2bits.PEN = 1;
		while (SSPCON2bits.PEN == 1);
		
		// Set the error flag and exit.
		b_i2c_error_flag = 1;
		return;
	}
	
	// Send stop bit
	SSPCON2bits.PEN = 1;
	while (SSPCON2bits.PEN == 1);
	
	// Clear the error flag.
	b_i2c_error_flag = 0;
}

/*******************************************************************************
* PRIVATE FUNCTION: i2c_idle
*
* PARAMETERS:
* ~ void.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* This function will wait for data to send out or to receive.
*
*******************************************************************************/
void i2c_idle(void)
{
	//Need to wait until all ACKEN, RSEN, PEN, RSEN, SEN bit and RW bit is clear
	while((SSPCON2 & 0b00011111) | (SSPSTATbits.R_W));	
}	
