/*******************************************************************************
* This is the main program to sanity test the PTK40A PIC Training Board.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/
// This template is being written based on Cytron PTK40A board
// PTK40A with PIC16F877A 
// This template C file should be compiled with:
// MPLAB IDE v8.85
// HI-TECH C for the PIC10/12/16 MCU Family
// HI-TECH operate in LITE Mode with v9.83
// Last Updated date: 1 June 2013
// Please email support@cytron.com.my if you have any problem

#include <htc.h>		//include hitech C header file
#include "system.h"	//include system header file for PTK40A
#include "uart.h"		//include uart functions header file
#include "spi.h"		//include spi functions header file
#include "i2c.h"		//include i2c functions header file
#include "adc.h"		//include adc functions header file
#include "seg7.h"		//include 7 segment functions header file
#include "timer1.h"	//include timer 1 functions header file
#include "timer0.h"	//include timer 0 functions header file
#include "pwm.h"		//include pwm functions header file
#include "keypad.h"	//include keypad functions header file
#include "lcd.h"		//include lcd functions header file
#include "skps.h"		//include skps functions header file
#include "spi_eeprom.h"	//include spi eeprom functions header file
#include "i2c_rtc.h"		//include i2c rtc (DS1307) functions header file


/*******************************************************************************
* DEVICE CONFIGURATION WORDS                                                   *
*******************************************************************************/
#if((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ <= 80)) //if Hi-Tech V9.80 or lower version of compiler is being used
__CONFIG(HS &			// High Speed Crystal.
		 WDTDIS &		// Disable Watchdog Timer.
		 PWRTEN &		// Enable Power Up Timer.
		 BORDIS &		// Disable Brown Out Reset.
		 LVPDIS);		// Disable Low Voltage Programming.

#elif((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ > 80)) //else if Hi-Tech greater than V9.80 compiler is being used
__CONFIG(FOSC_HS &			// High Speed Crystal.
		 WDTE_OFF &		// Disable Watchdog Timer.
		 PWRTE_ON &		// Enable Power Up Timer.
		 BOREN_OFF &		// Disable Brown Out Reset.
		 LVP_OFF);		// Disable Low Voltage Programming.
#endif	//end of pre-processor if condition
/*******************************************************************************
* Defination of label		                                                  *
*******************************************************************************/
#define D_time	300  // constant for LED delay
#define Stepper_CW	1	//direction for stepper motor to rotate CW direction
#define Stepper_CCW	0	//direction for stepper motor to rotate CCW direction

/*******************************************************************************
* PRIVATE FUNCTION PROTOTYPES                                                  *
*******************************************************************************/
void delay_ms(unsigned int ui_value);	
void beep(unsigned char uc_count);
void test_led(void);
void test_switch(void);
void test_external_input(void);
void test_keypad(void);
void test_7segment(void);
void test_relay(void);
void test_dc_motor(void);
void test_stepper(void);
void test_servo(void);
void test_adc(void);
void test_timer1_rtc(void);
void test_spi_eeprom(void);
void test_i2c_rtc(void);
void test_uart(void);
void test_skps(void);
void drive_stepper(unsigned char direction);
void lcd_clear_msg(const char* csz_string);
void lcd_error_trap(const char* csz_string);
void lcd_1stline_msg(const char* csz_string);
void lcd_2ndline_msg(const char* csz_string);
void wait_sw1(void);

/*******************************************************************************
* Global Variables                                                             *
*******************************************************************************/
const char string_cytron[] = "  Cytron Tech\n cytron.com.my";
const char string_testcode[] = "PTK40A Test Code\n   V1.2 Jun13";
const char string_SWsError[] = "Other SWs is Low";
const char string_press_SW1[] = "Press SW1 when\nready";
const char string_buzzer[] = "JP10 to BUZZER";

