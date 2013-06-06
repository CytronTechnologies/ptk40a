opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 34 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
	psect config,class=CONFIG,delta=2 ;#
# 34 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_seg7_initialize
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_beep
	FNCALL	_main,_c_wait_keypad
	FNCALL	_main,_seg7_com_dis
	FNCALL	_lcd_initialize,_set_lcd_e
	FNCALL	_lcd_initialize,_send_lcd_data
	FNCALL	_lcd_initialize,_lcd_clear
	FNCALL	_lcd_clear,_send_lcd_data
	FNCALL	_c_wait_keypad,_c_read_keypad
	FNCALL	_beep,_delay_ms
	FNCALL	_seg7_com_dis,_seg7_1_dis
	FNCALL	_seg7_com_dis,_seg7_2_dis
	FNCALL	_seg7_com_dis,___awmod
	FNCALL	_seg7_com_dis,___awdiv
	FNCALL	_send_lcd_data,_set_lcd_rs
	FNCALL	_send_lcd_data,_set_lcd_data
	FNCALL	_send_lcd_data,_set_lcd_e
	FNROOT	_main
	global	lcd_bcd@F1131
	global	_ADRESH
psect	text395,local,class=CODE,delta=2
global __ptext395
__ptext395:
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_PORTE
_PORTE	set	9
	global	_ADCS0
_ADCS0	set	254
	global	_ADCS1
_ADCS1	set	255
	global	_ADON
_ADON	set	248
	global	_CARRY
_CARRY	set	24
	global	_CHS0
_CHS0	set	251
	global	_CHS1
_CHS1	set	252
	global	_CHS2
_CHS2	set	253
	global	_GIE
_GIE	set	95
	global	_GO_DONE
_GO_DONE	set	250
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RC2
_RC2	set	58
	global	_RD4
_RD4	set	68
	global	_RD5
_RD5	set	69
	global	_RD6
_RD6	set	70
	global	_RD7
_RD7	set	71
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
	global	_ADCS2
_ADCS2	set	1278
	global	_ADFM
_ADFM	set	1279
	global	_PCFG0
_PCFG0	set	1272
	global	_PCFG1
_PCFG1	set	1273
	global	_PCFG2
_PCFG2	set	1274
	global	_PCFG3
_PCFG3	set	1275
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"Example5.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
lcd_bcd@F1131:
       ds      10

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_beep
?_beep:	; 0 bytes @ 0x0
	global	?_set_lcd_e
?_set_lcd_e:	; 0 bytes @ 0x0
	global	??_set_lcd_e
??_set_lcd_e:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_set_lcd_rs
?_set_lcd_rs:	; 0 bytes @ 0x0
	global	??_set_lcd_rs
??_set_lcd_rs:	; 0 bytes @ 0x0
	global	?_set_lcd_data
?_set_lcd_data:	; 0 bytes @ 0x0
	global	??_set_lcd_data
??_set_lcd_data:	; 0 bytes @ 0x0
	global	?_adc_initialize
?_adc_initialize:	; 0 bytes @ 0x0
	global	??_adc_initialize
??_adc_initialize:	; 0 bytes @ 0x0
	global	?_seg7_initialize
?_seg7_initialize:	; 0 bytes @ 0x0
	global	??_seg7_initialize
??_seg7_initialize:	; 0 bytes @ 0x0
	global	?_seg7_1_dis
?_seg7_1_dis:	; 0 bytes @ 0x0
	global	??_seg7_1_dis
??_seg7_1_dis:	; 0 bytes @ 0x0
	global	?_seg7_2_dis
?_seg7_2_dis:	; 0 bytes @ 0x0
	global	??_seg7_2_dis
??_seg7_2_dis:	; 0 bytes @ 0x0
	global	?_seg7_com_dis
?_seg7_com_dis:	; 0 bytes @ 0x0
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	??_c_read_keypad
??_c_read_keypad:	; 0 bytes @ 0x0
	global	?_c_wait_keypad
?_c_wait_keypad:	; 1 bytes @ 0x0
	global	?_c_read_keypad
?_c_read_keypad:	; 1 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	set_lcd_e@b_output
set_lcd_e@b_output:	; 1 bytes @ 0x0
	global	set_lcd_rs@b_output
set_lcd_rs@b_output:	; 1 bytes @ 0x0
	global	set_lcd_data@uc_data
set_lcd_data@uc_data:	; 1 bytes @ 0x0
	global	delay_ms@ui_value
delay_ms@ui_value:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_c_wait_keypad
??_c_wait_keypad:	; 0 bytes @ 0x1
	global	?_send_lcd_data
?_send_lcd_data:	; 0 bytes @ 0x1
	global	send_lcd_data@uc_data
send_lcd_data@uc_data:	; 1 bytes @ 0x1
	ds	1
	global	??_send_lcd_data
??_send_lcd_data:	; 0 bytes @ 0x2
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	seg7_1_dis@uc_number
seg7_1_dis@uc_number:	; 1 bytes @ 0x2
	global	seg7_2_dis@uc_number
seg7_2_dis@uc_number:	; 1 bytes @ 0x2
	global	c_wait_keypad@c_pressed_key
c_wait_keypad@c_pressed_key:	; 1 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??_beep
??_beep:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	beep@uc_count
beep@uc_count:	; 1 bytes @ 0x4
	global	send_lcd_data@b_rs
send_lcd_data@b_rs:	; 1 bytes @ 0x4
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x5
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	??_seg7_com_dis
??_seg7_com_dis:	; 0 bytes @ 0x9
	ds	2
	global	seg7_com_dis@uc_number
