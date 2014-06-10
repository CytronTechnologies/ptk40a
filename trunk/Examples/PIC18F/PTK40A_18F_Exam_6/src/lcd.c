/*******************************************************************************
* This file provides the functions for the 2x16 LCD display on PTK40A, in 8 bit interface
* Meant for PIC18F
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/

#include <xc.h>	//include the PIC18F model of PIC header file
#include "system.h"
#include "lcd.h"

/*******************************************************************************
* PRIVATE CONSTANTS                                                            *
*******************************************************************************/
/* The protocol for the LCD
R/S	DB7	DB6	DB5	DB4	DB3	DB2	DB1	DB0	Functions
0	0	0	0	0	0	0	0	1	Clear LCD
0	0	0	0	0	0	0	1	X	Return Cursor to home position
0	0	0	0	0	0	1	ID	S	Set Cursor move direction
0	0	0	0	0	1	D	C	B	Enable Display/Cursor
0	0	0	0	1	SC	RL	X	X	Move Cursor/Shift Display
0	0	0	1	DL	N	F	X	X	Set Interface Length and Display format
0	1	A	A	A	A	A	A	A	Move Cursor to DDRAM
1	D	D	D	D	D	D	D	D	Write a character to Display and DDRAM
X = Don't care
A = Address
*/
// The command code for the LCD.
#define CMD_CLEAR				0b00000001	// Clear the LCD display.
#define CMD_HOME				0b00000010	// Return to home.

// The maskable command code to change the configuration of the LCD.
#define CMD_ENTRY_MODE_SET		0b00000100	// Bit: 0  0  0  0  0  1  ID S
#define CMD_DISPLAY_CONTROL		0b00001000	// Bit: 0  0  0  0  1  D  C  B
#define CMD_SHIFT_CONTROL		0b00010000	//Bit: 0  0  0  0  1  SC  RL  0  0
#define CMD_FUNCTION_SET		0b00100000	// Bit: 0  0  1  DL N  F  0  0

/* LCD command bit value and function
Bit name	Bit Function					= 0			= 1
R/S			Command or Character		Command	Character
ID			Set cursor move direction	Decrement	increment
S			Specifies to shift display		No display shift	Display shift
D			Set display On/Off			Display Off	Display On
C			Cursor On/Off				Cursor Off	Cursor On
B			Cursor Blink				Cursor Blink Off	Cursor Blink On
SC			Set Cursor move or shift D	Move Cursor	Shift Display
RL			Shift direction				Shift Left		Shift Right
DL			Sets Interface data length	4-bit Interface		8-bit Interface
N			Number of display line		1 line		2 line
F			Character font				5x8 dots		5x10 dots
*/

// The mask to change the configuration of the LCD.
#define MSK_ID		0b00000010	// Cursor Increment.
#define MSK_S		0b00000001	// Display shift.
#define MSK_D		0b00000100	// On display.
#define MSK_C		0b00000010	// Display cursor.
#define MSK_B		0b00000001	// Blink Cursor.
#define MSK_DL_8	0b00010000	// Select 8-bit data bus.
#define MSK_2L		0b00001000	// Select 2-line display.
#define MSK_F510	0b00000100	// Select 5 x 10 dots character.
#define MSK_F58		0b00000000	// Select 5 x 8 dots character.
#define MSK_SD		0b00001000	// Shift Display
#define MSK_SR		0b00000100	// Shift Right


// The maskable command to change the LCD RAM address.
#define CMD_SET_DDRAM_ADDRESS	0b10000000	// Bit 0 - 7: Address

// The DDRAM address corresponding to the second row of the LCD.
#define ADD_SECOND_ROW			0x40



