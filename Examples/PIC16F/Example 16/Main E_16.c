/*******************************************************************************
* This is the main program for Example 16 using PTK40A PIC Training Board.
*
* Author: ANG JIA YI @ Cytron Technologies Sdn. Bhd.
* Remember to check the Jumper configuration file, also compile and load into PTK40A
*******************************************************************************/
// PTK40A with PIC16F877A 
// This template C file should be compiled with:
// MPLAB IDE v8.63
// HI-TECH C for the PIC10/12/16 MCU Family
// HI-TECH operate in LITE Mode with v9.80
// Last Updated date: 1 June 2012
// Please email support@cytron.com.my if you have any problem

#include <htc.h>		//include hitech C header file
#include "system.h"		//include system header file for PTK40A
#include "adc.h"		//include adc header file, to configure analog pin to digital pin
#include "pwm.h"		//include pwm header file, to enable the functions of PWM
#include "uart.h"		//include uart header file, to enable the functions of uart
#include "lcd.h"		//include lcd header file, to enable the functions of lcd
/*******************************************************************************
* DEVICE CONFIGURATION WORDS                                                   *
*******************************************************************************/
// This configuration bits are for PIC16F877A using 20MHz Crystal or HS for OSC
#if defined (HITECH_V9_80)	//if Hi-Tech V9.80 compiler is being used
__CONFIG(HS &			// High Speed Crystal.
		 WDTDIS &		// Disable Watchdog Timer.
		 PWRTEN &		// Enable Power Up Timer.
		 BORDIS &		// Disable Brown Out Reset.
		 LVPDIS);		// Disable Low Voltage Programming.

#elif defined (HITECH_V9_82)		//else if Hi-Tech V9.82 compiler is being used
// If Hi-TECH C Compiler v9.82 is use, this configuration bit should be used
__CONFIG(FOSC_HS &			// High Speed Crystal.
		 WDTE_OFF &		// Disable Watchdog Timer.
		 PWRTE_ON &		// Enable Power Up Timer.
		 BOREN_OFF &		// Disable Brown Out Reset.
		 LVP_OFF);		// Disable Low Voltage Programming.
#endif	//end of pre-processor if condition
/*******************************************************************************
* Defination of label		                                                  *
*******************************************************************************/

/*******************************************************************************
* PRIVATE FUNCTION PROTOTYPES                                                  *
*******************************************************************************/
void delay_ms(unsigned int ui_value);
void beep(unsigned char uc_count);
void uart_tx_temp(unsigned char);
/*******************************************************************************
* Global Variables                                                             *
*******************************************************************************/
long int i,k,j;

/*******************************************************************************
* MAIN FUNCTION                                                                *
*******************************************************************************/
int main(void)
{
	unsigned int temperature = 0;	// declare a variable to store temperature
	unsigned char number = 0;
	unsigned int speed = 0;
	// ensure all the hardware port in zero initially
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
	PORTD = 0;
	PORTE = 0;

	// Initialize the I/O port direction, this must be configured according to circuit
	// please refer to PTK40A schematic for details
	// TRISX control pin direction, output pin must be configure as '0'
	// while input must be configure as '1'
	TRISA = 0b00010001;
	TRISB = 0b00001111;
	TRISC = 0b10010011;
	TRISD = 0;
	TRISE = 0;


	//Initialize UART
	uart_initialize(); //to ensure the Uart modlue is properly configured to be used

	// Initialize ADC.
	adc_initialize();	//Ensure pin share with analog is being configured to digital correctly
	
	// Initialize PWM
	pwm_initialize();	//Ensure PWM module is properly configured before it can be used
	
	// PTK40A have an port for the UART signal for Tx and Rx transmit and recieve
	// We use the keyboard to control the DC motor turning speed and
	// Interface with UC00A/B, send temperature reading to HyperTerminal, control DC motor using keyboard
	// we control the motor speed with useing keybaord numpad number to control the speed.
	// we are also able to control the speed using other key but the value are unknown since all the key contain all variaes number


	adc_on();	//activate ADC module in PIC
	M1 = 1;
	M2 = 0;		// drive motor in a direction
	temperature = 0;	
	while(1) 	// create an infinite loop
	{
		if(RCIF==1)			//waiting the keyboard to be press
		{
			number=uc_uart_receive();		//read the keyboard keypad value only
			if((number >= '0') && (number <= '9'))
			{
				speed = (number - 0x30)*111;  //Equation for the keypad value to run the pwm speed at range 0~1000
			}	
			else 
			{
				speed = 0;		//other key will stop the motor from turning
			}	
		pwm_set_duty_cycle(speed);	// update the value of PWM
		}

		else
		{
			temperature = 0;
			for( i = 0 ; i < 10 ; i++)	// accumulate ADC reading from LM35
			{
			temperature = temperature + ui_adc_read();	// read 10-bit ADC value from AN0, which is LM35
			}
			temperature = temperature / 10;	// Get the average value
			temperature = temperature /2 ;		// resolution of 10-bit ADC aroudn 5mV, LM35 is 10mV/degree Celcius,
											// therefore, ADC result need to be divided by 2 to get the temperature
			uart_tx_temp(temperature); 	//this is a initialize function call to display the UART function is at lowest part
		}
		
	}		
	while(1) continue;	// infinite loop to prevent PIC from reset if there is no more program	
}

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
	while (ui_value-- > 0) {
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
	while (uc_count-- > 0) {
		pwm_set_duty_cycle(1023);	//buzzer is share at RC2 pin, PWM
		delay_ms(80);
		pwm_set_duty_cycle(0);
		delay_ms(100);
	}
}


void uart_tx_temp(unsigned char temp)
{
	uart_putstr("Temperature:");
	if((temp >= 0) && (temp <=150))
	{
		uart_transmit((temp/100) + '0');
		delay_ms(1);
		uart_transmit(((temp%100)/10) + '0');
		delay_ms(1);
		uart_transmit(((temp%100)%10) + '0');
		delay_ms(1);
		uart_transmit(248);	//transmit ASCII code for degree symbol
		delay_ms(1);
		uart_transmit('C');
		delay_ms(1);
		uart_transmit('\n');
		uart_transmit('\r');
	}
	else
	{
		uart_putstr("Out of Range\n\r");
	}	
}