seg7_com_dis@uc_number:	; 1 bytes @ 0xB
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xC
	global	main@value
main@value:	; 1 bytes @ 0xC
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      13
;; BANK0           80      0      10
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_seg7_com_dis
;;   _lcd_initialize->_send_lcd_data
;;   _lcd_clear->_send_lcd_data
;;   _c_wait_keypad->_c_read_keypad
;;   _beep->_delay_ms
;;   _seg7_com_dis->___awdiv
;;   _send_lcd_data->_set_lcd_rs
;;   _send_lcd_data->_set_lcd_data
;;   _send_lcd_data->_set_lcd_e
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     768
;;                                             12 COMMON     1     1      0
;;                     _adc_initialize
;;                    _seg7_initialize
;;                     _lcd_initialize
;;                               _beep
;;                      _c_wait_keypad
;;                       _seg7_com_dis
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       2     2      0     242
;;                                              5 COMMON     2     2      0
;;                          _set_lcd_e
;;                      _send_lcd_data
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (2) _lcd_clear                                            0     0      0     110
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _c_wait_keypad                                        2     2      0      30
;;                                              1 COMMON     2     2      0
;;                      _c_read_keypad
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 1     1      0      30
;;                                              4 COMMON     1     1      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _seg7_com_dis                                         3     3      0     465
;;                                              9 COMMON     3     3      0
;;                         _seg7_1_dis
;;                         _seg7_2_dis
;;                            ___awmod
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (3) _send_lcd_data                                        4     3      1     110
;;                                              1 COMMON     4     3      1
;;                         _set_lcd_rs
;;                       _set_lcd_data
;;                          _set_lcd_e
;; ---------------------------------------------------------------------------------
;; (2) _c_read_keypad                                        1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _delay_ms                                             4     2      2      15
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (2) _seg7_2_dis                                           3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _seg7_1_dis                                           3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _seg7_initialize                                      2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     195
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     195
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (4) _set_lcd_data                                         1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _set_lcd_rs                                           1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _set_lcd_e                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _adc_initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _adc_initialize
;;   _seg7_initialize
;;   _lcd_initialize
;;     _set_lcd_e
;;     _send_lcd_data
;;       _set_lcd_rs
;;       _set_lcd_data
;;       _set_lcd_e
;;     _lcd_clear
;;       _send_lcd_data
;;         _set_lcd_rs
;;         _set_lcd_data
;;         _set_lcd_e
;;   _beep
;;     _delay_ms
;;   _c_wait_keypad
;;     _c_read_keypad
;;   _seg7_com_dis
;;     _seg7_1_dis
;;     _seg7_2_dis
;;     ___awmod
;;     ___awdiv
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      D       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      17       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       A       5       12.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      1B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 59 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  2095[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_adc_initialize
;;		_seg7_initialize
;;		_lcd_initialize
;;		_beep
;;		_c_wait_keypad
;;		_seg7_com_dis
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
	line	59
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	60
	
l6097:	
;Main E_5.c: 60: unsigned char value = 0;
	clrf	(main@value)
	line	62
	
l6099:	
;Main E_5.c: 62: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	63
;Main E_5.c: 63: PORTB = 0;
	clrf	(6)	;volatile
	line	64
;Main E_5.c: 64: PORTC = 0;
	clrf	(7)	;volatile
	line	65
;Main E_5.c: 65: PORTD = 0;
	clrf	(8)	;volatile
	line	66
;Main E_5.c: 66: PORTE = 0;
	clrf	(9)	;volatile
	line	72
	
l6101:	
;Main E_5.c: 72: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	73
	
l6103:	
;Main E_5.c: 73: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	74
	
l6105:	
;Main E_5.c: 74: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	75
	
l6107:	
;Main E_5.c: 75: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	76
	
l6109:	
;Main E_5.c: 76: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	79
	
l6111:	
;Main E_5.c: 79: adc_initialize();
	fcall	_adc_initialize
	line	82
	
l6113:	
;Main E_5.c: 82: seg7_initialize();
	fcall	_seg7_initialize
	line	85
	
l6115:	
;Main E_5.c: 85: lcd_initialize();
	fcall	_lcd_initialize
	line	87
	
l6117:	
;Main E_5.c: 87: beep(2);
	movlw	(02h)
	fcall	_beep
	goto	l6119
	line	96
;Main E_5.c: 96: while(1)
	
l2096:	
	line	98
	
l6119:	
;Main E_5.c: 97: {
;Main E_5.c: 98: seg7_com_dis(c_wait_keypad());
	fcall	_c_wait_keypad
	fcall	_seg7_com_dis
	goto	l6119
	line	99
	
l2097:	
	line	96
	goto	l6119
	
l2098:	
	goto	l2100
	line	101
;Main E_5.c: 99: }
;Main E_5.c: 101: while(1) continue;
	
l2099:	
	
l2100:	
	goto	l2100
	
l2101:	
	line	102
	
l2102:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd_initialize
psect	text396,local,class=CODE,delta=2
global __ptext396
__ptext396:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 103 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_set_lcd_e
;;		_send_lcd_data
;;		_lcd_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text396
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
	line	103
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 4
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	106
	
l6085:	
;lcd.c: 106: set_lcd_e(1);
	movlw	(01h)
	fcall	_set_lcd_e
	line	107
	
l6087:	
;lcd.c: 107: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
movwf	((??_lcd_initialize+0)+0+1),f
	movlw	101
movwf	((??_lcd_initialize+0)+0),f
u2797:
	decfsz	((??_lcd_initialize+0)+0),f
	goto	u2797
	decfsz	((??_lcd_initialize+0)+0+1),f
	goto	u2797
	nop2
opt asmopt_on

	line	110
	
l6089:	
;lcd.c: 110: send_lcd_data(0, 0b00100000 | 0b00010000 | 0b00001000 | 0b00000000);
	movlw	(038h)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	114
	
l6091:	
;lcd.c: 114: send_lcd_data(0, 0b00000100 | 0b00000010 | 0b00000000);
	movlw	(06h)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	117
	
l6093:	
;lcd.c: 117: send_lcd_data(0, 0b00001000 | 0b00000100 | 0b00000000 | 0b00000000);
	movlw	(0Ch)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	120
	
l6095:	
;lcd.c: 120: lcd_clear();
	fcall	_lcd_clear
	line	121
	
l3532:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_lcd_clear
psect	text397,local,class=CODE,delta=2
global __ptext397
__ptext397:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 156 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send_lcd_data
;; This function is called by:
;;		_lcd_initialize
;; This function uses a non-reentrant model
;;
psect	text397
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
	line	156
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 4
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	158
	
l6083:	
;lcd.c: 158: send_lcd_data(0, 0b00000001);
	clrf	(?_send_lcd_data)
	bsf	status,0
	rlf	(?_send_lcd_data),f
	movlw	(0)
	fcall	_send_lcd_data
	line	159
	
l3538:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_c_wait_keypad
psect	text398,local,class=CODE,delta=2
global __ptext398
__ptext398:

;; *************** function _c_wait_keypad *****************
;; Defined at:
;;		line 116 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\keypad.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  c_pressed_ke    1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_c_read_keypad
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text398
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\keypad.c"
	line	116
	global	__size_of_c_wait_keypad
	__size_of_c_wait_keypad	equ	__end_of_c_wait_keypad-_c_wait_keypad
	
_c_wait_keypad:	
	opt	stack 6
; Regs used in _c_wait_keypad: [wreg+pclath+cstack]
	line	118
	
l5897:	
;keypad.c: 118: unsigned char c_pressed_key = 0xFF;
	movlw	(0FFh)
	movwf	(??_c_wait_keypad+0)+0
	movf	(??_c_wait_keypad+0)+0,w
	movwf	(c_wait_keypad@c_pressed_key)
	goto	l5899
	line	121
;keypad.c: 121: do {
	
l2830:	
	line	122
	
l5899:	
;keypad.c: 122: c_pressed_key = c_read_keypad();
	fcall	_c_read_keypad
	movwf	(??_c_wait_keypad+0)+0
	movf	(??_c_wait_keypad+0)+0,w
	movwf	(c_wait_keypad@c_pressed_key)
	line	124
	
l5901:	
;keypad.c: 123: }
;keypad.c: 124: while (c_pressed_key == 0xFF);
	movf	(c_wait_keypad@c_pressed_key),w
	xorlw	0FFh
	skipnz
	goto	u2531
	goto	u2530
u2531:
	goto	l5899
u2530:
	goto	l5903
	
l2831:	
	line	127
;keypad.c: 127: while (c_read_keypad() != 0xFF);
	goto	l5903
	
l2833:	
	goto	l5903
	
l2832:	
	
l5903:	
	fcall	_c_read_keypad
	xorlw	0FFh
	skipz
	goto	u2541
	goto	u2540
u2541:
	goto	l5903
u2540:
	goto	l5905
	
l2834:	
	line	129
	
l5905:	
;keypad.c: 129: return c_pressed_key;
	movf	(c_wait_keypad@c_pressed_key),w
	goto	l2835
	
l5907:	
	line	130
	
l2835:	
	return
	opt stack 0
GLOBAL	__end_of_c_wait_keypad
	__end_of_c_wait_keypad:
;; =============== function _c_wait_keypad ends ============

	signat	_c_wait_keypad,89
	global	_beep
psect	text399,local,class=CODE,delta=2
global __ptext399
__ptext399:

;; *************** function _beep *****************
;; Defined at:
;;		line 138 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
;; Parameters:    Size  Location     Type
;;  uc_count        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uc_count        1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text399
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
	line	138
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 6
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@uc_count stored from wreg
	movwf	(beep@uc_count)
	line	139
	
l5889:	
;Main E_5.c: 139: while (uc_count-- > 0) {
	goto	l5895
	
l2112:	
	line	140
;Main E_5.c: 140: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	141
	
l5891:	
;Main E_5.c: 141: delay_ms(80);
	movlw	low(050h)
	movwf	(?_delay_ms)
	movlw	high(050h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	142
	
l5893:	
;Main E_5.c: 142: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	143
;Main E_5.c: 143: delay_ms(100);
	movlw	low(064h)
	movwf	(?_delay_ms)
	movlw	high(064h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l5895
	line	144
	
l2111:	
	line	139
	
l5895:	
	movlw	low(01h)
	subwf	(beep@uc_count),f
	movf	((beep@uc_count)),w
	xorlw	0FFh
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l2112
u2520:
	goto	l2114
	
l2113:	
	line	145
	
l2114:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,4216
	global	_seg7_com_dis
psect	text400,local,class=CODE,delta=2
global __ptext400
__ptext400:

;; *************** function _seg7_com_dis *****************
;; Defined at:
;;		line 127 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
;; Parameters:    Size  Location     Type
;;  uc_number       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uc_number       1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_seg7_1_dis
;;		_seg7_2_dis
;;		___awmod
;;		___awdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text400
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
	line	127
	global	__size_of_seg7_com_dis
	__size_of_seg7_com_dis	equ	__end_of_seg7_com_dis-_seg7_com_dis
	
_seg7_com_dis:	
	opt	stack 6
; Regs used in _seg7_com_dis: [wreg+status,2+status,0+pclath+cstack]
;seg7_com_dis@uc_number stored from wreg
	movwf	(seg7_com_dis@uc_number)
	line	128
	
l5883:	
;seg7.c: 128: if(uc_number > 99)
	movlw	(064h)
	subwf	(seg7_com_dis@uc_number),w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l5887
u2510:
	line	130
	
l5885:	
;seg7.c: 129: {
;seg7.c: 130: seg7_1_dis(0x0A);
	movlw	(0Ah)
	fcall	_seg7_1_dis
	line	131
;seg7.c: 131: seg7_2_dis(0x0A);
	movlw	(0Ah)
	fcall	_seg7_2_dis
	line	132
;seg7.c: 132: }
	goto	l1397
	line	133
	
l1395:	
	line	135
	
l5887:	
;seg7.c: 133: else
;seg7.c: 134: {
;seg7.c: 135: seg7_1_dis(uc_number%10);
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(seg7_com_dis@uc_number),w
	movwf	(??_seg7_com_dis+0)+0
	clrf	(??_seg7_com_dis+0)+0+1
	movf	0+(??_seg7_com_dis+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_seg7_com_dis+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	fcall	_seg7_1_dis
	line	136
;seg7.c: 136: seg7_2_dis(uc_number/10);
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(seg7_com_dis@uc_number),w
	movwf	(??_seg7_com_dis+0)+0
	clrf	(??_seg7_com_dis+0)+0+1
	movf	0+(??_seg7_com_dis+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_seg7_com_dis+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	fcall	_seg7_2_dis
	goto	l1397
	line	137
	
l1396:	
	line	138
	
l1397:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_com_dis
	__end_of_seg7_com_dis:
;; =============== function _seg7_com_dis ends ============

	signat	_seg7_com_dis,4216
	global	_send_lcd_data
psect	text401,local,class=CODE,delta=2
global __ptext401
__ptext401:

;; *************** function _send_lcd_data *****************
;; Defined at:
;;		line 328 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
;; Parameters:    Size  Location     Type
;;  b_rs            1    wreg     unsigned char 
;;  uc_data         1    1[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  b_rs            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_set_lcd_rs
;;		_set_lcd_data
;;		_set_lcd_e
;; This function is called by:
;;		_lcd_initialize
;;		_lcd_clear
;;		_lcd_config
;;		_lcd_home
;;		_lcd_2ndline
;;		_lcd_goto
;;		_lcd_putchar
;; This function uses a non-reentrant model
;;
psect	text401
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
	line	328
	global	__size_of_send_lcd_data
	__size_of_send_lcd_data	equ	__end_of_send_lcd_data-_send_lcd_data
	
_send_lcd_data:	
	opt	stack 4
; Regs used in _send_lcd_data: [wreg+status,2+status,0+pclath+cstack]
;send_lcd_data@b_rs stored from wreg
	line	330
	movwf	(send_lcd_data@b_rs)
	
l6073:	
;lcd.c: 330: set_lcd_rs(b_rs);
	movf	(send_lcd_data@b_rs),w
	fcall	_set_lcd_rs
	line	331
;lcd.c: 331: set_lcd_data(uc_data);
	movf	(send_lcd_data@uc_data),w
	fcall	_set_lcd_data
	line	334
;lcd.c: 334: set_lcd_e(1);
	movlw	(01h)
	fcall	_set_lcd_e
	line	335
	
l6075:	
;lcd.c: 335: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_send_lcd_data+0)+0+1),f
	movlw	125
movwf	((??_send_lcd_data+0)+0),f
u2807:
	decfsz	((??_send_lcd_data+0)+0),f
	goto	u2807
	decfsz	((??_send_lcd_data+0)+0+1),f
	goto	u2807
opt asmopt_on

	line	336
	
l6077:	
;lcd.c: 336: set_lcd_e(0);
	movlw	(0)
	fcall	_set_lcd_e
	line	337
;lcd.c: 337: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_send_lcd_data+0)+0+1),f
	movlw	251
movwf	((??_send_lcd_data+0)+0),f
u2817:
	decfsz	((??_send_lcd_data+0)+0),f
	goto	u2817
	decfsz	((??_send_lcd_data+0)+0+1),f
	goto	u2817
	nop2
opt asmopt_on

	line	340
	
l6079:	
;lcd.c: 340: set_lcd_rs(0);
	movlw	(0)
	fcall	_set_lcd_rs
	line	341
	
l6081:	
;lcd.c: 341: set_lcd_data(0);
	movlw	(0)
	fcall	_set_lcd_data
	line	342
	
l3571:	
	return
	opt stack 0
GLOBAL	__end_of_send_lcd_data
	__end_of_send_lcd_data:
;; =============== function _send_lcd_data ends ============

	signat	_send_lcd_data,8312
	global	_c_read_keypad
psect	text402,local,class=CODE,delta=2
global __ptext402
__ptext402:

;; *************** function _c_read_keypad *****************
;; Defined at:
;;		line 29 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\keypad.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_c_wait_keypad
;; This function uses a non-reentrant model
;;
psect	text402
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\keypad.c"
	line	29
	global	__size_of_c_read_keypad
	__size_of_c_read_keypad	equ	__end_of_c_read_keypad-_c_read_keypad
	
_c_read_keypad:	
	opt	stack 6
; Regs used in _c_read_keypad: [wreg]
	line	31
	
l5787:	
;keypad.c: 31: RD4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(68/8),(68)&7
	line	32
;keypad.c: 32: RD5 = 1;
	bsf	(69/8),(69)&7
	line	33
;keypad.c: 33: RD6 = 1;
	bsf	(70/8),(70)&7
	line	34
;keypad.c: 34: RD7 = 1;
	bsf	(71/8),(71)&7
	line	35
	
l5789:	
;keypad.c: 35: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2827:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2827
	nop2	;nop
opt asmopt_on

	line	36
	
l5791:	
;keypad.c: 36: if (RB0 == 0) return 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l2801
u2350:
	
l5793:	
	movlw	(01h)
	goto	l2802
	
l5795:	
	goto	l2802
	
l2801:	
	line	37
;keypad.c: 37: if (RB1 == 0) return 2;
	btfsc	(49/8),(49)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l2803
u2360:
	
l5797:	
	movlw	(02h)
	goto	l2802
	
l5799:	
	goto	l2802
	
l2803:	
	line	38
;keypad.c: 38: if (RB2 == 0) return 3;
	btfsc	(50/8),(50)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l2804
u2370:
	
l5801:	
	movlw	(03h)
	goto	l2802
	
l5803:	
	goto	l2802
	
l2804:	
	line	39
;keypad.c: 39: if (RB3 == 0) return 10;
	btfsc	(51/8),(51)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l2805
u2380:
	
l5805:	
	movlw	(0Ah)
	goto	l2802
	
l5807:	
	goto	l2802
	
l2805:	
	line	41
;keypad.c: 41: RD4 = 1;
	bsf	(68/8),(68)&7
	line	42
;keypad.c: 42: RD5 = 0;
	bcf	(69/8),(69)&7
	line	43
;keypad.c: 43: RD6 = 1;
	bsf	(70/8),(70)&7
	line	44
;keypad.c: 44: RD7 = 1;
	bsf	(71/8),(71)&7
	line	45
	
l5809:	
;keypad.c: 45: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2837:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2837
	nop2	;nop
opt asmopt_on

	line	46
	
l5811:	
;keypad.c: 46: if (RB0 == 0) return 4;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l2806
u2390:
	
l5813:	
	movlw	(04h)
	goto	l2802
	
l5815:	
	goto	l2802
	
l2806:	
	line	47
;keypad.c: 47: if (RB1 == 0) return 5;
	btfsc	(49/8),(49)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l2807
u2400:
	
l5817:	
	movlw	(05h)
	goto	l2802
	
l5819:	
	goto	l2802
	
l2807:	
	line	48
;keypad.c: 48: if (RB2 == 0) return 6;
	btfsc	(50/8),(50)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2808
u2410:
	
l5821:	
	movlw	(06h)
	goto	l2802
	
l5823:	
	goto	l2802
	
l2808:	
	line	49
;keypad.c: 49: if (RB3 == 0) return 11;
	btfsc	(51/8),(51)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l2809
u2420:
	
l5825:	
	movlw	(0Bh)
	goto	l2802
	
l5827:	
	goto	l2802
	
l2809:	
	line	51
;keypad.c: 51: RD4 = 1;
	bsf	(68/8),(68)&7
	line	52
;keypad.c: 52: RD5 = 1;
	bsf	(69/8),(69)&7
	line	53
;keypad.c: 53: RD6 = 0;
	bcf	(70/8),(70)&7
	line	54
;keypad.c: 54: RD7 = 1;
	bsf	(71/8),(71)&7
	line	55
	
l5829:	
;keypad.c: 55: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2847:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2847
	nop2	;nop
opt asmopt_on

	line	56
	
l5831:	
;keypad.c: 56: if (RB0 == 0) return 7;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l2810
u2430:
	
l5833:	
	movlw	(07h)
	goto	l2802
	
l5835:	
	goto	l2802
	
l2810:	
	line	57
;keypad.c: 57: if (RB1 == 0) return 8;
	btfsc	(49/8),(49)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l2811
u2440:
	
l5837:	
	movlw	(08h)
	goto	l2802
	
l5839:	
	goto	l2802
	
l2811:	
	line	58
;keypad.c: 58: if (RB2 == 0) return 9;
	btfsc	(50/8),(50)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l2812
u2450:
	
l5841:	
	movlw	(09h)
	goto	l2802
	
l5843:	
	goto	l2802
	
l2812:	
	line	59
;keypad.c: 59: if (RB3 == 0) return 12;
	btfsc	(51/8),(51)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l2813
u2460:
	
l5845:	
	movlw	(0Ch)
	goto	l2802
	
l5847:	
	goto	l2802
	
l2813:	
	line	61
;keypad.c: 61: RD4 = 1;
	bsf	(68/8),(68)&7
	line	62
;keypad.c: 62: RD5 = 1;
	bsf	(69/8),(69)&7
	line	63
;keypad.c: 63: RD6 = 1;
	bsf	(70/8),(70)&7
	line	64
;keypad.c: 64: RD7 = 0;
	bcf	(71/8),(71)&7
	line	65
	
l5849:	
;keypad.c: 65: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2857:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2857
	nop2	;nop
opt asmopt_on

	line	66
	
l5851:	
;keypad.c: 66: if (RB0 == 0) return 14;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l2814
u2470:
	
l5853:	
	movlw	(0Eh)
	goto	l2802
	
l5855:	
	goto	l2802
	
l2814:	
	line	67
;keypad.c: 67: if (RB1 == 0) return 0;
	btfsc	(49/8),(49)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l2815
u2480:
	
l5857:	
	movlw	(0)
	goto	l2802
	
l5859:	
	goto	l2802
	
l2815:	
	line	68
;keypad.c: 68: if (RB2 == 0) return 15;
	btfsc	(50/8),(50)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l2816
u2490:
	
l5861:	
	movlw	(0Fh)
	goto	l2802
	
l5863:	
	goto	l2802
	
l2816:	
	line	69
;keypad.c: 69: if (RB3 == 0) return 13;
	btfsc	(51/8),(51)&7
	goto	u2501
	goto	u2500
u2501:
	goto	l5869
u2500:
	
l5865:	
	movlw	(0Dh)
	goto	l2802
	
l5867:	
	goto	l2802
	
l2817:	
	line	71
	
l5869:	
;keypad.c: 71: return 0xFF;
	movlw	(0FFh)
	goto	l2802
	
l5871:	
	line	72
	
l2802:	
	return
	opt stack 0
GLOBAL	__end_of_c_read_keypad
	__end_of_c_read_keypad:
;; =============== function _c_read_keypad ends ============

	signat	_c_read_keypad,89
	global	_delay_ms
psect	text403,local,class=CODE,delta=2
global __ptext403
__ptext403:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 118 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
;; Parameters:    Size  Location     Type
;;  ui_value        2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_beep
;; This function uses a non-reentrant model
;;
psect	text403
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\Main E_5.c"
	line	118
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 6
; Regs used in _delay_ms: [wreg]
	line	119
	
l5783:	
;Main E_5.c: 119: while (ui_value-- > 0) {
	goto	l2105
	
l2106:	
	line	120
	
l5785:	
;Main E_5.c: 120: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay_ms+0)+0+1),f
	movlw	125
movwf	((??_delay_ms+0)+0),f
u2867:
	decfsz	((??_delay_ms+0)+0),f
	goto	u2867
	decfsz	((??_delay_ms+0)+0+1),f
	goto	u2867
opt asmopt_on

	line	121
	
l2105:	
	line	119
	movlw	low(01h)
	subwf	(delay_ms@ui_value),f
	movlw	high(01h)
	skipc
	decf	(delay_ms@ui_value+1),f
	subwf	(delay_ms@ui_value+1),f
	movlw	high(0FFFFh)
	xorwf	((delay_ms@ui_value+1)),w
	skipz
	goto	u2345
	movlw	low(0FFFFh)
	xorwf	((delay_ms@ui_value)),w
u2345:

	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l5785
u2340:
	goto	l2108
	
l2107:	
	line	122
	
l2108:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_seg7_2_dis
psect	text404,local,class=CODE,delta=2
global __ptext404
__ptext404:

;; *************** function _seg7_2_dis *****************
;; Defined at:
;;		line 103 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
;; Parameters:    Size  Location     Type
;;  uc_number       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uc_number       1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_seg7_com_dis
;; This function uses a non-reentrant model
;;
psect	text404
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
	line	103
	global	__size_of_seg7_2_dis
	__size_of_seg7_2_dis	equ	__end_of_seg7_2_dis-_seg7_2_dis
	
_seg7_2_dis:	
	opt	stack 6
; Regs used in _seg7_2_dis: [wreg+status,2+status,0]
;seg7_2_dis@uc_number stored from wreg
	movwf	(seg7_2_dis@uc_number)
	line	104
	
l5773:	
;seg7.c: 104: RE0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	105
	
l5775:	
;seg7.c: 105: PORTD = (PORTD & 0xf0) | uc_number;
	movf	(8),w
	andlw	0F0h
	iorwf	(seg7_2_dis@uc_number),w
	movwf	(8)	;volatile
	line	106
	
l5777:	
;seg7.c: 106: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_2_dis+0)+0+1),f
	movlw	125
movwf	((??_seg7_2_dis+0)+0),f
u2877:
	decfsz	((??_seg7_2_dis+0)+0),f
	goto	u2877
	decfsz	((??_seg7_2_dis+0)+0+1),f
	goto	u2877
opt asmopt_on

	line	107
	
l5779:	
;seg7.c: 107: RE0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(72/8),(72)&7
	line	108
	
l5781:	
;seg7.c: 108: PORTD = PORTD & 0xf0;
	movf	(8),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	110
	
l1392:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_2_dis
	__end_of_seg7_2_dis:
;; =============== function _seg7_2_dis ends ============

	signat	_seg7_2_dis,4216
	global	_seg7_1_dis
psect	text405,local,class=CODE,delta=2
global __ptext405
__ptext405:

;; *************** function _seg7_1_dis *****************
;; Defined at:
;;		line 79 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
;; Parameters:    Size  Location     Type
;;  uc_number       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uc_number       1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_seg7_com_dis
;; This function uses a non-reentrant model
;;
psect	text405
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
	line	79
	global	__size_of_seg7_1_dis
	__size_of_seg7_1_dis	equ	__end_of_seg7_1_dis-_seg7_1_dis
	
_seg7_1_dis:	
	opt	stack 6
; Regs used in _seg7_1_dis: [wreg+status,2+status,0]
;seg7_1_dis@uc_number stored from wreg
	movwf	(seg7_1_dis@uc_number)
	line	80
	
l5763:	
;seg7.c: 80: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	81
	
l5765:	
;seg7.c: 81: PORTD = (PORTD & 0xf0) | uc_number;
	movf	(8),w
	andlw	0F0h
	iorwf	(seg7_1_dis@uc_number),w
	movwf	(8)	;volatile
	line	82
	
l5767:	
;seg7.c: 82: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_1_dis+0)+0+1),f
	movlw	125
