/*******************************************************************************
* This file provides the functions for the 4x4 Keypad on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _KEYPAD_H
#define _KEYPAD_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

/*******************************************************************************
* PUBLIC FUNCTION: c_read_keypad
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ ASCII code for the pressed key. Return 0 if no key is pressed.
*
* DESCRIPTIONS:
* Read from the keypad.
*
*******************************************************************************/
extern unsigned char c_read_keypad(void);

/*******************************************************************************
* PUBLIC FUNCTION: c_key_to_ASCII
*
* PARAMETERS:
* ~ unsigned char key_number
*
* RETURN:
* ~ ASCII code for the pressed key.
*
* DESCRIPTIONS:
* Convert the numeric value of key scan to proper ASCII code. Apply only for TB40A onboard 4x4 keypad
*
*******************************************************************************/
extern unsigned char c_key_to_ASCII (unsigned char key_number);

/*******************************************************************************
* PUBLIC FUNCTION: c_wait_keypad
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ ASCII code for the pressed key.
*
* DESCRIPTIONS:
* Wait until the key is pressed and released.
*
*******************************************************************************/
extern unsigned char c_wait_keypad(void);



#endif
