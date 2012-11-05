/*******************************************************************************
* This file provides the functions for the UART module on PTK40A using PIC18F
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/
#include <p18cxxx.h>	//include the PIC18F model of PIC header file
#include "system.h"
#include "uart.h"

/*******************************************************************************
* PUBLIC FUNCTION: uart_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the UART module.
*
*******************************************************************************/
void uart_initialize(void)
{
	unsigned char dummy = 0;
	TXSTAbits.BRGH = 0;			// Select low speed baud rate, if we are using SPBRGH.
	BAUDCONbits.BRG16 = 1;		//Uses SPBRGH and SPBRG for baudrate generation
	SPBRGH = ( (_XTAL_FREQ / 16 / UART_BAUD) - 1 ) /256;	//calculate and assign the higher byte for SPBRGH
	SPBRG = ((_XTAL_FREQ / 16 / UART_BAUD) - 1)%256 ;	// Configure the baud rate.
	RCSTAbits.SPEN = 1;	// Enable serial port.
	RCSTAbits.CREN = 1;	// Enable reception.
	TXSTAbits.TXEN = 1;	// Enable transmission.
	dummy = RCREG;		// dummy read, to clear the receive buffer
	dummy = RCREG; 
}



/*******************************************************************************
* PUBLIC FUNCTION: uart_transmit
*
* PARAMETERS:
* ~ uc_data		- The data that we want to transmit.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* This function will transmit one byte of data using UART. This is a blocking
* function, if the transmit buffer is full, we will wait until the
* data in the buffer has been sent out before we move in the new data.
*
*******************************************************************************/
void uart_transmit(unsigned char uc_data)
{
	// Wait until the transmit buffer is ready for new data.
	while (PIR1bits.TXIF == 0);
	
	// Transmit the data.
	TXREG = uc_data;
}



/*******************************************************************************
* PUBLIC FUNCTION: uc_uart_receive
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The data received from the UART.
*
* DESCRIPTIONS:
* This function will receive one byte of data using UART. This is a blocking
* function because if the receive buffer is empty, we will wait until the
* data is received.
*
*******************************************************************************/
unsigned char uc_uart_receive(void)
{
	// If there is overrun error...
	if (RCSTAbits.OERR == 1) {
		// Clear the flag by disable and enable back the reception.
		RCSTAbits.CREN = 0;
		RCSTAbits.CREN = 1;
	}	
	
	// Wait until there is data available in the receive buffer.
	while (PIR1bits.RCIF == 0);
	
	// Return the received data.
	return RCREG;
}



/*******************************************************************************
* PUBLIC FUNCTION: uart_putstr
*
* PARAMETERS:
* ~ csz_string	- The null terminated string to transmit.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Transmit a string using the UART.
*
*******************************************************************************/
void uart_putstr(rom const char* csz_string)
{
	// Loop until the end of string.
	while (*csz_string != '\0') {
		uart_transmit(*csz_string);
			
		// Point to next character.
		csz_string++;
	}
}
