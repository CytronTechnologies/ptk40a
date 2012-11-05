/*******************************************************************************
* This file provides the functions for the I2C module for PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _I2C_H
#define _I2C_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

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
extern void i2c_initialize(void);



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
extern unsigned char b_i2c_check_error_flag(void);



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
extern unsigned char uc_i2c_read(unsigned char uc_slave_address, unsigned char uc_register);



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
extern void uc_i2c_write(unsigned char uc_slave_address, unsigned char uc_register, unsigned char uc_data);



#endif