/*******************************************************************************
* PRIVATE GLOBAL VARIABLES                                                     *
*******************************************************************************/
unsigned char display_shift = 0b00000000;		//SC and RL. SC = Cursor or Display shift, RL = shift direction, left or right
unsigned char display_control = 0b00000000;	//D, C, B. D = Display ON/OFF, C = Cursor ON/OFF, B = Blink ON/OFF
unsigned char display_entry = 0b00000000;		//ID and S. ID = Set cursor move direction, S = Shift display
/*******************************************************************************
* PRIVATE FUNCTION PROTOTYPES                                                  *
*******************************************************************************/

void send_lcd_data(unsigned char b_rs, unsigned char uc_data);
void set_lcd_e(unsigned char b_output);
void set_lcd_rs(unsigned char b_output);
void set_lcd_data(unsigned char uc_data);



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
void lcd_initialize(void)
{
	// Set the LCD E pin and wait for the LCD to be ready before we
	// start sending data to it.
	set_lcd_e(1);
	//Delay10KTCYx(15);	//10K cycle delay is 1ms for 40MHz Fosc
	__delay_ms(15);	//delay 15ms for LCD to start up
	
	// Configure the Function Set of the LCD.	
	send_lcd_data(0, CMD_FUNCTION_SET | MSK_DL_8 | MSK_2L | MSK_F58);
		
	// Configure the entry mode set of the LCD.
	display_entry =  MSK_ID & ~MSK_S;
	send_lcd_data(0, CMD_ENTRY_MODE_SET | display_entry);
	
	// Configure the display on/off control of the LCD.
	display_control = MSK_D & ~MSK_C & ~MSK_B;
	send_lcd_data(0, CMD_DISPLAY_CONTROL | display_control);
	
	display_shift = MSK_SD | MSK_SR;
	// Clear the LCD display.
	lcd_clear();
}

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
void lcd_config(unsigned char uc_config)
{
	send_lcd_data(0, uc_config);
}	


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
void lcd_clear(void)
{
	// Send the command to clear the LCD display.
	send_lcd_data(0, CMD_CLEAR);
}



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
void lcd_home(void)
{
	// Send the command to return the cursor to the home position.
	send_lcd_data(0, CMD_HOME);
}



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
void lcd_2ndline(void)
{
	// Send the command to jump to the second row.
	send_lcd_data(0, CMD_SET_DDRAM_ADDRESS | ADD_SECOND_ROW);
}



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
void lcd_goto(unsigned char uc_position)
{
	// Send the command to jump to the defined position.
	send_lcd_data(0, CMD_SET_DDRAM_ADDRESS | uc_position);
}



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
void lcd_putchar(char c_data)
{
	// Send the data to display.
	send_lcd_data(1, (unsigned char)c_data);
}



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
void lcd_putstr(const char* csz_string)
{
	// Loop until the end of string.
	while (*csz_string != '\0') {
		
		// Jump to the second row if '\n' or '\r' is found.
		if (*csz_string == '\n' || *csz_string == '\r') {
			lcd_2ndline();
		}
		
		// Else, display the character.
		else {
			lcd_putchar(*csz_string);
		}
		
		// Point to next character.
		csz_string++;
	}
}

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
void lcd_bcd(unsigned char uc_digit, unsigned int ui_number)
{
	unsigned int ui_decimal[5] ={ 0 };
	//extract 5 single digit from ui_number
		ui_decimal[4] = ui_number/10000;	// obtain the largest single digit, digit4 
		ui_decimal[3] = ui_number%10000;	// obtain the remainder 
		ui_decimal[2] = ui_decimal[3]%1000;			
		ui_decimal[3] = ui_decimal[3]/1000;			// obtain the 2nd largest single digit, digit3 
		ui_decimal[1] = ui_decimal[2]%100;
		ui_decimal[2] = ui_decimal[2]/100;			// obtain the 3rd largest single digit, digit2 
		ui_decimal[0] = ui_decimal[1]%10;			// obtain the smallest single digit, digit0 
		ui_decimal[1] = ui_decimal[1]/10;			// obtain the 4th largest single digit, digit1 
		
		if (uc_digit > 5) uc_digit = 5;			// limit to 5 digits only
		for( ; uc_digit > 0; uc_digit--)
		{
			lcd_putchar(ui_decimal[uc_digit - 1] + 0x30);			
		}
}

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
void lcd_binary(unsigned char uc_digit, unsigned char uc_number)
{
    unsigned char i;
    if(uc_digit > 0)
    {
        for(i = uc_digit; i > 0; i--)
        {
                lcd_putchar((0b00000001 & ( uc_number>> (i-1))) + '0');
        }
    }
		
}

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
void lcd_float(unsigned char uc_digit, float f_value)
{
	unsigned char uc_decimal[6] ={ 0 };
	unsigned long int ui_temp = 0;	//temporary register
	unsigned char i , j;
	//extract 6 single digit from f_value
	if(f_value <= 999.999) // the maximum float this function can convert
	{
		ui_temp =(unsigned long int) f_value;	//cast the float value without round up
		uc_decimal[5] = ui_temp/100;
		uc_decimal[4] = ui_temp%100;			// obtain the remainder		
		uc_decimal[3] = uc_decimal[4]%10;		// obtain the least significant digit before floating point
		uc_decimal[4] = uc_decimal[4]/10;		//obtain the 1st digit, Most Significant digit	
		
		//floating point value, maximum is 3 digit after floating point, in milli value
		ui_temp = ((unsigned int)(f_value * 1000))%1000; 	//get the 3 digit value after floating point, convert to integer
				
		uc_decimal[2] = ui_temp/100;			
		uc_decimal[1] = ui_temp%100;
		uc_decimal[0] = uc_decimal[1]%10;			// obtain the smallest single digit, digit0 
		uc_decimal[1] = uc_decimal[1]/10;			// obtain the 4th largest single digit, digit1 
		if(uc_decimal[5] != 0) 
		{
                    lcd_putchar(uc_decimal[5] + '0');
                    lcd_putchar(uc_decimal[4] + '0');
		}		
		else if (uc_decimal[4] != 0) lcd_putchar(uc_decimal[4] + '0');	//display 1st digit, MS digit
		
		lcd_putchar(uc_decimal[3] + '0');			//display 2nd digit before floating point
		
		lcd_putchar('.');	//display "dot" to lcd
		
		if(uc_digit == 0) uc_digit = 1; 	// minimum need to display 1 digit after floating point
		j= 0;
		for(i=3; i>0; i--)	//display the digit after floating point
		{			
			lcd_putchar(uc_decimal[i-1] + 0x30);
			j++;
			if(j== uc_digit) break;	// break from for loop						
		}
		if(uc_decimal[4] == 0) lcd_putchar(' ');
	}
	else 	lcd_putstr("Over");	//display message to indicate the value is too big to convert
		
}
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
void lcd_clear_msg(const char* csz_string)
{
	lcd_clear();
	lcd_putstr(csz_string);
}

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
void lcd_error_trap(const char* csz_string)
{
	char i;
	// Display the error messages and trap the error.
	lcd_clear_msg(csz_string);
	for ( i = 0; i < 20; i ++)
	{
		BUZZER = ~BUZZER;		
		__delay_ms(10);
		__delay_ms(10);
		__delay_ms(10);
		__delay_ms(10);
		__delay_ms(10);		
	}
	//create delay for ~2 seconds
	for ( i = 0; i < 200; i ++)
	{		
		__delay_ms(10);	
	}	
	
	//while (1);		
}

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
void lcd_1stline_msg(const char* csz_string)
{
	unsigned char i = 0;
	lcd_home();	
	
	while (*csz_string != '\0') 
	{		
		i++;	
		lcd_putchar(*csz_string++);		
	}
		
	for(; i<16;i++) lcd_putchar(' ');	//append the rest of space with "space"		
}	
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
void lcd_2ndline_msg(const char* csz_string)
{
	unsigned char i = 0;
	lcd_2ndline();
	
	while (*csz_string != '\0') 
	{		
		i++;	
		lcd_putchar(*csz_string++);		
	}	
	for(; i<16;i++) lcd_putchar(' '); //append the rest of space with "space"
}

