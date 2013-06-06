/*******************************************************************************
* This file provides the functions for the 2 x 7 segment on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _SEG7_H
#define _SEG7_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/
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
extern void seg7_initialize(void);


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
extern void seg7_1_dis(unsigned char uc_number);



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
extern void seg7_2_dis(unsigned char uc_number);



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
extern void seg7_com_dis(unsigned char uc_number);


#endif
