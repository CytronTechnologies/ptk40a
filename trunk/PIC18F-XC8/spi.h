/*******************************************************************************
* This file provides the functions for the SPI module on PTK40A, using PIC16F877A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _SPI_H
#define _SPI_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

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
extern void spi_initialize(void);



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
extern unsigned char uc_send_receive_spi(unsigned char uc_data);



#endif
