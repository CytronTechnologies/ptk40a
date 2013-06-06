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
# 34 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
	psect config,class=CONFIG,delta=2 ;#
# 34 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_seg7_initialize
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_beep
	FNCALL	_main,_lcd_putstr
	FNCALL	_main,_lcd_2ndline
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_c_wait_keypad
	FNCALL	_main,_c_key_to_ASCII
	FNCALL	_main,_lcd_putchar
	FNCALL	_lcd_putstr,_lcd_2ndline
	FNCALL	_lcd_putstr,_lcd_putchar
	FNCALL	_lcd_initialize,_set_lcd_e
	FNCALL	_lcd_initialize,_send_lcd_data
	FNCALL	_lcd_initialize,_lcd_clear
	FNCALL	_beep,_delay_ms
	FNCALL	_lcd_putchar,_send_lcd_data
	FNCALL	_lcd_goto,_send_lcd_data
	FNCALL	_lcd_2ndline,_send_lcd_data
	FNCALL	_lcd_clear,_send_lcd_data
	FNCALL	_c_wait_keypad,_c_read_keypad
	FNCALL	_send_lcd_data,_set_lcd_rs
	FNCALL	_send_lcd_data,_set_lcd_data
	FNCALL	_send_lcd_data,_set_lcd_e
	FNROOT	_main
	global	lcd_bcd@F1131
	global	_ADRESH
psect	text373,local,class=CODE,delta=2
global __ptext373
__ptext373:
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
	global	_RA1
_RA1	set	41
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
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	67	;'C'
	retlw	121	;'y'
	retlw	116	;'t'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	84	;'T'
	retlw	75	;'K'
	retlw	52	;'4'
	retlw	48	;'0'
	retlw	65	;'A'
	retlw	0
psect	strings
	
STR_2:	
	retlw	75	;'K'
	retlw	101	;'e'
	retlw	121	;'y'
	retlw	112	;'p'
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	58	;':'
	retlw	0
psect	strings
	file	"Example6.as"
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
	global	?_beep
?_beep:	; 0 bytes @ 0x0
	global	?_adc_initialize
?_adc_initialize:	; 0 bytes @ 0x0
	global	??_adc_initialize
??_adc_initialize:	; 0 bytes @ 0x0
	global	?_seg7_initialize
?_seg7_initialize:	; 0 bytes @ 0x0
	global	??_seg7_initialize
??_seg7_initialize:	; 0 bytes @ 0x0
	global	??_c_read_keypad
??_c_read_keypad:	; 0 bytes @ 0x0
	global	??_c_key_to_ASCII
??_c_key_to_ASCII:	; 0 bytes @ 0x0
	global	?_lcd_initialize
?_lcd_initialize:	; 0 bytes @ 0x0
	global	?_lcd_2ndline
?_lcd_2ndline:	; 0 bytes @ 0x0
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_lcd_putchar
?_lcd_putchar:	; 0 bytes @ 0x0
	global	?_lcd_putstr
?_lcd_putstr:	; 0 bytes @ 0x0
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_c_read_keypad
?_c_read_keypad:	; 1 bytes @ 0x0
	global	?_c_key_to_ASCII
?_c_key_to_ASCII:	; 1 bytes @ 0x0
	global	?_c_wait_keypad
?_c_wait_keypad:	; 1 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	c_key_to_ASCII@key_number
c_key_to_ASCII@key_number:	; 1 bytes @ 0x0
	global	set_lcd_e@b_output
set_lcd_e@b_output:	; 1 bytes @ 0x0
	global	set_lcd_rs@b_output
set_lcd_rs@b_output:	; 1 bytes @ 0x0
	global	set_lcd_data@uc_data
set_lcd_data@uc_data:	; 1 bytes @ 0x0
	global	delay_ms@ui_value
delay_ms@ui_value:	; 2 bytes @ 0x0
	ds	1
	global	?_send_lcd_data
?_send_lcd_data:	; 0 bytes @ 0x1
	global	??_c_wait_keypad
??_c_wait_keypad:	; 0 bytes @ 0x1
	global	send_lcd_data@uc_data
send_lcd_data@uc_data:	; 1 bytes @ 0x1
	ds	1
	global	??_send_lcd_data
??_send_lcd_data:	; 0 bytes @ 0x2
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	c_wait_keypad@c_pressed_key
c_wait_keypad@c_pressed_key:	; 1 bytes @ 0x2
	ds	2
	global	??_beep
??_beep:	; 0 bytes @ 0x4
	global	send_lcd_data@b_rs
send_lcd_data@b_rs:	; 1 bytes @ 0x4
	global	beep@uc_count
beep@uc_count:	; 1 bytes @ 0x4
	ds	1
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x5
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x5
	global	??_lcd_2ndline
??_lcd_2ndline:	; 0 bytes @ 0x5
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x5
	global	??_lcd_putchar
??_lcd_putchar:	; 0 bytes @ 0x5
	ds	1
	global	lcd_goto@uc_position
lcd_goto@uc_position:	; 1 bytes @ 0x6
	global	lcd_putchar@c_data
