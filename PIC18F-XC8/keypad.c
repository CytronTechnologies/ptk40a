/*******************************************************************************
* This file provides the functions for the 4x4 Keypad on PTK40A
* for PIC18F
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/
#include <xc.h>	//include the PIC18F model of PIC header file
#include "system.h"
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
    unsigned char key = 0xFF;
    //start the scanning process
    TRIS_KP_R1 = 0;	//make data direction of Row 1 pin output
    TRIS_KP_R2 = 1;	// the rest become input
    TRIS_KP_R3 = 1;
    TRIS_KP_R4 = 1;
    KP_R1 = 0;		// scan keypress on 1st row: 1, 2, 3, A
    //Delay a short time for the pin to get to correct state before detecting proper key
    __delay_us(15);
    if (KP_C1 == 0) key =  1;		// Key '1' is pressed
    else if (KP_C2 == 0) key =  2;		// Key '2' is pressed
    else if (KP_C3 == 0) key =  3;		// Key '3' is pressed
    else if (KP_C4 == 0) key =  10;		// Key 'A' is pressed, we will store as 10
    else
    {
        TRIS_KP_R1 = 1;	//make data direction of Row 2 pin output
        TRIS_KP_R2 = 0;	// the rest become input
        KP_R2 = 0;	// scan keypress on 2nd row: 4, 5, 6, B
        //Delay a short time for the pin to get to correct state before detecting proper key
        __delay_us(15);
        if (KP_C1 == 0) key =  4;		// Key '4' is pressed
        else if (KP_C2 == 0) key =  5;		// Key '5' is pressed
        else if (KP_C3 == 0) key =  6;		// Key '6' is pressed
        else if (KP_C4 == 0) key =  11;		// Key 'B' is pressed, we will store as 11
        else
        {
            TRIS_KP_R2 = 1;	//make data direction of Row 3 pin output
            TRIS_KP_R3 = 0;	// the rest become input
            KP_R3 = 0;		// scan keypress on 3rd row: 7, 8, 9, C
            //Delay a short time for the pin to get to correct state before detecting proper key
            __delay_us(15);
            if (KP_C1 == 0) key =  7;		// Key '7' is pressed
            else if (KP_C2 == 0) key =  8;		// Key '8' is pressed
            else if (KP_C3 == 0) key =  9;		// Key '9' is pressed
            else if (KP_C4 == 0) key =  12;		// Key 'C' is pressed, we will store as 12
            else
            {
                TRIS_KP_R3 = 1;	//make data direction of Row 4 pin output
                TRIS_KP_R4 = 0;	// the rest become input
                KP_R4 = 0;	// scan keypress on 4th row: *, 0, #, D
                //Delay a short time for the pin to get to correct state before detecting proper key
                __delay_us(15);
                if (KP_C1 == 0) key =  14;		// Key '*' is pressed, we will store as 14
                else if (KP_C2 == 0) key =  0;		// Key '0' is pressed
                else if (KP_C3 == 0) key =  15;		// Key '#' is pressed, we will store as 15
                else if (KP_C4 == 0) key =  13;		// Key 'D' is pressed, we will store as 13
                else key = 0xFF;    //no key press in this scan
            }
        }
    }
    TRIS_KP_R1 = 0;	//make all row pins as output for LCD function
    TRIS_KP_R2 = 0;
    TRIS_KP_R3 = 0;
    TRIS_KP_R4 = 0;
    return key;		// return the value in key
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
	