/*******************************************************************************
* MAIN FUNCTION                                                                *
*******************************************************************************/
int main(void)
{
	unsigned char test_no = 1;	//To store current test number
	
	// ensure all the hardware port in zero initially
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
	PORTD = 0;
	PORTE = 0;

	// Initialize the I/O port direction.
	TRISA = 0b00010001;
	TRISB = 0b00001111;
	TRISC = 0b10010011;
	TRISD = 0;
	TRISE = 0;

	// Initialize ADC.
	adc_initialize();
	
	// Initialize 7 segment.
	seg7_initialize();
	
	// before other tests, LEDs are tested as it will affect other decives such as LCD and 7 segments
	// LEDs will turn ON and turn OFF in sequence	
	test_led();
	
	// Initialize PWM.
	pwm_initialize();

	// Initialize the LCD.
	lcd_initialize();
	LCD_BACKLIGHT = 1; 	// activate LCD back light, message is easier to be readen 

	// Display message
	lcd_clear_msg(string_cytron);	//display Cytron Tech and URL
	delay_ms(2000);	//wait for ~2s
		
	// Display the message and beep twice.
	lcd_clear_msg(string_testcode);	//display PTK40A test code and version
	delay_ms(2000);	//wait for ~2s
	beep(2);	
	
	// Need to make sure the push button is useable before other tests, push buttons will be tested before other 
	test_switch();	
		
	while (1) 
		{
		lcd_2ndline_msg("1--  2++  3=Test");	//display the message for test menu navigation
	
		switch (test_no) //start the switch case to check which test mode to execute
		{
		case 1:	// mode 1, carry out all test.
			lcd_1stline_msg("1: Test All");		//clear 1st line of LCD and display message, mode 1 is to run all test sequentially			
			if (SW3 == 0) 			// if SW3 is press, to select the mode and run
			{	
				while (SW3 == 0);	// waiting for SW3 to be let go
				test_external_input();				
				test_keypad();
				test_7segment();
				test_relay();
				test_dc_motor();
				test_servo();
				test_stepper();
				test_adc();	
				test_timer1_rtc();				
				test_spi_eeprom();					
				test_i2c_rtc();
				test_uart();
				test_skps();
			}	
			break;
			
		case 2:	// mode 2, to test the external digital input. Simple way is to short the Signal (S) pin and Gnd (-) pin
				// of the External Digital Input Port								
			lcd_1stline_msg("2: Ext D Input");	
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_external_input();
			}	
			break;
			
		case 3:	// mode 3, to test 4x4 Keypad, user must press the key accordingly, follow the message of LCD			
			lcd_1stline_msg("3: Keypad");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_keypad();
			}	
			break;
			
		case 4:	// mode 4, to test 7 segment, two 7 segment will need to display number accordingly to LCD			
			lcd_1stline_msg("4: 7seg");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_7segment();
			}	
			break;			
			
		case 5:	// mode 5, to test relay, default state is OFF or GND. It will activate relay and off it. 
				// The indicator LED should change as there is relay activation sound too.			
			lcd_1stline_msg("5: Relay");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_relay();
			}	
			break;
			
		case 6:	// mode 6, to test DC motor.
				// This will actually test DC motor with speed, direction and encoder feedback. 				
			lcd_1stline_msg("6: DC Motor");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_dc_motor();
			}	
			break;
			
		case 7:	// mode 7, to test stepper motor
				// forward, back, unipolar and bipolar				
			lcd_1stline_msg("7: Stepper Motor");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_stepper();
			}	
			break;
			
		case 8:	// mode 8, to test RC servo motor
				// the RC servo should move to 3 positions, left, center and right				
			lcd_1stline_msg("8: Servo Motor");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_servo();
			}	
			break;
			
		case 9:	// mode 9, test ADC input, user have 3 input to choose from, on board rotary knob, LM35 temperature sensor
				// external analog sensor.		
			lcd_1stline_msg("9: ADC");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_adc();
			}	
			break;
			
		case 10:	// mode 10, test Timer 1 RTC with external crystal of 32.768KHz
				// it will wait for around 2 seconds and check			
			lcd_1stline_msg("10: Timer 1 RTC");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_timer1_rtc();
			}	
			break;
						
		case 11:	// mode 11, test SPI communication to on board EEPROM
				// the PIC will write a data to the EEPROM and read it back, further compare it.				
			lcd_1stline_msg("11: SPI EEPROM");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_spi_eeprom();
			}	
			break;				
		
		case 12:	// mode 12, test I2C communication with a real time clock IC, DS1307
				// it will start initializing the DS1307 to start counting and display second
				// on LCD			
			lcd_1stline_msg("12: I2C RTC");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_i2c_rtc();
			}	
			break;
		
		case 13:	// mode 13, test UART communication with UC00A/B (USB to UART Converter)
				// User will need to open a Terminal Program (HyperTerminal) and configure it to
				// 9600, 8-N-1, No flow control				
			lcd_1stline_msg("13: UART");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_uart();
			}	
			break;
		
		case 14:	// mode 14, to test SKPS
				// user will require SKPS with either wired or wireless PS2 connected.				
			lcd_1stline_msg("14: SKPS");
			if (SW3 == 0) 
			{
				while (SW3 == 0);
				test_skps();
			}	
			break;
		}	
			
		
		// If SW1 is pressed... SW1 is to decrease the test modes
		if (SW1 == 0) 
		{
			if (--test_no < 1) 	// if SW1 is press decrease the test number until it is 1 and loop back
			{
				test_no = 14;
			}				
			while (SW1 == 0);
			beep(1);
		}			
		
		
		// If SW2 is pressed... SW2 is to increase the test modes
		if (SW2 == 0) 
		{
			if (++test_no > 14) // if SW2 is press increase the test number until it is max and loop back
			{
				test_no = 1;
			}				
			while (SW2 == 0);
			beep(1);
		}	
		
	} // while (1)
	
}// main



