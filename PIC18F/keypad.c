/*******************************************************************************
* This file provides the functions for the 4x4 Keypad on PTK40A
* for PIC18F
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/
#include <p18cxxx.h>	//include the PIC18F model of PIC header file
#include "system.h"
#include "delay18.h"
#include "keypad.h"


/*******************************************************************************
* PUBLIC FUNCTION: c_read_keypad
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ numeric value for the pressed key. Return 0xFF if no key is pressed.
*
* DESCRIPTIONS:
* Read from the keypad.
*
*******************************************************************************/
unsigned char c_read_keypad(void)
{
	//start the scanning process
	KP_R1 = 0;		// scan keypress on 1st row: 1, 2, 3, A
	KP_R2 = 1;
	KP_R3 = 1;
	KP_R4 = 1;
	//Delay a short time for the pin to get to correct state before detecting proper key
	delay_10us(1);	
	if (KP_C1 == 0) return 1;		// Key '1' is pressed
	if (KP_C2 == 0) return 2;		// Key '2' is pressed
	if (KP_C3 == 0) return 3;		// Key '3' is pressed
	if (KP_C4 == 0) return 10;		// Key 'A' is pressed, we will store as 10 
	
	KP_R1 = 1;		// scan keypress on 2nd row: 4, 5, 6, B
	KP_R2 = 0;
	KP_R3 = 1;
	KP_R4 = 1;
	//Delay a short time for the pin to get to correct state before detecting proper key
	delay_10us(1);
	if (KP_C1 == 0) return 4;		// Key '4' is pressed
	if (KP_C2 == 0) return 5;		// Key '5' is pressed
	if (KP_C3 == 0) return 6;		// Key '6' is pressed
	if (KP_C4 == 0) return 11;		// Key 'B' is pressed, we will store as 11			
	
	KP_R1 = 1;		// scan keypress on 3rd row: 7, 8, 9, C
	KP_R2 = 1;
	KP_R3 = 0;
	KP_R4 = 1;
	//Delay a short time for the pin to get to correct state before detecting proper key
	delay_10us(1);
	if (KP_C1 == 0) return 7;		// Key '7' is pressed
	if (KP_C2 == 0) return 8;		// Key '8' is pressed
	if (KP_C3 == 0) return 9;		// Key '9' is pressed
	if (KP_C4 == 0) return 12;		// Key 'C' is pressed, we will store as 12			
		
	KP_R1 = 1;		// scan keypress on 4th row: *, 0, #, D
	KP_R2 = 1;
	KP_R3 = 1;
	KP_R4 = 0;
	//Delay a short time for the pin to get to correct state before detecting proper key
	delay_10us(1);
	if (KP_C1 == 0) return 14;		// Key '*' is pressed, we will store as 14
	if (KP_C2 == 0) return 0;		// Key '0' is pressed
	if (KP_C3 == 0) return 15;		// Key '#' is pressed, we will store as 15
	if (KP_C4 == 0) return 13;		// Key 'D' is pressed, we will store as 13			
	
	return 0xFF;					// if no key press, the register is 0xFF		
}

/*******************************************************************************
* PUBLIC FUNCTION: c_key_to_ASCII
*
* PARAMETERS:
* ~ unsigned char key_number
*
* RETURN:
* ~ ASCII code for the value from read keypad function
*
* DESCRIPTIONS:
* Convert the numeric value of key scan to proper ASCII code. Apply only for TB40A onboard 4x4 keypad
*
*******************************************************************************/
unsigned char c_key_to_ASCII (unsigned char key_number)
{
	// if number is from 0 to 9, convert to ASCII character by adding 0x30
	if (key_number < 10)	return key_number + 0x30;	
				
	// if number is greater than 9, it is alphabet and symbol
	if (key_number == 10) return 'A';	// convert to ASCII A
	if (key_number == 11) return 'B';	// convert to ASCII B
	if (key_number == 12) return 'C';	// convert to ASCII C
	if (key_number == 13) return 'D';	// convert to ASCII D
	if (key_number == 14) return '*';	// convert to ASCII *
	if (key_number == 15) return '#';	// convert to ASCII #
	return 0;	//no key pressed, return null
}	

/*******************************************************************************
* PUBLIC FUNCTION: c_wait_keypad
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ numeric value for the pressed key.
*
* DESCRIPTIONS:
* Wait until the key is pressed and released.
*
*******************************************************************************/
unsigned char c_wait_keypad(void)
{
	// The pressed key.
	unsigned char c_pressed_key = 0xFF;	
	
	// Wait until the key is pressed.
	do {
		c_pressed_key = c_read_keypad();
	}	
	while (c_pressed_key == 0xFF);
	
	// Wait until the key is released.
	while (c_read_keypad() != 0xFF);
	
	return c_pressed_key;
}	
	