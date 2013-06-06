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
# 33 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
	psect config,class=CONFIG,delta=2 ;#
# 33 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_seg7_initialize
	FNCALL	_main,_lcd_initialize
	FNCALL	_main,_beep
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_putstr
	FNCALL	_lcd_putstr,_lcd_2ndline
	FNCALL	_lcd_putstr,_lcd_putchar
	FNCALL	_lcd_initialize,_set_lcd_e
	FNCALL	_lcd_initialize,_send_lcd_data
	FNCALL	_lcd_initialize,_lcd_clear
	FNCALL	_lcd_putchar,_send_lcd_data
	FNCALL	_lcd_2ndline,_send_lcd_data
	FNCALL	_lcd_clear,_send_lcd_data
	FNCALL	_lcd_goto,_send_lcd_data
	FNCALL	_beep,_delay_ms
	FNCALL	_send_lcd_data,_set_lcd_rs
	FNCALL	_send_lcd_data,_set_lcd_data
	FNCALL	_send_lcd_data,_set_lcd_e
	FNROOT	_main
	global	lcd_bcd@F1131
	global	_ADRESH
psect	text329,local,class=CODE,delta=2
global __ptext329
__ptext329:
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
	global	_RC2
_RC2	set	58
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
	retlw	72	;'H'
	retlw	101	;'e'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	32	;' '
	retlw	87	;'W'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	108	;'l'
	retlw	100	;'d'
	retlw	0
psect	strings
	file	"Example4.as"
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
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_lcd_putstr
?_lcd_putstr:	; 0 bytes @ 0x0
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
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_lcd_2ndline
?_lcd_2ndline:	; 0 bytes @ 0x0
	global	?_lcd_putchar
?_lcd_putchar:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
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
	global	send_lcd_data@uc_data
send_lcd_data@uc_data:	; 1 bytes @ 0x1
	ds	1
	global	??_send_lcd_data
??_send_lcd_data:	; 0 bytes @ 0x2
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	ds	2
	global	??_beep
??_beep:	; 0 bytes @ 0x4
	global	beep@uc_count
beep@uc_count:	; 1 bytes @ 0x4
	global	send_lcd_data@b_rs
send_lcd_data@b_rs:	; 1 bytes @ 0x4
	ds	1
	global	??_lcd_initialize
??_lcd_initialize:	; 0 bytes @ 0x5
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x5
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x5
	global	??_lcd_2ndline