/*******************************************************************************
* PRIVATE FUNCTION: delay_ms
*
* PARAMETERS:
* ~ ui_value	- The period for the delay in miliseconds.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Delay in miliseconds.
*
*******************************************************************************/
void delay_ms(unsigned int ui_value)
{
	while (ui_value-- > 0) 
	{
		__delay_ms(1);		// macro from HI-TECH compiler which will generate 1ms delay base on value of _XTAL_FREQ in system.h
	}	
}

/*******************************************************************************
* PRIVATE FUNCTION: beep
*
* PARAMETERS:
* ~ uc_count	- How many times we want to beep.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Beep for the specified number of times.
*
*******************************************************************************/
void beep(unsigned char uc_count)
{
	while (uc_count-- > 0) 
	{
		pwm_set_duty_cycle(1023);	//buzzer is share at RC2 pin, which is PWM pin
		delay_ms(50);
		pwm_set_duty_cycle(0);
		delay_ms(50);
	}
}

/*******************************************************************************
* PRIVATE FUNCTION: test_led
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the LEDs.
*
*******************************************************************************/
void test_led(void)
{	
	unsigned char i = 0;
	
	// Testing LEDs.
	RC2 = 1;
	delay_ms(D_time);
	RC2 = 0;

	RE0 = 0;
	delay_ms(D_time);
	RE0 = 1;
	seg7_com_dis(100);	//blank display
	
	RE1 = 0;
	delay_ms(D_time);
	RE1 = 1;
	seg7_com_dis(100);	//blank display
	
	RE2 = 1;
	delay_ms(D_time);
	RE2 = 0;

	RA1 = 1;
	delay_ms(D_time);
	RA1 = 0;

	RA2 = 1;
	delay_ms(D_time);
	RA2 = 0;
	
	RA3 = 1;
	delay_ms(D_time);
	RA3 = 0;

	RA5 = 1;
	delay_ms(D_time);
	RA5 = 0;
	
	for(i = 4; i < 9; i++)	//activate LED at RB4 to RB7 in sequence 
	{
	PORTB = 0b00000001 << i;
	delay_ms(D_time);	
	}
	
	for(i = 0; i < 9; i++) //activate LED at RD0 to RD7 in sequence 
	{
	PORTD = 0b00000001 << i;
	delay_ms(D_time);
	}
		
	BUZZER = 1;		// before PWM is initialized
	delay_ms(50);
	BUZZER = 0;
}	