movwf	((??_seg7_1_dis+0)+0),f
u2887:
	decfsz	((??_seg7_1_dis+0)+0),f
	goto	u2887
	decfsz	((??_seg7_1_dis+0)+0+1),f
	goto	u2887
opt asmopt_on

	line	83
	
l5769:	
;seg7.c: 83: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	84
	
l5771:	
;seg7.c: 84: PORTD = PORTD & 0xf0;
	movf	(8),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	85
	
l1389:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_1_dis
	__end_of_seg7_1_dis:
;; =============== function _seg7_1_dis ends ============

	signat	_seg7_1_dis,4216
	global	_seg7_initialize
psect	text406,local,class=CODE,delta=2
global __ptext406
__ptext406:

;; *************** function _seg7_initialize *****************
;; Defined at:
;;		line 52 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text406
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\seg7.c"
	line	52
	global	__size_of_seg7_initialize
	__size_of_seg7_initialize	equ	__end_of_seg7_initialize-_seg7_initialize
	
_seg7_initialize:	
	opt	stack 7
; Regs used in _seg7_initialize: [wreg+status,2]
	line	53
	
l5751:	
;seg7.c: 53: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	54
;seg7.c: 54: RE0 = 0;
	bcf	(72/8),(72)&7
	line	55
	
l5753:	
;seg7.c: 55: PORTD = (PORTD & 0xf0) | 0x0A;
	movf	(8),w
	andlw	0F0h
	iorlw	0Ah
	movwf	(8)	;volatile
	line	56
	