lcd_putchar@c_data:	; 1 bytes @ 0x6
	ds	1
	global	??_lcd_putstr
??_lcd_putstr:	; 0 bytes @ 0x7
	ds	1
	global	lcd_putstr@csz_string
lcd_putstr@csz_string:	; 1 bytes @ 0x8
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x9
	global	main@value
main@value:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 22, constant 0, data 0, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      10
;; BANK0           80      0      10
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_putstr@csz_string	PTR const unsigned char  size(1) Largest target is 14
;;		 -> STR_2(CODE[8]), STR_1(CODE[14]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_putstr
;;   _lcd_putstr->_lcd_putchar
;;   _lcd_initialize->_send_lcd_data
;;   _beep->_delay_ms
;;   _lcd_putchar->_send_lcd_data
;;   _lcd_goto->_send_lcd_data
;;   _lcd_2ndline->_send_lcd_data
;;   _lcd_clear->_send_lcd_data
;;   _c_wait_keypad->_c_read_keypad
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
;; (0) _main                                                 1     1      0    1128
;;                                              9 COMMON     1     1      0
;;                     _adc_initialize
;;                    _seg7_initialize
;;                     _lcd_initialize
;;                               _beep
;;                         _lcd_putstr
;;                        _lcd_2ndline
;;                           _lcd_goto
;;                      _c_wait_keypad
;;                     _c_key_to_ASCII
;;                        _lcd_putchar
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putstr                                           2     2      0     331
;;                                              7 COMMON     2     2      0
;;                        _lcd_2ndline
;;                        _lcd_putchar
;; ---------------------------------------------------------------------------------
;; (1) _lcd_initialize                                       2     2      0     242
;;                                              5 COMMON     2     2      0
;;                          _set_lcd_e
;;                      _send_lcd_data
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 1     1      0      30
;;                                              4 COMMON     1     1      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putchar                                          2     2      0     132
;;                                              5 COMMON     2     2      0
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     2      0     132
;;                                              5 COMMON     2     2      0
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_2ndline                                          1     1      0     110
;;                                              5 COMMON     1     1      0
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_clear                                            0     0      0     110
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _c_wait_keypad                                        2     2      0      30
;;                                              1 COMMON     2     2      0
;;                      _c_read_keypad
;; ---------------------------------------------------------------------------------
;; (2) _delay_ms                                             4     2      2      15
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (2) _send_lcd_data                                        4     3      1     110
;;                                              1 COMMON     4     3      1
;;                         _set_lcd_rs
;;                       _set_lcd_data
;;                          _set_lcd_e
;; ---------------------------------------------------------------------------------
;; (2) _c_read_keypad                                        1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _seg7_initialize                                      2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _set_lcd_data                                         1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _set_lcd_rs                                           1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _set_lcd_e                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _c_key_to_ASCII                                       1     1      0     120
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _adc_initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
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
;;   _lcd_putstr
;;     _lcd_2ndline
;;       _send_lcd_data
;;         _set_lcd_rs
;;         _set_lcd_data
;;         _set_lcd_e
;;     _lcd_putchar
;;       _send_lcd_data
;;         _set_lcd_rs
;;         _set_lcd_data
;;         _set_lcd_e
;;   _lcd_2ndline
;;     _send_lcd_data
;;       _set_lcd_rs
;;       _set_lcd_data
;;       _set_lcd_e
;;   _lcd_goto
;;     _send_lcd_data
;;       _set_lcd_rs
;;       _set_lcd_data
;;       _set_lcd_e
;;   _c_wait_keypad
;;     _c_read_keypad
;;   _c_key_to_ASCII
;;   _lcd_putchar
;;     _send_lcd_data
;;       _set_lcd_rs
;;       _set_lcd_data
;;       _set_lcd_e
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      14       3        0.0%
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
;;DATA                 0      0      18      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 59 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  3569[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;;		_lcd_putstr
;;		_lcd_2ndline
;;		_lcd_goto
;;		_c_wait_keypad
;;		_c_key_to_ASCII
;;		_lcd_putchar
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
	line	59
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	60
	
l6133:	
;Main E_6.c: 60: unsigned char value = 0;
	clrf	(main@value)
	line	62
	
l6135:	
;Main E_6.c: 62: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	63
;Main E_6.c: 63: PORTB = 0;
	clrf	(6)	;volatile
	line	64
;Main E_6.c: 64: PORTC = 0;
	clrf	(7)	;volatile
	line	65
;Main E_6.c: 65: PORTD = 0;
	clrf	(8)	;volatile
	line	66
;Main E_6.c: 66: PORTE = 0;
	clrf	(9)	;volatile
	line	72
	
l6137:	
;Main E_6.c: 72: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	73
	
l6139:	
;Main E_6.c: 73: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	74
	
l6141:	
;Main E_6.c: 74: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	75
	
l6143:	
;Main E_6.c: 75: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	76
	
l6145:	
;Main E_6.c: 76: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	79
	
l6147:	
;Main E_6.c: 79: adc_initialize();
	fcall	_adc_initialize
	line	82
	
l6149:	
;Main E_6.c: 82: seg7_initialize();
	fcall	_seg7_initialize
	line	85
	
l6151:	
;Main E_6.c: 85: lcd_initialize();
	fcall	_lcd_initialize
	line	87
	
l6153:	
;Main E_6.c: 87: beep(2);
	movlw	(02h)
	fcall	_beep
	line	94
	
l6155:	
;Main E_6.c: 94: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	96
	
l6157:	
;Main E_6.c: 96: lcd_putstr("Cytron PTK40A");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_putstr
	line	97
	
l6159:	
;Main E_6.c: 97: lcd_2ndline();
	fcall	_lcd_2ndline
	line	98
	
l6161:	
;Main E_6.c: 98: lcd_putstr("Keypad:");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_putstr
	goto	l6163
	line	100
;Main E_6.c: 100: while(1)
	
l3570:	
	line	102
	
l6163:	
;Main E_6.c: 101: {
;Main E_6.c: 102: lcd_goto(0x47);
	movlw	(047h)
	fcall	_lcd_goto
	line	103
	
l6165:	
;Main E_6.c: 103: lcd_putchar(c_key_to_ASCII(c_wait_keypad()));
	fcall	_c_wait_keypad
	fcall	_c_key_to_ASCII
	fcall	_lcd_putchar
	goto	l6163
	line	105
	
l3571:	
	line	100
	goto	l6163
	
l3572:	
	goto	l3574
	line	106
;Main E_6.c: 105: }
;Main E_6.c: 106: while(1) continue;
	
l3573:	
	
l3574:	
	goto	l3574
	
l3575:	
	line	107
	
l3576:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd_putstr
psect	text374,local,class=CODE,delta=2
global __ptext374
__ptext374:

;; *************** function _lcd_putstr *****************
;; Defined at:
;;		line 261 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
;; Parameters:    Size  Location     Type
;;  csz_string      1    wreg     PTR const unsigned char 
;;		 -> STR_2(8), STR_1(14), 
;; Auto vars:     Size  Location     Type
;;  csz_string      1    8[COMMON] PTR const unsigned char 
;;		 -> STR_2(8), STR_1(14), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_2ndline
;;		_lcd_putchar
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text374
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	261
	global	__size_of_lcd_putstr
	__size_of_lcd_putstr	equ	__end_of_lcd_putstr-_lcd_putstr
	
_lcd_putstr:	
	opt	stack 4
; Regs used in _lcd_putstr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_putstr@csz_string stored from wreg
	movwf	(lcd_putstr@csz_string)
	line	263
	
l6119:	
;lcd.c: 263: while (*csz_string != '\0') {
	goto	l6131
	
l2837:	
	line	266
	
l6121:	
;lcd.c: 266: if (*csz_string == '\n' || *csz_string == '\r') {
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0Ah
	skipnz
	goto	u2831
	goto	u2830
u2831:
	goto	l6125
u2830:
	
l6123:	
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0Dh
	skipz
	goto	u2841
	goto	u2840
u2841:
	goto	l6127
u2840:
	goto	l6125
	
l2840:	
	line	267
	
l6125:	
;lcd.c: 267: lcd_2ndline();
	fcall	_lcd_2ndline
	line	268
;lcd.c: 268: }
	goto	l6129
	line	271
	
l2838:	
	line	272
	
l6127:	
;lcd.c: 271: else {
;lcd.c: 272: lcd_putchar(*csz_string);
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_putchar
	goto	l6129
	line	273
	
l2841:	
	line	276
	
l6129:	
;lcd.c: 273: }
;lcd.c: 276: csz_string++;
	movlw	(01h)
	movwf	(??_lcd_putstr+0)+0
	movf	(??_lcd_putstr+0)+0,w
	addwf	(lcd_putstr@csz_string),f
	goto	l6131
	line	277
	
l2836:	
	line	263
	
l6131:	
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2851
	goto	u2850
u2851:
	goto	l6121
u2850:
	goto	l2843
	
l2842:	
	line	278
	
l2843:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putstr
	__end_of_lcd_putstr:
;; =============== function _lcd_putstr ends ============

	signat	_lcd_putstr,4216
	global	_lcd_initialize
psect	text375,local,class=CODE,delta=2
global __ptext375
__ptext375:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 103 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
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
psect	text375
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	103
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 4
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	106
	
l6107:	
;lcd.c: 106: set_lcd_e(1);
	movlw	(01h)
	fcall	_set_lcd_e
	line	107
	
l6109:	
;lcd.c: 107: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
movwf	((??_lcd_initialize+0)+0+1),f
	movlw	101
movwf	((??_lcd_initialize+0)+0),f
u2867:
	decfsz	((??_lcd_initialize+0)+0),f
	goto	u2867
	decfsz	((??_lcd_initialize+0)+0+1),f
	goto	u2867
	nop2
opt asmopt_on

	line	110
	
l6111:	
;lcd.c: 110: send_lcd_data(0, 0b00100000 | 0b00010000 | 0b00001000 | 0b00000000);
	movlw	(038h)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	114
	
l6113:	
;lcd.c: 114: send_lcd_data(0, 0b00000100 | 0b00000010 | 0b00000000);
	movlw	(06h)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	117
	
l6115:	
;lcd.c: 117: send_lcd_data(0, 0b00001000 | 0b00000100 | 0b00000000 | 0b00000000);
	movlw	(0Ch)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	120
	
l6117:	
;lcd.c: 120: lcd_clear();
	fcall	_lcd_clear
	line	121
	
l2815:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_beep
psect	text376,local,class=CODE,delta=2
global __ptext376
__ptext376:

;; *************** function _beep *****************
;; Defined at:
;;		line 143 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
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
psect	text376
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
	line	143
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 6
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@uc_count stored from wreg
	movwf	(beep@uc_count)
	line	144
	
l5915:	
;Main E_6.c: 144: while (uc_count-- > 0) {
	goto	l5921
	
l3586:	
	line	145
;Main E_6.c: 145: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	146
	
l5917:	
;Main E_6.c: 146: delay_ms(80);
	movlw	low(050h)
	movwf	(?_delay_ms)
	movlw	high(050h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	147
	
l5919:	
;Main E_6.c: 147: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	148
;Main E_6.c: 148: delay_ms(100);
	movlw	low(064h)
	movwf	(?_delay_ms)
	movlw	high(064h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l5921
	line	149
	
l3585:	
	line	144
	
l5921:	
	movlw	low(01h)
	subwf	(beep@uc_count),f
	movf	((beep@uc_count)),w
	xorlw	0FFh
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l3586
u2580:
	goto	l3588
	
l3587:	
	line	150
	
l3588:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,4216
	global	_lcd_putchar
psect	text377,local,class=CODE,delta=2
global __ptext377
__ptext377:

;; *************** function _lcd_putchar *****************
;; Defined at:
;;		line 240 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
;; Parameters:    Size  Location     Type
;;  c_data          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c_data          1    6[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send_lcd_data
;; This function is called by:
;;		_lcd_putstr
;;		_main
;;		_lcd_bcd
;; This function uses a non-reentrant model
;;
psect	text377
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	240
	global	__size_of_lcd_putchar
	__size_of_lcd_putchar	equ	__end_of_lcd_putchar-_lcd_putchar
	
_lcd_putchar:	
	opt	stack 5
; Regs used in _lcd_putchar: [wreg+status,2+status,0+pclath+cstack]
;lcd_putchar@c_data stored from wreg
	line	242
	movwf	(lcd_putchar@c_data)
	
l6105:	
;lcd.c: 242: send_lcd_data(1, (unsigned char)c_data);
	movf	(lcd_putchar@c_data),w
	movwf	(??_lcd_putchar+0)+0
	movf	(??_lcd_putchar+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(01h)
	fcall	_send_lcd_data
	line	243
	
l2833:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putchar
	__end_of_lcd_putchar:
;; =============== function _lcd_putchar ends ============

	signat	_lcd_putchar,4216
	global	_lcd_goto
psect	text378,local,class=CODE,delta=2
global __ptext378
__ptext378:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 219 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
;; Parameters:    Size  Location     Type
;;  uc_position     1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uc_position     1    6[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text378
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	219
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 5
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@uc_position stored from wreg
	line	221
	movwf	(lcd_goto@uc_position)
	
l6103:	
;lcd.c: 221: send_lcd_data(0, 0b10000000 | uc_position);
	movf	(lcd_goto@uc_position),w
	iorlw	080h
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	222
	
l2830:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_lcd_2ndline
psect	text379,local,class=CODE,delta=2
global __ptext379
__ptext379:

;; *************** function _lcd_2ndline *****************
;; Defined at:
;;		line 198 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
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
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_send_lcd_data
;; This function is called by:
;;		_lcd_putstr
;;		_main
;; This function uses a non-reentrant model
;;
psect	text379
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	198
	global	__size_of_lcd_2ndline
	__size_of_lcd_2ndline	equ	__end_of_lcd_2ndline-_lcd_2ndline
	
_lcd_2ndline:	
	opt	stack 5
; Regs used in _lcd_2ndline: [wreg+status,2+status,0+pclath+cstack]
	line	200
	
l6101:	
;lcd.c: 200: send_lcd_data(0, 0b10000000 | 0x40);
	movlw	(0C0h)
	movwf	(??_lcd_2ndline+0)+0
	movf	(??_lcd_2ndline+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	201
	
l2827:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_2ndline
	__end_of_lcd_2ndline:
;; =============== function _lcd_2ndline ends ============

	signat	_lcd_2ndline,88
	global	_lcd_clear
psect	text380,local,class=CODE,delta=2
global __ptext380
__ptext380:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 156 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
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
psect	text380
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	156
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 4
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	158
	
l6099:	
;lcd.c: 158: send_lcd_data(0, 0b00000001);
	clrf	(?_send_lcd_data)
	bsf	status,0
	rlf	(?_send_lcd_data),f
	movlw	(0)
	fcall	_send_lcd_data
	line	159
	
l2821:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_c_wait_keypad
psect	text381,local,class=CODE,delta=2
global __ptext381
__ptext381:

;; *************** function _c_wait_keypad *****************
;; Defined at:
;;		line 116 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\keypad.c"
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
psect	text381
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\keypad.c"
	line	116
	global	__size_of_c_wait_keypad
	__size_of_c_wait_keypad	equ	__end_of_c_wait_keypad-_c_wait_keypad
	
_c_wait_keypad:	
	opt	stack 6
; Regs used in _c_wait_keypad: [wreg+pclath+cstack]
	line	118
	
l5895:	
;keypad.c: 118: unsigned char c_pressed_key = 0xFF;
	movlw	(0FFh)
	movwf	(??_c_wait_keypad+0)+0
	movf	(??_c_wait_keypad+0)+0,w
	movwf	(c_wait_keypad@c_pressed_key)
	goto	l5897
	line	121
;keypad.c: 121: do {
	
l2113:	
	line	122
	
l5897:	
;keypad.c: 122: c_pressed_key = c_read_keypad();
	fcall	_c_read_keypad
	movwf	(??_c_wait_keypad+0)+0
	movf	(??_c_wait_keypad+0)+0,w
	movwf	(c_wait_keypad@c_pressed_key)
	line	124
	
l5899:	
;keypad.c: 123: }
;keypad.c: 124: while (c_pressed_key == 0xFF);
	movf	(c_wait_keypad@c_pressed_key),w
	xorlw	0FFh
	skipnz
	goto	u2561
	goto	u2560
u2561:
	goto	l5897
u2560:
	goto	l5901
	
l2114:	
	line	127
;keypad.c: 127: while (c_read_keypad() != 0xFF);
	goto	l5901
	
l2116:	
	goto	l5901
	
l2115:	
	
l5901:	
	fcall	_c_read_keypad
	xorlw	0FFh
	skipz
	goto	u2571
	goto	u2570
u2571:
	goto	l5901
u2570:
	goto	l5903
	
l2117:	
	line	129
	
l5903:	
;keypad.c: 129: return c_pressed_key;
	movf	(c_wait_keypad@c_pressed_key),w
	goto	l2118
	
l5905:	
	line	130
	
l2118:	
	return
	opt stack 0
GLOBAL	__end_of_c_wait_keypad
	__end_of_c_wait_keypad:
;; =============== function _c_wait_keypad ends ============

	signat	_c_wait_keypad,89
	global	_delay_ms
psect	text382,local,class=CODE,delta=2
global __ptext382
__ptext382:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 123 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
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
psect	text382
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\Main E_6.c"
	line	123
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 6
; Regs used in _delay_ms: [wreg]
	line	124
	
l5891:	
;Main E_6.c: 124: while (ui_value-- > 0) {
	goto	l3579
	
l3580:	
	line	125
	
l5893:	
;Main E_6.c: 125: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay_ms+0)+0+1),f
	movlw	125
movwf	((??_delay_ms+0)+0),f
u2877:
	decfsz	((??_delay_ms+0)+0),f
	goto	u2877
	decfsz	((??_delay_ms+0)+0+1),f
	goto	u2877
opt asmopt_on

	line	126
	
l3579:	
	line	124
	movlw	low(01h)
	subwf	(delay_ms@ui_value),f
	movlw	high(01h)
	skipc
	decf	(delay_ms@ui_value+1),f
	subwf	(delay_ms@ui_value+1),f
	movlw	high(0FFFFh)
	xorwf	((delay_ms@ui_value+1)),w
	skipz
	goto	u2555
	movlw	low(0FFFFh)
	xorwf	((delay_ms@ui_value)),w
u2555:

	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l5893
u2550:
	goto	l3582
	
l3581:	
	line	127
	
l3582:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_send_lcd_data
psect	text383,local,class=CODE,delta=2
global __ptext383
__ptext383:

;; *************** function _send_lcd_data *****************
;; Defined at:
;;		line 328 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
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
;;		_lcd_2ndline
;;		_lcd_goto
;;		_lcd_putchar
;;		_lcd_config
;;		_lcd_home
;; This function uses a non-reentrant model
;;
psect	text383
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	328
	global	__size_of_send_lcd_data
	__size_of_send_lcd_data	equ	__end_of_send_lcd_data-_send_lcd_data
	
_send_lcd_data:	
	opt	stack 5
; Regs used in _send_lcd_data: [wreg+status,2+status,0+pclath+cstack]
;send_lcd_data@b_rs stored from wreg
	line	330
	movwf	(send_lcd_data@b_rs)
	
l6089:	
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
	
l6091:	
;lcd.c: 335: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_send_lcd_data+0)+0+1),f
	movlw	125
movwf	((??_send_lcd_data+0)+0),f
u2887:
	decfsz	((??_send_lcd_data+0)+0),f
	goto	u2887
	decfsz	((??_send_lcd_data+0)+0+1),f
	goto	u2887
opt asmopt_on

	line	336
	
l6093:	
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
u2897:
	decfsz	((??_send_lcd_data+0)+0),f
	goto	u2897
	decfsz	((??_send_lcd_data+0)+0+1),f
	goto	u2897
	nop2
opt asmopt_on

	line	340
	
l6095:	
;lcd.c: 340: set_lcd_rs(0);
	movlw	(0)
	fcall	_set_lcd_rs
	line	341
	
l6097:	
;lcd.c: 341: set_lcd_data(0);
	movlw	(0)
	fcall	_set_lcd_data
	line	342
	
l2854:	
	return
	opt stack 0
GLOBAL	__end_of_send_lcd_data
	__end_of_send_lcd_data:
;; =============== function _send_lcd_data ends ============

	signat	_send_lcd_data,8312
	global	_c_read_keypad
psect	text384,local,class=CODE,delta=2
global __ptext384
__ptext384:

;; *************** function _c_read_keypad *****************
;; Defined at:
;;		line 29 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\keypad.c"
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
psect	text384
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\keypad.c"
	line	29
	global	__size_of_c_read_keypad
	__size_of_c_read_keypad	equ	__end_of_c_read_keypad-_c_read_keypad
	
_c_read_keypad:	
	opt	stack 6
; Regs used in _c_read_keypad: [wreg]
	line	31
	
l5795:	
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
	
l5797:	
;keypad.c: 35: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2907:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2907
	nop2	;nop
opt asmopt_on

	line	36
	
l5799:	
;keypad.c: 36: if (RB0 == 0) return 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l2084
u2390:
	
l5801:	
	movlw	(01h)
	goto	l2085
	
l5803:	
	goto	l2085
	
l2084:	
	line	37
;keypad.c: 37: if (RB1 == 0) return 2;
	btfsc	(49/8),(49)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l2086
u2400:
	
l5805:	
	movlw	(02h)
	goto	l2085
	
l5807:	
	goto	l2085
	
l2086:	
	line	38
;keypad.c: 38: if (RB2 == 0) return 3;
	btfsc	(50/8),(50)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2087
u2410:
	
l5809:	
	movlw	(03h)
	goto	l2085
	
l5811:	
	goto	l2085
	
l2087:	
	line	39
;keypad.c: 39: if (RB3 == 0) return 10;
	btfsc	(51/8),(51)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l2088
u2420:
	
l5813:	
	movlw	(0Ah)
	goto	l2085
	
l5815:	
	goto	l2085
	
l2088:	
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
	
l5817:	
;keypad.c: 45: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2917:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2917
	nop2	;nop
opt asmopt_on

	line	46
	
l5819:	
;keypad.c: 46: if (RB0 == 0) return 4;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l2089
u2430:
	
l5821:	
	movlw	(04h)
	goto	l2085
	
l5823:	
	goto	l2085
	
l2089:	
	line	47
;keypad.c: 47: if (RB1 == 0) return 5;
	btfsc	(49/8),(49)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l2090
u2440:
	
l5825:	
	movlw	(05h)
	goto	l2085
	
l5827:	
	goto	l2085
	
l2090:	
	line	48
;keypad.c: 48: if (RB2 == 0) return 6;
	btfsc	(50/8),(50)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l2091
u2450:
	
l5829:	
	movlw	(06h)
	goto	l2085
	
l5831:	
	goto	l2085
	
l2091:	
	line	49
;keypad.c: 49: if (RB3 == 0) return 11;
	btfsc	(51/8),(51)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l2092
u2460:
	
l5833:	
	movlw	(0Bh)
	goto	l2085
	
l5835:	
	goto	l2085
	
l2092:	
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
	
l5837:	
;keypad.c: 55: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2927:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2927
	nop2	;nop
opt asmopt_on

	line	56
	
l5839:	
;keypad.c: 56: if (RB0 == 0) return 7;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l2093
u2470:
	
l5841:	
	movlw	(07h)
	goto	l2085
	
l5843:	
	goto	l2085
	
l2093:	
	line	57
;keypad.c: 57: if (RB1 == 0) return 8;
	btfsc	(49/8),(49)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l2094
u2480:
	
l5845:	
	movlw	(08h)
	goto	l2085
	
l5847:	
	goto	l2085
	
l2094:	
	line	58
;keypad.c: 58: if (RB2 == 0) return 9;
	btfsc	(50/8),(50)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l2095
u2490:
	
l5849:	
	movlw	(09h)
	goto	l2085
	
l5851:	
	goto	l2085
	
l2095:	
	line	59
;keypad.c: 59: if (RB3 == 0) return 12;
	btfsc	(51/8),(51)&7
	goto	u2501
	goto	u2500
u2501:
	goto	l2096
u2500:
	
l5853:	
	movlw	(0Ch)
	goto	l2085
	
l5855:	
	goto	l2085
	
l2096:	
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
	
l5857:	
;keypad.c: 65: _delay((unsigned long)((30)*(20000000/4000000.0)));
	opt asmopt_off
movlw	49
movwf	(??_c_read_keypad+0)+0,f
u2937:
decfsz	(??_c_read_keypad+0)+0,f
	goto	u2937
	nop2	;nop
opt asmopt_on

	line	66
	
l5859:	
;keypad.c: 66: if (RB0 == 0) return 14;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l2097
u2510:
	
l5861:	
	movlw	(0Eh)
	goto	l2085
	
l5863:	
	goto	l2085
	
l2097:	
	line	67
;keypad.c: 67: if (RB1 == 0) return 0;
	btfsc	(49/8),(49)&7
	goto	u2521
	goto	u2520
u2521:
	goto	l2098
u2520:
	
l5865:	
	movlw	(0)
	goto	l2085
	
l5867:	
	goto	l2085
	
l2098:	
	line	68
;keypad.c: 68: if (RB2 == 0) return 15;
	btfsc	(50/8),(50)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l2099
u2530:
	
l5869:	
	movlw	(0Fh)
	goto	l2085
	
l5871:	
	goto	l2085
	
l2099:	
	line	69
;keypad.c: 69: if (RB3 == 0) return 13;
	btfsc	(51/8),(51)&7
	goto	u2541
	goto	u2540
u2541:
	goto	l5877
u2540:
	
l5873:	
	movlw	(0Dh)
	goto	l2085
	
l5875:	
	goto	l2085
	
l2100:	
	line	71
	
l5877:	
;keypad.c: 71: return 0xFF;
	movlw	(0FFh)
	goto	l2085
	
l5879:	
	line	72
	
l2085:	
	return
	opt stack 0
GLOBAL	__end_of_c_read_keypad
	__end_of_c_read_keypad:
;; =============== function _c_read_keypad ends ============

	signat	_c_read_keypad,89
	global	_seg7_initialize
psect	text385,local,class=CODE,delta=2
global __ptext385
__ptext385:

;; *************** function _seg7_initialize *****************
;; Defined at:
;;		line 52 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\seg7.c"
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
psect	text385
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\seg7.c"
	line	52
	global	__size_of_seg7_initialize
	__size_of_seg7_initialize	equ	__end_of_seg7_initialize-_seg7_initialize
	
_seg7_initialize:	
	opt	stack 7
; Regs used in _seg7_initialize: [wreg+status,2]
	line	53
	
l5783:	
;seg7.c: 53: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	54
;seg7.c: 54: RE0 = 0;
	bcf	(72/8),(72)&7
	line	55
	
l5785:	
;seg7.c: 55: PORTD = (PORTD & 0xf0) | 0x0A;
	movf	(8),w
	andlw	0F0h
	iorlw	0Ah
	movwf	(8)	;volatile
	line	56
	
l5787:	
;seg7.c: 56: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_initialize+0)+0+1),f
	movlw	125
movwf	((??_seg7_initialize+0)+0),f
u2947:
	decfsz	((??_seg7_initialize+0)+0),f
	goto	u2947
	decfsz	((??_seg7_initialize+0)+0+1),f
	goto	u2947
opt asmopt_on

	line	57
	
l5789:	
;seg7.c: 57: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	58
	
l5791:	
;seg7.c: 58: RE0 = 1;
	bsf	(72/8),(72)&7
	line	59
	
l5793:	
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
	global	_set_lcd_data
psect	text386,local,class=CODE,delta=2
global __ptext386
__ptext386:

;; *************** function _set_lcd_data *****************
;; Defined at:
;;		line 400 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
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
psect	text386
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	400
	global	__size_of_set_lcd_data
	__size_of_set_lcd_data	equ	__end_of_set_lcd_data-_set_lcd_data
	
_set_lcd_data:	
	opt	stack 5
; Regs used in _set_lcd_data: [wreg]
;set_lcd_data@uc_data stored from wreg
	movwf	(set_lcd_data@uc_data)
	line	401
	
l6039:	
;lcd.c: 401: PORTD = uc_data;
	movf	(set_lcd_data@uc_data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	402
	
l2863:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_data
	__end_of_set_lcd_data:
;; =============== function _set_lcd_data ends ============

	signat	_set_lcd_data,4216
	global	_set_lcd_rs
psect	text387,local,class=CODE,delta=2
global __ptext387
__ptext387:

;; *************** function _set_lcd_rs *****************
;; Defined at:
;;		line 380 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
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
psect	text387
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	380
	global	__size_of_set_lcd_rs
	__size_of_set_lcd_rs	equ	__end_of_set_lcd_rs-_set_lcd_rs
	
_set_lcd_rs:	
	opt	stack 5
; Regs used in _set_lcd_rs: [wreg]
;set_lcd_rs@b_output stored from wreg
	movwf	(set_lcd_rs@b_output)
	line	381
	
l6037:	
;lcd.c: 381: RA2 = b_output;
	btfsc	(set_lcd_rs@b_output),0
	goto	u2681
	goto	u2680
	
u2681:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	goto	u2694
u2680:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
u2694:
	line	382
	
l2860:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_rs
	__end_of_set_lcd_rs:
;; =============== function _set_lcd_rs ends ============

	signat	_set_lcd_rs,4216
	global	_set_lcd_e
psect	text388,local,class=CODE,delta=2
global __ptext388
__ptext388:

;; *************** function _set_lcd_e *****************
;; Defined at:
;;		line 360 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
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
psect	text388
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\lcd.c"
	line	360
	global	__size_of_set_lcd_e
	__size_of_set_lcd_e	equ	__end_of_set_lcd_e-_set_lcd_e
	
_set_lcd_e:	
	opt	stack 5
; Regs used in _set_lcd_e: [wreg]
;set_lcd_e@b_output stored from wreg
	movwf	(set_lcd_e@b_output)
	line	361
	
l5999:	
;lcd.c: 361: RA3 = b_output;
	btfsc	(set_lcd_e@b_output),0
	goto	u2621
	goto	u2620
	
u2621:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	goto	u2634
u2620:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(43/8),(43)&7
u2634:
	line	362
	
l2857:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_e
	__end_of_set_lcd_e:
;; =============== function _set_lcd_e ends ============

	signat	_set_lcd_e,4216
	global	_c_key_to_ASCII
psect	text389,local,class=CODE,delta=2
global __ptext389
__ptext389:

;; *************** function _c_key_to_ASCII *****************
;; Defined at:
;;		line 88 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\keypad.c"
;; Parameters:    Size  Location     Type
;;  key_number      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  key_number      1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text389
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\keypad.c"
	line	88
	global	__size_of_c_key_to_ASCII
	__size_of_c_key_to_ASCII	equ	__end_of_c_key_to_ASCII-_c_key_to_ASCII
	
_c_key_to_ASCII:	
	opt	stack 7
; Regs used in _c_key_to_ASCII: [wreg+status,2+status,0]
;c_key_to_ASCII@key_number stored from wreg
	line	90
	movwf	(c_key_to_ASCII@key_number)
	
l4825:	
;keypad.c: 90: if (key_number < 10) return key_number + 0x30;
	movlw	(0Ah)
	subwf	(c_key_to_ASCII@key_number),w
	skipnc
	goto	u31
	goto	u30
u31:
	goto	l4831
u30:
	
l4827:	
	movf	(c_key_to_ASCII@key_number),w
	addlw	030h
	goto	l2104
	
l4829:	
	goto	l2104
	
l2103:	
	line	93
	
l4831:	
;keypad.c: 93: if (key_number == 10) return 'A';
	movf	(c_key_to_ASCII@key_number),w
	xorlw	0Ah
	skipz
	goto	u41
	goto	u40
u41:
	goto	l4837
u40:
	
l4833:	
	movlw	(041h)
	goto	l2104
	
l4835:	
	goto	l2104
	
l2105:	
	line	94
	
l4837:	
;keypad.c: 94: if (key_number == 11) return 'B';
	movf	(c_key_to_ASCII@key_number),w
	xorlw	0Bh
	skipz
	goto	u51
	goto	u50
u51:
	goto	l4843
u50:
	
l4839:	
	movlw	(042h)
	goto	l2104
	
l4841:	
	goto	l2104
	
l2106:	
	line	95
	
l4843:	
;keypad.c: 95: if (key_number == 12) return 'C';
	movf	(c_key_to_ASCII@key_number),w
	xorlw	0Ch
	skipz
	goto	u61
	goto	u60
u61:
	goto	l4849
u60:
	
l4845:	
	movlw	(043h)
	goto	l2104
	
l4847:	
	goto	l2104
	
l2107:	
	line	96
	
l4849:	
;keypad.c: 96: if (key_number == 13) return 'D';
	movf	(c_key_to_ASCII@key_number),w
	xorlw	0Dh
	skipz
	goto	u71
	goto	u70
u71:
	goto	l4855
u70:
	
l4851:	
	movlw	(044h)
	goto	l2104
	
l4853:	
	goto	l2104
	
l2108:	
	line	97
	
l4855:	
;keypad.c: 97: if (key_number == 14) return '*';
	movf	(c_key_to_ASCII@key_number),w
	xorlw	0Eh
	skipz
	goto	u81
	goto	u80
u81:
	goto	l4861
u80:
	
l4857:	
	movlw	(02Ah)
	goto	l2104
	
l4859:	
	goto	l2104
	
l2109:	
	line	98
	
l4861:	
;keypad.c: 98: if (key_number == 15) return '#';
	movf	(c_key_to_ASCII@key_number),w
	xorlw	0Fh
	skipz
	goto	u91
	goto	u90
u91:
	goto	l4867
u90:
	
l4863:	
	movlw	(023h)
	goto	l2104
	
l4865:	
	goto	l2104
	
l2110:	
	line	99
	
l4867:	
;keypad.c: 99: return 0;
	movlw	(0)
	goto	l2104
	
l4869:	
	line	100
	
l2104:	
	return
	opt stack 0
GLOBAL	__end_of_c_key_to_ASCII
	__end_of_c_key_to_ASCII:
;; =============== function _c_key_to_ASCII ends ============

	signat	_c_key_to_ASCII,4217
	global	_adc_initialize
psect	text390,local,class=CODE,delta=2
global __ptext390
__ptext390:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\adc.c"
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
psect	text390
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 6\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l4775:	
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
psect	text391,local,class=CODE,delta=2
global __ptext391
__ptext391:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
