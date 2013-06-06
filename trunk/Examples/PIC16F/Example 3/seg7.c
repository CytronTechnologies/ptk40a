/*******************************************************************************
* This file provides the functions for the 2 x 7 segment on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <htc.h>
#include "system.h"
#include "seg7.h"



/* The protocol for the CD4511
LE	D	C	B	A	a 	b	c	d	e	f	g	Display 
0	0	0	0	0	1	1	1	1	1	1	0	'0'	
0	0	0	0	1	0	1	1	0	0	0	0	'1'	
0	0	0	1	0	1	1	0	1	1	0	1	'2'	
0	0	0	1	1	1	1	1	1	0	0	1	'3'	
0	0	1	0	0	0	1	1	0	0	1	1	'4'	
0	0	1	0	1	1	0	1	1	0	1	1	'5'	
0	0	1	1	0	0	0	1	1	1	1	1	'6'	
0	0	1	1	1	1	1	1	0	0	0	0	'7'	
0	1	0	0	0	1	1	1	1	1	1	1	'8'	
0	1	0	0	1	1	1	1	0	0	1	1	'9'	
0	1	0	1	0	0	0	0	0	0	0	0	' '	(blank)
0	1	0	1	1	0	0	0	0	0	0	0	' '	(blank)
0	1	1	0	0	0	0	0	0	0	0	0	' '	(blank)
0	1	1	0	1	0	0	0	0	0	0	0	' '	(blank)
0	1	1	1	0	0	0	0	0	0	0	0	' '	(blank)
0	1	1	1	1	0	0	0	0	0	0	0	' '	(blank)
1	X	X	X	X	*	* 	* 	*	*	*	*	'*'	(depend on the value at ABCD during LE from 0 to 1

X = Don't care
* = special condition



/*******************************************************************************
* PUBLIC FUNCTION: seg7_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize and clear the 7 segment LED
*
*******************************************************************************/
void seg7_initialize(void)
{
	S7_L1 = 0;
	S7_L2 = 0;
	S7_DATA = (S7_DATA & 0xf0) | 0x0A;
	__delay_ms(1);	//delay for a while
	S7_L1 = 1;	//holding the state before this, which is blank
	S7_L2 = 1;	//holding the state before this, which is blank
	S7_DATA = S7_DATA & 0xf0;
}




/*******************************************************************************
* PUBLIC FUNCTION: seg7_1_dis(unsigned char uc_number)
*
* PARAMETERS:
* ~ uc_number which will be display on 7 segment, 0 to 9, other value will result in blank.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Display the value of uc_number on 7 segment 1 and hold it
*
*******************************************************************************/
void seg7_1_dis(unsigned char uc_number)
{
	S7_L1 = 0;	
	S7_DATA = (S7_DATA & 0xf0) | uc_number;
	__delay_ms(1);	//delay for a while	
	S7_L1 = 1;	//holding the state before this, which is the uc_number
	S7_DATA = S7_DATA & 0xf0;
}



/*******************************************************************************
* PUBLIC FUNCTION: seg7_2_dis(unsigned char uc_number)
*
* PARAMETERS:
* ~ uc_number which will be display on 7 segment, 0 to 9, other value will result in blank.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Display the value of uc_number on 7 segment 2 and hold it
*
*******************************************************************************/
void seg7_2_dis(unsigned char uc_number)
{
	S7_L2 = 0;	
	S7_DATA = (S7_DATA & 0xf0) | uc_number;
	__delay_ms(1);	//delay for a while	
	S7_L2 = 1;		//holding the state before this, which is the uc_number
	S7_DATA = S7_DATA & 0xf0;

}


/*******************************************************************************
* PUBLIC FUNCTION: seg7_com_dis(unsigned char uc_number)
*
* PARAMETERS:
* ~ uc_number which will be display on both 7 segment, 0 to 99, other value will result in blank.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Display the value of uc_number on both 7 segment and hold it
*
*******************************************************************************/
void seg7_com_dis(unsigned char uc_number)
{
	if(uc_number > 99)
	{
	seg7_1_dis(0x0A);	//blank
	seg7_2_dis(0x0A);	//blank
	}
	else
	{
	seg7_1_dis(uc_number%10);	//display the 1st 10 based digit
	seg7_2_dis(uc_number/10);	//display the 2nd 10 based digit
	}
}