l5755:	
;seg7.c: 56: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_initialize+0)+0+1),f
	movlw	125
movwf	((??_seg7_initialize+0)+0),f
u2897:
	decfsz	((??_seg7_initialize+0)+0),f
	goto	u2897
	decfsz	((??_seg7_initialize+0)+0+1),f
	goto	u2897
opt asmopt_on

	line	57
	
l5757:	
;seg7.c: 57: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	58
	
l5759:	
;seg7.c: 58: RE0 = 1;
	bsf	(72/8),(72)&7
	line	59
	
l5761:	
;seg7.c: 59: PORTD = PORTD & 0xf0;
	movf	(8),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	60
	
l1386:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_initialize
	__end_of_seg7_initialize:
;; =============== function _seg7_initialize ends ============

	signat	_seg7_initialize,88
	global	___awmod
psect	text407,local,class=CODE,delta=2
global __ptext407
__ptext407:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_seg7_com_dis
;; This function uses a non-reentrant model
;;
psect	text407
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l5489:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u1681
	goto	u1680
u1681:
	goto	l5493
u1680:
	line	10
	
l5491:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l5493
	line	12
	
l4471:	
	line	13
	
l5493:	
	btfss	(___awmod@divisor+1),7
	goto	u1691
	goto	u1690
u1691:
	goto	l5497