/*******************************************************************************
* PRIVATE FUNCTION: test_switch
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the push buttons.
*
*******************************************************************************/
void test_switch(void)
{	
	// Display message
	lcd_clear_msg("Test Switches\nPress SW");
	//delay_ms(1000);	
		
	// Display message to press SW number
	lcd_putchar('1');
	
	// Waiting for user to press SW1
	while (SW1 == 1);		
	// If SW1 is pressed but other switches also become low, trap the error.
	if (SW2 == 0 || SW3 == 0) {			
	lcd_error_trap(string_SWsError);
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);	
	beep(1);
	
	// Display message	
	lcd_goto(0x48);
	lcd_putchar('2');
	
	// Waiting for user to press SW2.
	while (SW2 == 1);
	
	// If SW2 is pressed but other switches also become low, trap the error.
	if (SW1 == 0 || SW3 == 0) 
	{
	lcd_error_trap(string_SWsError);
	}	
	
	// Waiting for user to release SW2.
	while (SW2 == 0);	
	beep(1);	
	
	// Display message	
	lcd_goto(0x48);
	lcd_putchar('3');
	
	// Waiting for user to press SW3.
	while (SW3 == 1);
	
	// If SW3 is pressed but other switches also become low, trap the error.
	if (SW1 == 0 || SW2 == 0) 
	{
	lcd_error_trap(string_SWsError);
	}	
	
	// Waiting for user to release SW3.
	while (SW3 == 0);
	
	// Beep twice to indicate test pass	
	beep(2);		
	delay_ms(500);
}	


/*******************************************************************************
* PRIVATE FUNCTION: test_external_input
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the external digital input, user can either connect a external digital sensor such as
* photoelectric, fiber optic, IR01A, limit switch. Or easiest way is to short Signal (S) pin and GND (-) pin
*
*******************************************************************************/
void test_external_input(void)
{
	// Display message
	lcd_clear_msg("Test Ext D.Input");
	delay_ms(1000);	
	
	// Display message
	lcd_clear_msg("Activate\nExt DI");	//External Digital Input, it can be limit switch, fiber optic sensor, photoelectric sensor, etc
	
	// Waiting for user to press External Switch
	while (DIGITAL_IN == 1);
	
	// Waiting for user to release External Switch
	while (DIGITAL_IN == 0);	
	
	// Beep twice to indicate test pass	
	beep(2);
	//delay_ms(500);
}	

/*******************************************************************************
* PRIVATE FUNCTION: test_keypad
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the keypad.
*
*******************************************************************************/
void test_keypad(void)
{
	unsigned char i = 0;
	char c_pressed_key;	
	static char sz_keys_array[] = "123A456B789C*0#D";

	// Display message
	lcd_clear_msg("Test Keypad\nPlease press:");
	
	// Loop to test every key in the keypad
	while (sz_keys_array[i] != '\0') 
	{		
		// Display message
		lcd_goto(0x4E);
		lcd_putchar(sz_keys_array[i]);	
		
		// Waiting for user to press the keypad according to LCD message
		c_pressed_key = c_key_to_ASCII(c_wait_keypad());
		beep(1);
		delay_ms(50);
		
		// If incorrect key is pressed, trap the error.
		if (c_pressed_key != sz_keys_array[i]) 
		{
			// Display the error messages and trap the error.
			lcd_error_trap("Error:\nIncorrect Key");
			return;	//terminate the test and return to main menu			
		}			
		// Increase the counter.
		i++;
	}//while (sz_keys_array[i] != '\0') 		
	
	// Beep twice to indicate test pass	
	beep(2);
	//delay_ms(500);
}	

/*******************************************************************************
* PRIVATE FUNCTION: test_7segment
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the 7 segment display.
*
*******************************************************************************/
void test_7segment(void)
{
	unsigned char i = 0;
	// Display message
	lcd_clear_msg("Test 7seg");
	delay_ms(1000);	
	
	// Display message
	lcd_2ndline_msg("7seg: Blank");	
	seg7_com_dis(100); 	// clear the 7 segment, value more than 99, it will both blank
	delay_ms(1000);		
	lcd_2ndline_msg("7seg: ");	
	for (i = 0; i < 10; i++)
	{
		seg7_com_dis(9+(9*i));	//it will display 09, 18, 27, 36, 45, 54, 63, 72, 81, 90 which cover 0 to 9 for each 7 segment
		lcd_goto(0x46);
		lcd_bcd(2, 9+(9*i));	// display on LCD
		delay_ms(800);	//wait for ~0.8 second
	}
	delay_ms(500);
	seg7_com_dis(100);	//clear 7 segment

	// Beep twice to indicate test pass	
	beep(2);
}	