??_lcd_2ndline:	; 0 bytes @ 0x5
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
;;Data sizes: Strings 26, constant 0, data 0, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      0      10
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_putstr@csz_string	PTR const unsigned char  size(1) Largest target is 14
;;		 -> STR_2(CODE[12]), STR_1(CODE[14]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_putstr
;;   _lcd_putstr->_lcd_putchar
;;   _lcd_initialize->_send_lcd_data
;;   _lcd_putchar->_send_lcd_data
;;   _lcd_2ndline->_send_lcd_data
;;   _lcd_clear->_send_lcd_data
;;   _lcd_goto->_send_lcd_data
;;   _beep->_delay_ms
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
;; (0) _main                                                 0     0      0     735
;;                     _adc_initialize
;;                    _seg7_initialize
;;                     _lcd_initialize
;;                               _beep
;;                           _lcd_goto
;;                         _lcd_putstr
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
;; (2) _lcd_putchar                                          2     2      0     132
;;                                              5 COMMON     2     2      0
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_2ndline                                          1     1      0     110
;;                                              5 COMMON     1     1      0
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_clear                                            0     0      0     110
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     2      0     132
;;                                              5 COMMON     2     2      0
;;                      _send_lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 1     1      0      30
;;                                              4 COMMON     1     1      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (3) _send_lcd_data                                        4     3      1     110
;;                                              1 COMMON     4     3      1
;;                         _set_lcd_rs
;;                       _set_lcd_data
;;                          _set_lcd_e
;; ---------------------------------------------------------------------------------
;; (2) _delay_ms                                             4     2      2      15
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _seg7_initialize                                      2     2      0       0
;;                                              0 COMMON     2     2      0
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
;;   _lcd_goto
;;     _send_lcd_data
;;       _set_lcd_rs
;;       _set_lcd_data
;;       _set_lcd_e
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
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      13       3        0.0%
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
;;DATA                 0      0      17      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 58 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  2095[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_adc_initialize
;;		_seg7_initialize
;;		_lcd_initialize
;;		_beep
;;		_lcd_goto
;;		_lcd_putstr
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
	line	58
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	60
	
l5254:	
;Main E_4.c: 60: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	61
;Main E_4.c: 61: PORTB = 0;
	clrf	(6)	;volatile
	line	62
;Main E_4.c: 62: PORTC = 0;
	clrf	(7)	;volatile
	line	63
;Main E_4.c: 63: PORTD = 0;
	clrf	(8)	;volatile
	line	64
;Main E_4.c: 64: PORTE = 0;
	clrf	(9)	;volatile
	line	70
	
l5256:	
;Main E_4.c: 70: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	71
	
l5258:	
;Main E_4.c: 71: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	72
	
l5260:	
;Main E_4.c: 72: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	73
	
l5262:	
;Main E_4.c: 73: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	74
	
l5264:	
;Main E_4.c: 74: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	77
	
l5266:	
;Main E_4.c: 77: adc_initialize();
	fcall	_adc_initialize
	line	80
	
l5268:	
;Main E_4.c: 80: seg7_initialize();
	fcall	_seg7_initialize
	line	83
	
l5270:	
;Main E_4.c: 83: lcd_initialize();
	fcall	_lcd_initialize
	line	86
	
l5272:	
;Main E_4.c: 86: beep (2);
	movlw	(02h)
	fcall	_beep
	line	88
	
l5274:	
;Main E_4.c: 88: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	95
;Main E_4.c: 95: while (RB0 == 1) continue;
	goto	l2096
	
l2097:	
	
l2096:	
	btfsc	(48/8),(48)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l2096
u2620:
	goto	l5276
	
l2098:	
	line	97
	
l5276:	
;Main E_4.c: 97: lcd_goto(0x01);
	movlw	(01h)
	fcall	_lcd_goto
	line	98
	
l5278:	
;Main E_4.c: 98: lcd_putstr("Cytron PTK40A");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_putstr
	line	99
	
l5280:	
;Main E_4.c: 99: lcd_goto(0x42);
	movlw	(042h)
	fcall	_lcd_goto
	line	100
;Main E_4.c: 100: lcd_putstr("Hello World");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_putstr
	goto	l2100
	line	102
;Main E_4.c: 102: while(1) continue;
	
l2099:	
	
l2100:	
	goto	l2100
	
l2101:	
	line	103
	
l2102:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd_putstr
psect	text330,local,class=CODE,delta=2
global __ptext330
__ptext330:

;; *************** function _lcd_putstr *****************
;; Defined at:
;;		line 261 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
;; Parameters:    Size  Location     Type
;;  csz_string      1    wreg     PTR const unsigned char 
;;		 -> STR_2(12), STR_1(14), 
;; Auto vars:     Size  Location     Type
;;  csz_string      1    8[COMMON] PTR const unsigned char 
;;		 -> STR_2(12), STR_1(14), 
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
psect	text330
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	261
	global	__size_of_lcd_putstr
	__size_of_lcd_putstr	equ	__end_of_lcd_putstr-_lcd_putstr
	
_lcd_putstr:	
	opt	stack 4
; Regs used in _lcd_putstr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_putstr@csz_string stored from wreg
	movwf	(lcd_putstr@csz_string)
	line	263
	
l5240:	
;lcd.c: 263: while (*csz_string != '\0') {
	goto	l5252
	
l2833:	
	line	266
	
l5242:	
;lcd.c: 266: if (*csz_string == '\n' || *csz_string == '\r') {
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0Ah
	skipnz
	goto	u2591
	goto	u2590
u2591:
	goto	l5246
u2590:
	
l5244:	
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0Dh
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l5248
u2600:
	goto	l5246
	
l2836:	
	line	267
	
l5246:	
;lcd.c: 267: lcd_2ndline();
	fcall	_lcd_2ndline
	line	268
;lcd.c: 268: }
	goto	l5250
	line	271
	
l2834:	
	line	272
	
l5248:	
;lcd.c: 271: else {
;lcd.c: 272: lcd_putchar(*csz_string);
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_putchar
	goto	l5250
	line	273
	
l2837:	
	line	276
	
l5250:	
;lcd.c: 273: }
;lcd.c: 276: csz_string++;
	movlw	(01h)
	movwf	(??_lcd_putstr+0)+0
	movf	(??_lcd_putstr+0)+0,w
	addwf	(lcd_putstr@csz_string),f
	goto	l5252
	line	277
	
l2832:	
	line	263
	
l5252:	
	movf	(lcd_putstr@csz_string),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2611
	goto	u2610
u2611:
	goto	l5242
u2610:
	goto	l2839
	
l2838:	
	line	278
	
l2839:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putstr
	__end_of_lcd_putstr:
;; =============== function _lcd_putstr ends ============

	signat	_lcd_putstr,4216
	global	_lcd_initialize
psect	text331,local,class=CODE,delta=2
global __ptext331
__ptext331:

;; *************** function _lcd_initialize *****************
;; Defined at:
;;		line 103 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
psect	text331
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	103
	global	__size_of_lcd_initialize
	__size_of_lcd_initialize	equ	__end_of_lcd_initialize-_lcd_initialize
	
_lcd_initialize:	
	opt	stack 4
; Regs used in _lcd_initialize: [wreg+status,2+status,0+pclath+cstack]
	line	106
	
l5228:	
;lcd.c: 106: set_lcd_e(1);
	movlw	(01h)
	fcall	_set_lcd_e
	line	107
	
l5230:	
;lcd.c: 107: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
movwf	((??_lcd_initialize+0)+0+1),f
	movlw	101
movwf	((??_lcd_initialize+0)+0),f
u2637:
	decfsz	((??_lcd_initialize+0)+0),f
	goto	u2637
	decfsz	((??_lcd_initialize+0)+0+1),f
	goto	u2637
	nop2
opt asmopt_on

	line	110
	
l5232:	
;lcd.c: 110: send_lcd_data(0, 0b00100000 | 0b00010000 | 0b00001000 | 0b00000000);
	movlw	(038h)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	114
	
l5234:	
;lcd.c: 114: send_lcd_data(0, 0b00000100 | 0b00000010 | 0b00000000);
	movlw	(06h)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	117
	
l5236:	
;lcd.c: 117: send_lcd_data(0, 0b00001000 | 0b00000100 | 0b00000000 | 0b00000000);
	movlw	(0Ch)
	movwf	(??_lcd_initialize+0)+0
	movf	(??_lcd_initialize+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	120
	
l5238:	
;lcd.c: 120: lcd_clear();
	fcall	_lcd_clear
	line	121
	
l2811:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_initialize
	__end_of_lcd_initialize:
;; =============== function _lcd_initialize ends ============

	signat	_lcd_initialize,88
	global	_lcd_putchar
psect	text332,local,class=CODE,delta=2
global __ptext332
__ptext332:

;; *************** function _lcd_putchar *****************
;; Defined at:
;;		line 240 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
;;		_lcd_bcd
;; This function uses a non-reentrant model
;;
psect	text332
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	240
	global	__size_of_lcd_putchar
	__size_of_lcd_putchar	equ	__end_of_lcd_putchar-_lcd_putchar
	
_lcd_putchar:	
	opt	stack 4
; Regs used in _lcd_putchar: [wreg+status,2+status,0+pclath+cstack]
;lcd_putchar@c_data stored from wreg
	line	242
	movwf	(lcd_putchar@c_data)
	
l5226:	
;lcd.c: 242: send_lcd_data(1, (unsigned char)c_data);
	movf	(lcd_putchar@c_data),w
	movwf	(??_lcd_putchar+0)+0
	movf	(??_lcd_putchar+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(01h)
	fcall	_send_lcd_data
	line	243
	
l2829:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putchar
	__end_of_lcd_putchar:
;; =============== function _lcd_putchar ends ============

	signat	_lcd_putchar,4216
	global	_lcd_2ndline
psect	text333,local,class=CODE,delta=2
global __ptext333
__ptext333:

;; *************** function _lcd_2ndline *****************
;; Defined at:
;;		line 198 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
;; This function uses a non-reentrant model
;;
psect	text333
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	198
	global	__size_of_lcd_2ndline
	__size_of_lcd_2ndline	equ	__end_of_lcd_2ndline-_lcd_2ndline
	
_lcd_2ndline:	
	opt	stack 4
; Regs used in _lcd_2ndline: [wreg+status,2+status,0+pclath+cstack]
	line	200
	
l5224:	
;lcd.c: 200: send_lcd_data(0, 0b10000000 | 0x40);
	movlw	(0C0h)
	movwf	(??_lcd_2ndline+0)+0
	movf	(??_lcd_2ndline+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	201
	
l2823:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_2ndline
	__end_of_lcd_2ndline:
;; =============== function _lcd_2ndline ends ============

	signat	_lcd_2ndline,88
	global	_lcd_clear
psect	text334,local,class=CODE,delta=2
global __ptext334
__ptext334:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 156 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
psect	text334
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	156
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 4
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	158
	
l5222:	
;lcd.c: 158: send_lcd_data(0, 0b00000001);
	clrf	(?_send_lcd_data)
	bsf	status,0
	rlf	(?_send_lcd_data),f
	movlw	(0)
	fcall	_send_lcd_data
	line	159
	
l2817:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_goto
psect	text335,local,class=CODE,delta=2
global __ptext335
__ptext335:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 219 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
psect	text335
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	219
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 5
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@uc_position stored from wreg
	line	221
	movwf	(lcd_goto@uc_position)
	
l5220:	
;lcd.c: 221: send_lcd_data(0, 0b10000000 | uc_position);
	movf	(lcd_goto@uc_position),w
	iorlw	080h
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(?_send_lcd_data)
	movlw	(0)
	fcall	_send_lcd_data
	line	222
	
l2826:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_beep
psect	text336,local,class=CODE,delta=2
global __ptext336
__ptext336:

;; *************** function _beep *****************
;; Defined at:
;;		line 139 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
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
psect	text336
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
	line	139
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 6
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@uc_count stored from wreg
	movwf	(beep@uc_count)
	line	140
	
l5034:	
;Main E_4.c: 140: while (uc_count-- > 0) {
	goto	l5040
	
l2112:	
	line	141
;Main E_4.c: 141: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	142
	
l5036:	
;Main E_4.c: 142: delay_ms(80);
	movlw	low(050h)
	movwf	(?_delay_ms)
	movlw	high(050h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	143
	
l5038:	
;Main E_4.c: 143: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	144
;Main E_4.c: 144: delay_ms(100);
	movlw	low(064h)
	movwf	(?_delay_ms)
	movlw	high(064h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l5040
	line	145
	
l2111:	
	line	140
	
l5040:	
	movlw	low(01h)
	subwf	(beep@uc_count),f
	movf	((beep@uc_count)),w
	xorlw	0FFh
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l2112
u2330:
	goto	l2114
	
l2113:	
	line	146
	
l2114:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,4216
	global	_send_lcd_data
psect	text337,local,class=CODE,delta=2
global __ptext337
__ptext337:

;; *************** function _send_lcd_data *****************
;; Defined at:
;;		line 328 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
psect	text337
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	328
	global	__size_of_send_lcd_data
	__size_of_send_lcd_data	equ	__end_of_send_lcd_data-_send_lcd_data
	
_send_lcd_data:	
	opt	stack 4
; Regs used in _send_lcd_data: [wreg+status,2+status,0+pclath+cstack]
;send_lcd_data@b_rs stored from wreg
	line	330
	movwf	(send_lcd_data@b_rs)
	
l5210:	
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
	
l5212:	
;lcd.c: 335: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_send_lcd_data+0)+0+1),f
	movlw	125
movwf	((??_send_lcd_data+0)+0),f
u2647:
	decfsz	((??_send_lcd_data+0)+0),f
	goto	u2647
	decfsz	((??_send_lcd_data+0)+0+1),f
	goto	u2647
opt asmopt_on

	line	336
	
l5214:	
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
u2657:
	decfsz	((??_send_lcd_data+0)+0),f
	goto	u2657
	decfsz	((??_send_lcd_data+0)+0+1),f
	goto	u2657
	nop2
opt asmopt_on

	line	340
	
l5216:	
;lcd.c: 340: set_lcd_rs(0);
	movlw	(0)
	fcall	_set_lcd_rs
	line	341
	
l5218:	
;lcd.c: 341: set_lcd_data(0);
	movlw	(0)
	fcall	_set_lcd_data
	line	342
	
l2850:	
	return
	opt stack 0
GLOBAL	__end_of_send_lcd_data
	__end_of_send_lcd_data:
;; =============== function _send_lcd_data ends ============

	signat	_send_lcd_data,8312
	global	_delay_ms
psect	text338,local,class=CODE,delta=2
global __ptext338
__ptext338:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 119 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
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
psect	text338
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\Main E_4.c"
	line	119
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 6
; Regs used in _delay_ms: [wreg]
	line	120
	
l5020:	
;Main E_4.c: 120: while (ui_value-- > 0) {
	goto	l2105
	
l2106:	
	line	121
	
l5022:	
;Main E_4.c: 121: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay_ms+0)+0+1),f
	movlw	125
movwf	((??_delay_ms+0)+0),f
u2667:
	decfsz	((??_delay_ms+0)+0),f
	goto	u2667
	decfsz	((??_delay_ms+0)+0+1),f
	goto	u2667
opt asmopt_on

	line	122
	
l2105:	
	line	120
	movlw	low(01h)
	subwf	(delay_ms@ui_value),f
	movlw	high(01h)
	skipc
	decf	(delay_ms@ui_value+1),f
	subwf	(delay_ms@ui_value+1),f
	movlw	high(0FFFFh)
	xorwf	((delay_ms@ui_value+1)),w
	skipz
	goto	u2325
	movlw	low(0FFFFh)
	xorwf	((delay_ms@ui_value)),w
u2325:

	skipz
	goto	u2321
	goto	u2320
u2321:
	goto	l5022
u2320:
	goto	l2108
	
l2107:	
	line	123
	
l2108:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_seg7_initialize
psect	text339,local,class=CODE,delta=2
global __ptext339
__ptext339:

;; *************** function _seg7_initialize *****************
;; Defined at:
;;		line 52 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\seg7.c"
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
psect	text339
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\seg7.c"
	line	52
	global	__size_of_seg7_initialize
	__size_of_seg7_initialize	equ	__end_of_seg7_initialize-_seg7_initialize
	
_seg7_initialize:	
	opt	stack 7
; Regs used in _seg7_initialize: [wreg+status,2]
	line	53
	
l5008:	
;seg7.c: 53: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	54
;seg7.c: 54: RE0 = 0;
	bcf	(72/8),(72)&7
	line	55
	
l5010:	
;seg7.c: 55: PORTD = (PORTD & 0xf0) | 0x0A;
	movf	(8),w
	andlw	0F0h
	iorlw	0Ah
	movwf	(8)	;volatile
	line	56
	
l5012:	
;seg7.c: 56: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_initialize+0)+0+1),f
	movlw	125
movwf	((??_seg7_initialize+0)+0),f
u2677:
	decfsz	((??_seg7_initialize+0)+0),f
	goto	u2677
	decfsz	((??_seg7_initialize+0)+0+1),f
	goto	u2677
opt asmopt_on

	line	57
	
l5014:	
;seg7.c: 57: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	58
	
l5016:	
;seg7.c: 58: RE0 = 1;
	bsf	(72/8),(72)&7
	line	59
	
l5018:	
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
psect	text340,local,class=CODE,delta=2
global __ptext340
__ptext340:

;; *************** function _set_lcd_data *****************
;; Defined at:
;;		line 400 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
psect	text340
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	400
	global	__size_of_set_lcd_data
	__size_of_set_lcd_data	equ	__end_of_set_lcd_data-_set_lcd_data
	
_set_lcd_data:	
	opt	stack 4
; Regs used in _set_lcd_data: [wreg]
;set_lcd_data@uc_data stored from wreg
	movwf	(set_lcd_data@uc_data)
	line	401
	
l5160:	
;lcd.c: 401: PORTD = uc_data;
	movf	(set_lcd_data@uc_data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	402
	
l2859:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_data
	__end_of_set_lcd_data:
;; =============== function _set_lcd_data ends ============

	signat	_set_lcd_data,4216
	global	_set_lcd_rs
psect	text341,local,class=CODE,delta=2
global __ptext341
__ptext341:

;; *************** function _set_lcd_rs *****************
;; Defined at:
;;		line 380 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
psect	text341
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	380
	global	__size_of_set_lcd_rs
	__size_of_set_lcd_rs	equ	__end_of_set_lcd_rs-_set_lcd_rs
	
_set_lcd_rs:	
	opt	stack 4
; Regs used in _set_lcd_rs: [wreg]
;set_lcd_rs@b_output stored from wreg
	movwf	(set_lcd_rs@b_output)
	line	381
	
l5158:	
;lcd.c: 381: RA2 = b_output;
	btfsc	(set_lcd_rs@b_output),0
	goto	u2441
	goto	u2440
	
u2441:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	goto	u2454
u2440:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
u2454:
	line	382
	
l2856:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_rs
	__end_of_set_lcd_rs:
;; =============== function _set_lcd_rs ends ============

	signat	_set_lcd_rs,4216
	global	_set_lcd_e
psect	text342,local,class=CODE,delta=2
global __ptext342
__ptext342:

;; *************** function _set_lcd_e *****************
;; Defined at:
;;		line 360 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
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
psect	text342
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\lcd.c"
	line	360
	global	__size_of_set_lcd_e
	__size_of_set_lcd_e	equ	__end_of_set_lcd_e-_set_lcd_e
	
_set_lcd_e:	
	opt	stack 4
; Regs used in _set_lcd_e: [wreg]
;set_lcd_e@b_output stored from wreg
	movwf	(set_lcd_e@b_output)
	line	361
	
l5120:	
;lcd.c: 361: RA3 = b_output;
	btfsc	(set_lcd_e@b_output),0
	goto	u2381
	goto	u2380
	
u2381:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	goto	u2394
u2380:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(43/8),(43)&7
u2394:
	line	362
	
l2853:	
	return
	opt stack 0
GLOBAL	__end_of_set_lcd_e
	__end_of_set_lcd_e:
;; =============== function _set_lcd_e ends ============

	signat	_set_lcd_e,4216
	global	_adc_initialize
psect	text343,local,class=CODE,delta=2
global __ptext343
__ptext343:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\adc.c"
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
psect	text343
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 4\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l4046:	
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
psect	text344,local,class=CODE,delta=2
global __ptext344
__ptext344:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