u1690:
	line	14
	
l5495:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l5497
	
l4472:	
	line	15
	
l5497:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u1701
	goto	u1700
u1701:
	goto	l5515
u1700:
	line	16
	
l5499:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l5505
	
l4475:	
	line	18
	
l5501:	
	movlw	01h
	
u1715:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u1715
	line	19
	
l5503:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l5505
	line	20
	
l4474:	
	line	17
	
l5505:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u1721
	goto	u1720
u1721:
	goto	l5501
u1720:
	goto	l5507
	
l4476:	
	goto	l5507
	line	21
	
l4477:	
	line	22
	
l5507:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u1735
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u1735:
	skipc
	goto	u1731
	goto	u1730
u1731:
	goto	l5511
u1730:
	line	23
	
l5509:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l5511
	
l4478:	
	line	24
	
l5511:	
	movlw	01h
	
u1745:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u1745
	line	25
	
l5513:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u1751
	goto	u1750
u1751:
	goto	l5507
u1750:
	goto	l5515
	
l4479:	
	goto	l5515
	line	26
	
l4473:	
	line	27
	
l5515:	
	movf	(___awmod@sign),w
	skipz
	goto	u1760
	goto	l5519
u1760:
	line	28
	
l5517:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l5519
	
l4480:	
	line	29
	