/*******************************************************************************
* PRIVATE FUNCTION: test_relay
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the relay.
*
*******************************************************************************/
void test_relay(void)
{
	unsigned int i;
		
	// Display message
	lcd_clear_msg("Test Relay");
	delay_ms(1000);
	
	// Waiting for user to press SW1.
	while (SW1 == 1) 
	{
		lcd_clear_msg("JP7=Relay");		
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);		
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);

	// Turn on relay.
	lcd_clear_msg("Relay ON");
	RELAY = 1;
	delay_ms(1000);
	
	lcd_clear_msg("Relay OFF");
	RELAY = 0;
	delay_ms(1000);
	// Beep twice to indicate test pass	
	beep(2);	
}	



/*******************************************************************************
* PRIVATE FUNCTION: test_dc_motor
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the DC Brushed Motor.
*
*******************************************************************************/
void test_dc_motor(void)
{
	unsigned int ui_speed;
		
	// Display the messages.
	lcd_clear_msg("Test DC Motor");
	delay_ms(1000);
	
	// Waiting for user to press SW1.
	while (SW1 == 1) 
	{
		lcd_clear_msg("JP20&21=DC MOTOR\nJP10=PWM");		
		wait_sw1();				
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);		
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);	
	
	// Initialize Timer 0, for encoder counting
	timer0_initialize();
	
	// Accelerate clockwise.
	lcd_clear();
	lcd_goto(0x07);
	
	lcd_putstr("CW\nEC:");	
	set_encoder(0);
	
	lcd_goto(0x48);
	lcd_putstr("PWM:");
	M1 = 1;		//direction of clockwise, view from shaft
	M2 = 0;
	
	//accerelate in clockwise direction
	for (ui_speed = 350; ui_speed < 1023; ui_speed++ ) 
	{
		pwm_set_duty_cycle(ui_speed);	//update the speed
		delay_ms(10);					//create small delay
		lcd_goto(0x43);				
		lcd_bcd(4, ui_encoder());		//update encoder value to LCD
		lcd_goto(0x4C);				
		lcd_bcd(4, ui_speed);			//update PWM value to LCD
	}
	
	// counter clockwise direction
	lcd_goto(0x07);
	lcd_putstr("CCW");	
	M1 = 0;		
	M2 = 1;

	// Deaccelerate in counter clockwise direction
	for (; ui_speed > 200; ui_speed--) 
	{
		pwm_set_duty_cycle(ui_speed); //update the speed
		delay_ms(10);					//create small delay
		lcd_goto(0x43);
		lcd_bcd(4, ui_encoder());		//update encoder value to LCD
		lcd_goto(0x4C);	
		lcd_bcd(4, ui_speed);			//update PWM value to LCD
	}	
	delay_ms(1000);	

	// Stop motor.
	pwm_set_duty_cycle(0);	//update speed with 0
	M1 = 0;					//stop motor
	M2 = 0;
	delay_ms(1000);
	
	// Waiting for user to press SW1.
	while (SW1 == 1) 
	{
		lcd_clear_msg(string_buzzer);		
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);		
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);
	TMR0IE = 0;		// Disable Timer 0 overflow interrupt.
	beep(2);	
}	


/*******************************************************************************
* PRIVATE FUNCTION: test_stepper
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the stepper motor.
*
*******************************************************************************/
void test_stepper(void)
{
	unsigned char stepper_drive;
	unsigned int ui_count;
	
	// Display the messages.
	lcd_clear_msg("Test Stepper");
	delay_ms(1000);
	
	// Loop to test Unipolar and Bipolar
	for(stepper_drive = 2; stepper_drive > 0; stepper_drive --)	
	{
		if(stepper_drive == 2) //unipolar mode
		{		
			// Waiting for user to press SW1.
			while (SW1 == 1) 
			{
				lcd_clear_msg("JP20&21=STEPPER\nJP23&24=UNIPOLAR");		
				wait_sw1();
				if(SW1 == 0) break;
				
				lcd_clear_msg("JP10=PWM");		
				wait_sw1();
				if(SW1 == 0) break;
				
				lcd_clear_msg(string_press_SW1);		
				wait_sw1();
			}	
			
			// Waiting for user to release SW1.
			while (SW1 == 0);
		}//if(stepper_drive == 2)
		
		else if (stepper_drive == 1)
		{
			// Waiting for user to press SW1.
			while (SW1 == 1) 
			{
				lcd_clear_msg("JP23&24=BIPOLAR");
				wait_sw1();
				if(SW1 == 0) break;
				
				lcd_clear_msg(string_press_SW1);
				wait_sw1();
			}				
			// Waiting for user to release SW1.
			while (SW1 == 0);
		}// else if (stepper_drive == 1)
				
		// Setting PWM to full speed.
		pwm_set_duty_cycle(1023);
		
		// Rotate CW.
		lcd_clear_msg("CCW");
		drive_stepper(Stepper_CCW);	// drive stepper in CCW direction, 192 steps	
		delay_ms(500);	
		
		// Rotate CCW.
		lcd_clear_msg("CW");
		drive_stepper(Stepper_CW);	// drive stepper in CW direction, 192 steps	
		
		// Setting PWM to 0 and free the stepper.
		pwm_set_duty_cycle(0);
		PORTB = PORTB & 0x0F;	// free stepper motor	
	}//for loop
	
	// Waiting for user to press SW1.
	while (SW1 == 1) 
	{
		lcd_clear_msg(string_buzzer);		
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);		
		wait_sw1();
	}		
	// Waiting for user to release SW1.
	while (SW1 == 0);
	
	// Beep twice to indicate test pass	
	beep(2);	
}



