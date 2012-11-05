/*******************************************************************************
* This file provides the functions for the 2x16 LCD display on PTK40A
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _LCD_H
#define _LCD_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

/*******************************************************************************
* PUBLIC FUNCTION: lcd_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize and clear the LCD display.
*
*******************************************************************************/
extern void lcd_initialize(void);


/*******************************************************************************
* PUBLIC FUNCTION: lcd_config
*
* PARAMETERS:
* ~ uc_config
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* configuration LCD
*
*******************************************************************************/
extern void lcd_config(unsigned char uc_config);


/*******************************************************************************
* PUBLIC FUNCTION: lcd_clear
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Clear the LCD display and return the cursor to the home position.
*
*******************************************************************************/
extern void lcd_clear(void);


/*******************************************************************************
* PUBLIC FUNCTION: lcd_home
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Return the cursor to the home position.
*
*******************************************************************************/
extern void lcd_home(void);


/*******************************************************************************
* PUBLIC FUNCTION: lcd_2ndline
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Jump to the second line of the LCD display.
*
*******************************************************************************/
extern void lcd_2ndline(void);


/*******************************************************************************
* PUBLIC FUNCTION: lcd_goto
*
* PARAMETERS:
* ~ uc_position	- The position that we want to set the cursor at.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Jump to the defined position of the LCD display.
*
*******************************************************************************/
extern void lcd_goto(unsigned char uc_position);



/*******************************************************************************
* PUBLIC FUNCTION: lcd_putchar
*
* PARAMETERS:
* ~ c_data	- The character to display.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Display a character on the LCD.
*
*******************************************************************************/
extern void lcd_putchar(char c_data);


/*******************************************************************************
* PUBLIC FUNCTION: lcd_putstr
*
* PARAMETERS:
* ~ csz_string	- The null terminated string to display.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Display a string on the LCD.
*
*******************************************************************************/
extern void lcd_putstr(rom const char* csz_string);

/*******************************************************************************
* PUBLIC FUNCTION: lcd_bcd
*
* PARAMETERS:
* ~ uc_digit, ui_number
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* convert the value in ui_number to BCD(Binary Code Decimal) and display the digit according to uc_digit needed.
*
*******************************************************************************/
extern void lcd_bcd(unsigned char uc_digit, unsigned int ui_number);

/*******************************************************************************
* PUBLIC FUNCTION: lcd_binary
*
* PARAMETERS:
* ~ uc_digit, uc_value
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* convert the value in uc_value to binary code and display the digit according to uc_digit needed.
*
*******************************************************************************/
extern void lcd_binary(unsigned char uc_digit, unsigned char uc_number);

/*******************************************************************************
* PUBLIC FUNCTION: lcd_float
*
* PARAMETERS:
* ~ uc_digit, f_value
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* convert the value in f_value to ASCII code and display the digit according to uc_digit as the digit after to floating point.
*
*******************************************************************************/
void lcd_float(unsigned char uc_digit, float f_value);


/*******************************************************************************
* PRIVATE FUNCTION: lcd_clear_msg
*
* PARAMETERS:
* ~ csz_string	- The null terminated string to display.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* clear LCD and display message on LCD
*
*******************************************************************************/
extern void lcd_clear_msg(rom const char* csz_string);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_error_trap
*
* PARAMETERS:
* ~ csz_string	- The null terminated string to display.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* clear LCD and display message on LCD, beep 10 times and further trap the program with while (1)
*
*******************************************************************************/
extern void lcd_error_trap(rom const char* csz_string);


/*******************************************************************************
* PRIVATE FUNCTION: lcd_1stline_msg
*
* PARAMETERS:
* ~ csz_string	- The null terminated string to display.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* clear LCD on 1st line (upper row) and display message from home
*
*******************************************************************************/
extern void lcd_1stline_msg(rom const char* csz_string);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_2ndline_msg
*
* PARAMETERS:
* ~ csz_string	- The null terminated string to display.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* clear LCD on 2nd line (lower row) and display message from 1st column of 2nd row
*
*******************************************************************************/
extern void lcd_2ndline_msg(rom  const char* csz_string);



/*******************************************************************************
* PRIVATE FUNCTION: lcd_display
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
*Enable the Display on LCD
*
*******************************************************************************/
extern void lcd_display(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_no_display
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
*Disable the Display on LCD
*
*******************************************************************************/
extern void lcd_no_display(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_cursor
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Enable the Cursor on LCD
*
*******************************************************************************/
extern void lcd_cursor(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_no_cursor
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
*Disable the Cursor on LCD
*
*******************************************************************************/
extern void lcd_no_cursor(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_cursor_blink
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Enable the Cursor blink on LCD
*
*******************************************************************************/
extern void lcd_cursor_blink(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_no_blink
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
*Disable the Cursor Blink on LCD
*
*******************************************************************************/
extern void lcd_no_blink(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_shift_left
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Shift the display to left
*
*******************************************************************************/
extern void lcd_shift_left(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_shift_right
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Shift the display to right
*
*******************************************************************************/
extern void lcd_shift_right(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_left_to_right
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Enable the text flow from left to right, default 
*
*******************************************************************************/
extern void lcd_left_to_right(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_right_to_left
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Enable the text flow from right to left
*
*******************************************************************************/
extern void lcd_right_to_left(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_autoscroll
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* This will 'right justify' text from the cursor
*
*******************************************************************************/
extern void lcd_autoscroll(void);

/*******************************************************************************
* PRIVATE FUNCTION: lcd_no_autoscroll
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* This will 'left justify' text from the cursor
*
*******************************************************************************/
extern void lcd_no_autoscroll(void);



#endif