l5519:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l4481
	
l5521:	
	line	30
	
l4481:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text408,local,class=CODE,delta=2
global __ptext408
__ptext408:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_seg7_com_dis
;; This function uses a non-reentrant model
;;
psect	text408
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l5325:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u1211
	goto	u1210
u1211:
	goto	l5329
u1210:
	line	11
	
l5327:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l5329
	line	13
	
l4403:	
	line	14
	
l5329:	
	btfss	(___awdiv@dividend+1),7
	goto	u1221
	goto	u1220
u1221:
	goto	l5335
u1220:
	line	15
	
l5331:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l5333:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l5335
	line	17
	
l4404:	
	line	18
	
l5335:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l5337:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u1231
	goto	u1230
u1231:
	goto	l5357
u1230:
	line	20
	
l5339:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l5345
	
l4407:	
	line	22
	
l5341:	
	movlw	01h
	
u1245:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u1245
	line	23
	
l5343:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l5345
	line	24
	
l4406:	
	line	21
	
l5345:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u1251
	goto	u1250
u1251:
	goto	l5341
u1250:
	goto	l5347
	
l4408:	
	goto	l5347
	line	25
	
l4409:	
	line	26
	
l5347:	
	movlw	01h
	
u1265:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u1265
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u1275
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u1275:
	skipc
	goto	u1271
	goto	u1270