/*******************************************************************************
* PRIVATE FUNCTION: test_servo
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the servo motor.
*
*******************************************************************************/
void test_servo(void)
{
	unsigned int ui_count;
	
	// Display the messages.
	lcd_clear_msg("Test Servo");
	delay_ms(1000);
	
	// Waiting for user to press SW1.
	while (SW1 == 1) 
	{
		lcd_clear_msg("JP9=SERVO");		
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);		
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);
	
	// Move servo to center.
	lcd_clear_msg("Center");
	ui_count = 100;
	while (ui_count-- > 0) 
	{
		SERVO = 1;
		__delay_us(1500);
		SERVO = 0;
		__delay_us(18500);
	}	
	
	// Move servo to left.
	lcd_clear_msg("Left");
	ui_count = 100;
	while (ui_count-- > 0)	 
	{
		SERVO = 1;
		__delay_us(2200);
		SERVO = 0;
		__delay_us(17800);
	}	
	
	// Move servo to right.
	lcd_clear_msg("Right");
	ui_count = 100;
	while (ui_count-- > 0) 
	{
		SERVO = 1;
		__delay_us(800);
		SERVO = 0;
		__delay_us(19200);
	}		
	// Beep twice to indicate test pass	
	beep(2);	
}	



/*******************************************************************************
* PRIVATE FUNCTION: test_adc
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the ADC.
*
*******************************************************************************/
void test_adc(void)
{
	unsigned int ui_adc = 0;
	unsigned char i = 0;
	
	// Display the messages.
	lcd_clear_msg("Test ADC");
	delay_ms(1000);	
	adc_on();		//activate ADC module
	lcd_clear_msg("AN0:     T:\nSW2->Exit");	
	
	// Loop until SW2 is pressed.
	// Read from the ADC and display the value.
	while (SW2 == 1)
	 {	
		ui_adc = 0;	
		for(i = 0; i < 10; i++)
		{
		ui_adc = ui_adc + ui_adc_read();		// read adc value from AN0 and accumulate with previous result
		}
		ui_adc = ui_adc/10;	//averange the result		
		lcd_goto(0x04);	
		lcd_bcd(4, ui_adc);		//display ADC value in decimal 			
		lcd_goto(0x0B);		
		lcd_bcd(3, ui_adc/2);		//convert the ADC value to temperature
	}	
	// Waiting for user to release SW2.
	while (SW2 == 0);
	adc_off();	//deactivate the ADC module
	
	// Beep twice to indicate test pass	
	beep(2);
	
}	



/*******************************************************************************
* PRIVATE FUNCTION: test_timer1_rtc
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the Timer 1 RTC.
*
*******************************************************************************/
void test_timer1_rtc(void)
{
	unsigned char pre_second = 2, second = 0;
	// Display the messages.
	lcd_clear_msg("Test Timer 1 RTC\nSW2->Exit");

	// Initialize Timer 1.
	timer1_initialize();
	
	// Reset the seconds.
	timer1_set_seconds(0);
	
	// If the time is not correct, display error message and halt.
	while(SW2 == 1)
	{
		second = uc_timer1_get_seconds();	//obtain second from timer
		if(pre_second != second)
		{
			pre_second = second;	//update previous second with current second
			seg7_com_dis(second);	
			beep(1);
		}	
	}		
	while(SW2 == 0); 	//wait for SW2 to be released
	seg7_com_dis(100);	//make 7segment blank
	// Disable Timer 1 overflow interrupt.
	TMR1IE = 0;
	// Disable Timer 1
	TMR1ON = 0;				
	// Beep twice to indicate test pass	
	beep(2);	
}	