/*******************************************************************************
* PRIVATE FUNCTION: send_lcd_data
*
* PARAMETERS:
* ~ b_rs		- The output of the LCD RS pin (1 or 0).
* ~ uc_data		- The output of the LCD data bus.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the output of the LCD RS pin and data bus.
*
*******************************************************************************/
void send_lcd_data(unsigned char b_rs, unsigned char uc_data)
{
		// 8-bit Mode only need to send the data once.
		set_lcd_rs(b_rs);
		set_lcd_data(uc_data);
		
		// Send a positive e pulse.
		set_lcd_e(1);		
		__delay_ms(1);
		set_lcd_e(0);			
		__delay_ms(2);
		
		// make the default stage to logic low
		set_lcd_rs(0);
		set_lcd_data(0);
}



/*******************************************************************************
* PRIVATE FUNCTION: set_lcd_e
*
* PARAMETERS:
* ~ b_output	- The output of the LCD E pin (1 or 0).
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the output of the LCD E pin.
*
*******************************************************************************/
void set_lcd_e(unsigned char b_output)
{
	LCD_E = b_output;
}



/*******************************************************************************
* PRIVATE FUNCTION: set_lcd_rs
*
* PARAMETERS:
* ~ b_output	- The output of the LCD RS pin (1 or 0).
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the output of the LCD RS pin.
*
*******************************************************************************/
void set_lcd_rs(unsigned char b_output)
{
	LCD_RS = b_output;
}