u1271:
	goto	l5353
u1270:
	line	28
	
l5349:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l5351:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l5353
	line	30
	
l4410:	
	line	31
	
l5353:	
	movlw	01h
	
u1285:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u1285
	line	32
	
l5355:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u1291
	goto	u1290
u1291:
	goto	l5347
u1290:
	goto	l5357
	
l4411:	
	goto	l5357
	line	33
	
l4405:	
	line	34
	
l5357:	
	movf	(___awdiv@sign),w
	skipz
	goto	u1300
	goto	l5361
u1300:
	line	35
	
l5359:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l5361
	
l4412:	
	line	36
	
l5361:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l4413
	
l5363:	
	line	37
	
l4413:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_set_lcd_data
psect	text409,local,class=CODE,delta=2
global __ptext409
__ptext409:

;; *************** function _set_lcd_data *****************
;; Defined at:
;;		line 400 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
;; Parameters:    Size  Location     Type
;;  uc_data         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uc_data         1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_send_lcd_data
;; This function uses a non-reentrant model
;;
psect	text409
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
	line	400
	global	__size_of_set_lcd_data
	__size_of_set_lcd_data	equ	__end_of_set_lcd_data-_set_lcd_data
	
_set_lcd_data:	
	opt	stack 4
; Regs used in _set_lcd_data: [wreg]
;set_lcd_data@uc_data stored from wreg
	movwf	(set_lcd_data@uc_data)
	line	401
	