/*******************************************************************************
* PRIVATE FUNCTION: test_spi_eeprom
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the 25AA020A SPI EEPROM.
*
*******************************************************************************/
void test_spi_eeprom(void)
{
	unsigned int i;	

	// Display the messages.
	lcd_clear_msg("Test SPI\nEEPROM");
	delay_ms(1000);
	
	// Waiting for user to press SW1.
	while (SW1 == 1) {
		lcd_clear_msg("JP3,5,6,7 = SPI");		
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);	
	
	// Initialize SPI.
	spi_initialize();
	delay_ms(50);		//delay a while before proceed
	
	lcd_clear_msg("Writing EEPROM");
	
	// Write to the SPI EEPROM.
	for (i = 0; i < 256; i++) {
		spi_eeprom_write_single_byte(i, 255-i);
	}	
	beep(1);
	
	lcd_clear_msg("Reading EEPROM");
	delay_ms(500);
	// Read from the SPI EEPROM.
	for (i = 0; i < 256; i++) {
		
		// Check the data. If the data is incorrect, display error message and halt.
		if (uc_spi_eeprom_read_single_byte(i) != (255-i)) {			
			lcd_error_trap("SPI EEPROM Error");
			return; 	//back to main menu if error
		}	
	}		
	
	// Beep twice to indicate test pass	
	beep(2);
	delay_ms(500);
}	

/*******************************************************************************
* PRIVATE FUNCTION: test_i2c_rtc
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the DS1307 I2C RTC.
*
*******************************************************************************/
void test_i2c_rtc(void)
{
	unsigned char pre_second = 2, second = 0;
	// Display the messages.
	lcd_clear_msg("Test I2C RTC");
	delay_ms(1000);	
	
	// Waiting for user to press SW1.
	while (SW1 == 1) {
		lcd_clear_msg("JP3 & 5 = I2C");
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);	
	
	// Initialize I2C.
	i2c_initialize();
	
	lcd_clear_msg("I2C DS1307\nSW2->Exit SEC:");	
	
	// Initialize I2C RTC.
	i2c_rtc_initialize();
	
	// Reset the seconds.
	i2c_rtc_set_seconds(0);
	
	// Delay for 2 seconds.
	//delay_ms(2000);
	
	//Keep update second on LCD while SW2 is not press
	while(SW2 == 1)
	{
		second = uc_i2c_rtc_get_seconds();		//obtain second from DS1307
		if(pre_second != second)
		{
			pre_second = second;	//update pre_second with current second
			lcd_goto(0x4E);
			lcd_bcd(2, second);
			beep(1);
		}
	}
	while(SW2 == 0);	//wait for SW2 to be released	
	
	// Beep twice to indicate test pass	
	beep(2);
	//delay_ms(500);
}	



