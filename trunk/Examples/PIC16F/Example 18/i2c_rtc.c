/*******************************************************************************
* This file provides the functions for the DS1307 RTC on PTK40A
* Prior to using these functions, user need to initialize the I2C module.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#include <htc.h>
#include "system.h"
#include "i2c.h"
#include "i2c_rtc.h"



/*******************************************************************************
* PRIVATE CONSTANTS                                                            *
*******************************************************************************/

// I2C Slave Address for the DS1307 RTC.
#define RTC_ADDRESS		0b01101000



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_initialize
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Initialize the DS1307 RTC.
*
*******************************************************************************/
void i2c_rtc_initialize(void)
{
	unsigned int i;
	
	
	
	// The current value of the DS1307 RTC register.
	unsigned char uc_current_register_value;
	
	
	
	// Read back the current value of register "Seconds".
	uc_current_register_value = uc_i2c_read(RTC_ADDRESS, 0x00);
	
	// If the CH bit is set, clear it to enable the oscillator.
	if ((uc_current_register_value & 0x80) != 0) {
		uc_i2c_write(RTC_ADDRESS, 0x00, uc_current_register_value & 0x7f);
		
		
		
		// We need delay for the oscillator to start up.
		for (i = 0; i < 500; i++) {
			__delay_ms(1);
		}	
	}
	
	
	
	// Read back the current value of register "Hours".
	uc_current_register_value = uc_i2c_read(RTC_ADDRESS, 0x02);
	
	// If it's in 12-hour mode, change it to 24-hour mode.
	if ((uc_current_register_value & 0x40) != 0) {
		uc_i2c_write(RTC_ADDRESS, 0x02, uc_current_register_value & 0xbf);
	}	
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_rtc_get_seconds
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for seconds.
*
* DESCRIPTIONS:
* Get the value for seconds.
*
*******************************************************************************/
unsigned char uc_i2c_rtc_get_seconds(void)
{
	unsigned char uc_i2c_data;
	
	// Read the value of register "Seconds".
	uc_i2c_data = uc_i2c_read(RTC_ADDRESS, 0x00);
	
	// Convert the BCD to binary and return the value.
	return (uc_i2c_data & 0x0f) + (((uc_i2c_data >> 4) & 0x07) * 10);
}	



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_set_seconds
*
* PARAMETERS:
* ~ uc_value	- The value for seconds.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for seconds.
*
*******************************************************************************/
void i2c_rtc_set_seconds(unsigned char uc_value)
{
	// The current value of the DS1307 RTC register.
	unsigned char uc_current_register_value;
	
	
	
	// Make sure the value is < 60 seconds.
	if (uc_value < 60) {
		
		// Change the value into BCD.
		uc_value = ((uc_value / 10) << 4) + (uc_value % 10);
		
		// Read back the current value of register "Seconds".
		uc_current_register_value = uc_i2c_read(RTC_ADDRESS, 0x00);
		
		// We only interested in the CH bit, mask out the others.
		uc_current_register_value &= 0x80;
		
		// Write to the I2C RTC.
		uc_i2c_write(RTC_ADDRESS, 0x00, uc_current_register_value | uc_value);
	}	
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_rtc_get_minutes
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for minutes.
*
* DESCRIPTIONS:
* Get the value for minutes.
*
*******************************************************************************/
unsigned char uc_i2c_rtc_get_minutes(void)
{
	unsigned char uc_i2c_data;
	
	// Read the value of register "Minutes".
	uc_i2c_data = uc_i2c_read(RTC_ADDRESS, 0x01);
	
	// Convert the BCD to binary and return the value.
	return (uc_i2c_data & 0x0f) + ((uc_i2c_data >> 4) * 10);
}	



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_set_minutes
*
* PARAMETERS:
* ~ uc_value	- The value for minutes.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for minutes.
*
*******************************************************************************/
void i2c_rtc_set_minutes(unsigned char uc_value)
{
	// Make sure the value is < 60 minutes.
	if (uc_value < 60) {
		
		// Change the value into BCD.
		uc_value = ((uc_value / 10) << 4) + (uc_value % 10);
		
		// Write to the I2C RTC.
		uc_i2c_write(RTC_ADDRESS, 0x01, uc_value);
	}	
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_rtc_get_hours
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for hours.
*
* DESCRIPTIONS:
* Get the value for hours.
*
*******************************************************************************/
unsigned char uc_i2c_rtc_get_hours(void)
{
	unsigned char uc_i2c_data;
	
	// Read the value of register "Hours".
	uc_i2c_data = uc_i2c_read(RTC_ADDRESS, 0x02);
	
	// Convert the BCD to binary and return the value.
	return (uc_i2c_data & 0x0f) + (((uc_i2c_data >> 4) & 0x03) * 10);
}	



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_set_hours
*
* PARAMETERS:
* ~ uc_value	- The value for hours.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for hours.
*
*******************************************************************************/
void i2c_rtc_set_hours(unsigned char uc_value)
{
	// The current value of the DS1307 RTC register.
	unsigned char uc_current_register_value;
	
	
	
	// Make sure the value is < 24 hours.
	if (uc_value < 24) {
		
		// Change the value into BCD.
		uc_value = ((uc_value / 10) << 4) + (uc_value % 10);
		
		// Read back the current value of register "Hours".
		uc_current_register_value = uc_i2c_read(RTC_ADDRESS, 0x02);
		
		// We only interested in the 12-hour/24-hour mode bit, mask out the others.
		uc_current_register_value &= 0x40;
		
		// Write to the I2C RTC.
		uc_i2c_write(RTC_ADDRESS, 0x02, uc_current_register_value | uc_value);
	}	
}	



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_rtc_get_day
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for day.
*
* DESCRIPTIONS:
* Get the value for day.
*
*******************************************************************************/
unsigned char uc_i2c_rtc_get_day(void)
{
	// Read and return the value of register "Day".
	return uc_i2c_read(RTC_ADDRESS, 0x03);
}	



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_set_day
*
* PARAMETERS:
* ~ uc_value	- The value for day.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for day.
*
*******************************************************************************/
void i2c_rtc_set_day(unsigned char uc_value)
{
	// Make sure the value is within 1 - 7.
	if (uc_value > 0 && uc_value <= 7) {
		// Write to the I2C RTC.
		uc_i2c_write(RTC_ADDRESS, 0x03, uc_value);
	}	
}



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_rtc_get_date
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for date.
*
* DESCRIPTIONS:
* Get the value for date.
*
*******************************************************************************/
unsigned char uc_i2c_rtc_get_date(void)
{
	unsigned char uc_i2c_data;
	
	// Read the value of register "Date".
	uc_i2c_data = uc_i2c_read(RTC_ADDRESS, 0x04);
	
	// Convert the BCD to binary and return the value.
	return (uc_i2c_data & 0x0f) + ((uc_i2c_data >> 4) * 10);
}	



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_set_date
*
* PARAMETERS:
* ~ uc_value	- The value for date.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for date.
*
*******************************************************************************/
void i2c_rtc_set_date(unsigned char uc_value)
{
	// Make sure the value is within 1 - 31.
	if (uc_value > 0 && uc_value <= 31) {
		
		// Change the value into BCD.
		uc_value = ((uc_value / 10) << 4) + (uc_value % 10);
		
		// Write to the I2C RTC.
		uc_i2c_write(RTC_ADDRESS, 0x04, uc_value);
	}	
}



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_rtc_get_month
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for month.
*
* DESCRIPTIONS:
* Get the value for month.
*
*******************************************************************************/
unsigned char uc_i2c_rtc_get_month(void)
{
	unsigned char uc_i2c_data;
	
	// Read the value of register "Month".
	uc_i2c_data = uc_i2c_read(RTC_ADDRESS, 0x05);
	
	// Convert the BCD to binary and return the value.
	return (uc_i2c_data & 0x0f) + ((uc_i2c_data >> 4) * 10);
}	



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_set_month
*
* PARAMETERS:
* ~ uc_value	- The value for month.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for month.
*
*******************************************************************************/
void i2c_rtc_set_month(unsigned char uc_value)
{
	// Make sure the value is within 1 - 12.
	if (uc_value > 0 && uc_value <= 12) {
		
		// Change the value into BCD.
		uc_value = ((uc_value / 10) << 4) + (uc_value % 10);
		
		// Write to the I2C RTC.
		uc_i2c_write(RTC_ADDRESS, 0x05, uc_value);
	}	
}



/*******************************************************************************
* PUBLIC FUNCTION: uc_i2c_rtc_get_year
*
* PARAMETERS:
* ~ void
*
* RETURN:
* ~ The value for year.
*
* DESCRIPTIONS:
* Get the value for year.
*
*******************************************************************************/
unsigned char uc_i2c_rtc_get_year(void)
{
	unsigned char uc_i2c_data;
	
	// Read the value of register "Year".
	uc_i2c_data = uc_i2c_read(RTC_ADDRESS, 0x06);
	
	// Convert the BCD to binary and return the value.
	return (uc_i2c_data & 0x0f) + ((uc_i2c_data >> 4) * 10);
}	



/*******************************************************************************
* PUBLIC FUNCTION: i2c_rtc_set_year
*
* PARAMETERS:
* ~ uc_value	- The value for year.
*
* RETURN:
* ~ void
*
* DESCRIPTIONS:
* Set the value for year.
*
*******************************************************************************/
void i2c_rtc_set_year(unsigned char uc_value)
{
	// Make sure the value is < 100.
	if (uc_value < 100) {
		
		// Change the value into BCD.
		uc_value = ((uc_value / 10) << 4) + (uc_value % 10);
		
		// Write to the I2C RTC.
		uc_i2c_write(RTC_ADDRESS, 0x06, uc_value);
	}	
}