/*******************************************************************************
* PRIVATE FUNCTION: set_lcd_data
*
* PARAMETERS:
* ~ uc_data	- The output of the LCD data bus.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the output of the LCD data bus.
*
*******************************************************************************/
void set_lcd_data(unsigned char uc_data)
{
	LCD_DATA = uc_data;
}

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
void lcd_display(void)
{
	display_control |= MSK_D;
	lcd_config(CMD_DISPLAY_CONTROL | display_control);
}

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
void lcd_no_display(void)
{
	display_control &= ~MSK_D;
	lcd_config(CMD_DISPLAY_CONTROL | display_control);
}

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
void lcd_cursor(void)
{
	display_control |= MSK_C;
	lcd_config(CMD_DISPLAY_CONTROL | display_control);
}

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
void lcd_no_cursor(void)
{
	display_control &= ~MSK_C;
	lcd_config(CMD_DISPLAY_CONTROL | display_control);
}

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
void lcd_cursor_blink(void)
{
	display_control |= MSK_B;
	lcd_config(CMD_DISPLAY_CONTROL | display_control);
}

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
void lcd_no_blink(void)
{
	display_control &= ~MSK_B;
	lcd_config(CMD_DISPLAY_CONTROL | display_control);
}

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
void lcd_shift_left(void)
{
	lcd_config(CMD_SHIFT_CONTROL | MSK_SD & ~MSK_SR);
}

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
void lcd_shift_right(void)
{
	lcd_config(CMD_SHIFT_CONTROL | MSK_SD | MSK_SR);
}

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
void lcd_left_to_right(void)
{
	display_entry |=  MSK_ID;
	lcd_config( CMD_ENTRY_MODE_SET | display_entry);
}

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
void lcd_right_to_left(void)
{
	display_entry &=  ~MSK_ID;
	lcd_config( CMD_ENTRY_MODE_SET | display_entry);
}

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
void lcd_autoscroll(void)
{
	display_entry |=  MSK_S;
	lcd_config( CMD_ENTRY_MODE_SET | display_entry);
}

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
void lcd_no_autoscroll(void)
{
	display_entry &=  ~MSK_S;
	lcd_config( CMD_ENTRY_MODE_SET | display_entry);
}