l6023:	
;lcd.c: 401: PORTD = uc_data;
	movf	(set_lcd_data@uc_data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	402
	
l3580:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_data
	__end_of_set_lcd_data:
;; =============== function _set_lcd_data ends ============

	signat	_set_lcd_data,4216
	global	_set_lcd_rs
psect	text410,local,class=CODE,delta=2
global __ptext410
__ptext410:

;; *************** function _set_lcd_rs *****************
;; Defined at:
;;		line 380 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
;; Parameters:    Size  Location     Type
;;  b_output        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  b_output        1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_send_lcd_data
;; This function uses a non-reentrant model
;;
psect	text410
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
	line	380
	global	__size_of_set_lcd_rs
	__size_of_set_lcd_rs	equ	__end_of_set_lcd_rs-_set_lcd_rs
	
_set_lcd_rs:	
	opt	stack 4
; Regs used in _set_lcd_rs: [wreg]
;set_lcd_rs@b_output stored from wreg
	movwf	(set_lcd_rs@b_output)
	line	381
	
l6021:	
;lcd.c: 381: RA2 = b_output;
	btfsc	(set_lcd_rs@b_output),0
	goto	u2641
	goto	u2640
	
u2641:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	goto	u2654
u2640:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
u2654:
	line	382
	
l3577:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_rs
	__end_of_set_lcd_rs:
;; =============== function _set_lcd_rs ends ============

	signat	_set_lcd_rs,4216
	global	_set_lcd_e
psect	text411,local,class=CODE,delta=2
global __ptext411
__ptext411:

;; *************** function _set_lcd_e *****************
;; Defined at:
;;		line 360 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
;; Parameters:    Size  Location     Type
;;  b_output        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  b_output        1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_initialize
;;		_send_lcd_data
;; This function uses a non-reentrant model
;;
psect	text411
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\lcd.c"
	line	360
	global	__size_of_set_lcd_e
	__size_of_set_lcd_e	equ	__end_of_set_lcd_e-_set_lcd_e
	
_set_lcd_e:	
	opt	stack 4
; Regs used in _set_lcd_e: [wreg]
;set_lcd_e@b_output stored from wreg
	movwf	(set_lcd_e@b_output)
	line	361
	
l5963:	
;lcd.c: 361: RA3 = b_output;
	btfsc	(set_lcd_e@b_output),0
	goto	u2551
	goto	u2550
	
u2551:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	goto	u2564
u2550:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(43/8),(43)&7
u2564:
	line	362
	
l3574:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_e
	__end_of_set_lcd_e:
;; =============== function _set_lcd_e ends ============

	signat	_set_lcd_e,4216
	global	_adc_initialize
psect	text412,local,class=CODE,delta=2
global __ptext412
__ptext412:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text412
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 5\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l4767:	
;adc.c: 29: ADCS2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1278/8)^080h,(1278)&7
	line	30
;adc.c: 30: ADCS1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(255/8),(255)&7
	line	31
;adc.c: 31: ADCS0 = 0;
	bcf	(254/8),(254)&7
	line	34
;adc.c: 34: PCFG3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1275/8)^080h,(1275)&7
	line	35
;adc.c: 35: PCFG2 = 1;
	bsf	(1274/8)^080h,(1274)&7
	line	36
;adc.c: 36: PCFG1 = 1;
	bsf	(1273/8)^080h,(1273)&7
	line	37
;adc.c: 37: PCFG0 = 0;
	bcf	(1272/8)^080h,(1272)&7
	line	40
;adc.c: 40: ADFM = 1;
	bsf	(1279/8)^080h,(1279)&7
	line	43
;adc.c: 43: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(248/8),(248)&7
	line	44
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_adc_initialize
	__end_of_adc_initialize:
;; =============== function _adc_initialize ends ============

	signat	_adc_initialize,88
psect	text413,local,class=CODE,delta=2
global __ptext413
__ptext413:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
