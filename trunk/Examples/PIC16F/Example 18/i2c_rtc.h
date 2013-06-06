/*******************************************************************************
* This file provides the functions for the DS1307 RTC on PTK40A
* Prior to using these functions, user need to initialize the I2C module.
*
* Author: Ober Choo Sui Hong @ Cytron Technologies Sdn. Bhd.
*******************************************************************************/



#ifndef _I2C_RTC_H
#define _I2C_RTC_H



/*******************************************************************************
* PUBLIC FUNCTION PROTOTYPES                                                   *
*******************************************************************************/

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
extern void i2c_rtc_initialize(void);



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
extern unsigned char uc_i2c_rtc_get_seconds(void);



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
extern void i2c_rtc_set_seconds(unsigned char uc_value);



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
extern unsigned char uc_i2c_rtc_get_minutes(void);



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
extern void i2c_rtc_set_minutes(unsigned char uc_value);



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
extern unsigned char uc_i2c_rtc_get_hours(void);



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
extern void i2c_rtc_set_hours(unsigned char uc_value);



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
extern unsigned char uc_i2c_rtc_get_day(void);



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
extern void i2c_rtc_set_day(unsigned char uc_value);



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
extern unsigned char uc_i2c_rtc_get_date(void);



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
extern void i2c_rtc_set_date(unsigned char uc_value);



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
extern unsigned char uc_i2c_rtc_get_month(void);



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
extern void i2c_rtc_set_month(unsigned char uc_value);



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
extern unsigned char uc_i2c_rtc_get_year(void);



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
extern void i2c_rtc_set_year(unsigned char uc_value);



#endif