/*******************************************************************************
* PRIVATE FUNCTION: test_uart
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the UART.
*
*******************************************************************************/
void test_uart(void)
{		
	char c_received_data;	
	
	// Display the messages.
	lcd_clear_msg("Test UART");
	delay_ms(1000);	
	
	// Waiting for user to press SW1.
	while (SW1 == 1) 
	{
		lcd_clear_msg("Connect UC00A");		
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);		
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);	
	
	uart_initialize();	//initialize UART
	// Display the messages on PTK40A LCD
	lcd_clear_msg("ENTER on\nkeyboard to exit");	
	
	// Sending message to the PC.
	uart_putstr("\r\n\nPTK40A Test UART\r\n");
	uart_putstr("Press any key to echo\r\n");
	uart_putstr("ENTER to exit\r\n\n");
	
	do {
		c_received_data = uc_uart_receive();
		uart_transmit(c_received_data);
	}
	while (c_received_data != '\r' && c_received_data != '\n');	
	
	// Sending message to the PC.
	uart_putstr("\r\n\nTest Done\r\n");
	
	// Beep twice to indicate test pass	
	beep(2);
	//delay_ms(500);
}	
/*******************************************************************************
* PRIVATE FUNCTION: test_skps
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Test the SKPS.
*
*******************************************************************************/
void test_skps(void)
{
	unsigned char uc_skps_ru = 0 , uc_skps_lu = 0;
	unsigned char i = 0;
	// Display the messages.
	lcd_clear_msg("Test SKPS");
	delay_ms(1000);
	
	// Waiting for user to press SW1.
	while (SW1 == 1) 
	{
		lcd_clear_msg("JP9=SK-RST");
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg("Connect SKPS+PS2");
		wait_sw1();
		if(SW1 == 0) break;
		
		lcd_clear_msg(string_press_SW1);
		wait_sw1();
	}	
	
	// Waiting for user to release SW1.
	while (SW1 == 0);	

	// Display the messages.
	skps_reset();	//reset the SKPS	
	uart_initialize();	//initialize UART
	lcd_clear_msg("SW2->Exit");
	delay_ms(100);
		
	// While SW2 is not press, keep reading input from SKPS and display result on LCD
	while (SW2 == 1) 
	{	
		if(!(uc_skps(p_l1) && uc_skps(p_r1)))
		{			
			lcd_2ndline_msg("Buz On");
			pwm_set_duty_cycle(1023);
		}	
		else 
		{			
			lcd_2ndline_msg(" ");
			pwm_set_duty_cycle(0);
		}

		uc_skps_ru = uc_skps(p_joy_ru);		// read the value of right joystik, up axis
		uc_skps_lu = uc_skps(p_joy_lu);		// read the value of left joystick, up axis
		
		if (uc_skps_ru >5)
		{
		skps_vibrate (p_motor1, 1);		// send command to vibrate right motor
		}
		else skps_vibrate(p_motor1, 0);	// stop motor
		
		if (uc_skps_lu >10)
		{
		skps_vibrate (p_motor2, uc_skps_lu*2);	// send command to vibrate left motor	
		}
		else skps_vibrate(p_motor2, 0);	// stop motor
	}//while (SW2 == 1) 	
	
	//wait SW1 to be released
	while (SW2 == 0);	

	// Beep twice to indicate test pass	
	beep(2);
	//delay_ms(500);
}

/*******************************************************************************
* PRIVATE FUNCTION: drive_stepper
*
* PARAMETERS:
* ~ unsigned char direction, 0 = CW, 1 = CCW
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Drive the stepper motor, 192 stepper according to direction variable.
*
*******************************************************************************/
void drive_stepper(unsigned char direction)
{
	static unsigned char step = 1;
	unsigned int ui_count = 192;	
	while(ui_count -- > 0)
	{
		if(direction == 0)
		{
			if(step < 4)	step ++;
			else step = 1;				
		}
		else 
		{
			if(step > 1)	step --;
			else step = 4;	
		}
		switch(step)
		{
			case 1:	
			PORTB = (PORTB & 0x0F) | 0b10000000;	// step 1		
			break;
			
			case 2:
			PORTB = (PORTB & 0x0F) | 0b00100000;	// step 2		
			break;
			
			case 3:		
			PORTB = (PORTB & 0x0F) | 0b01000000;	// step 3	
			break;
			
			case 4:		
			PORTB = (PORTB & 0x0F) | 0b00010000;	// step 4	
		}
		delay_ms(30);
	}
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
	// Display the error messages and trap the error.
	lcd_clear_msg(csz_string);
	beep(10);		// sound buzzer 10 times to indicate error
	delay_ms(3000);	//delay 5 seconds
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
	//lcd_putstr(csz_string);
	
	while (*csz_string != '\0') 
	{		
		i++;	
		lcd_putchar(*csz_string++);	
		//csz_string++;
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
	//lcd_putstr(csz_string);
	
	while (*csz_string != '\0') 
	{		
		i++;	
		lcd_putchar(*csz_string++);		
	}	
	for(; i<16;i++) lcd_putchar(' '); //append the rest of space with "space"		

}
/*******************************************************************************
* PRIVATE FUNCTION: wait_sw1
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* wait for switch 1 to be press while have delay
*
*******************************************************************************/
void wait_sw1(void)
{
	unsigned char i;
	for (i = 0; i < 200; i++) 
		{
			if (SW1 == 0)
			{
				return;
			}	
			delay_ms(10);
		}
}	

