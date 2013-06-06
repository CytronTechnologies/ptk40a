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
# 32 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
	psect config,class=CONFIG,delta=2 ;#
# 32 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_seg7_initialize
	FNCALL	_main,_beep
	FNCALL	_main,_adc_on
	FNCALL	_main,_ui_adc_read
	FNCALL	_main,___lwdiv
	FNCALL	_main,_seg7_com_dis
	FNCALL	_beep,_delay_ms
	FNCALL	_seg7_com_dis,_seg7_1_dis
	FNCALL	_seg7_com_dis,_seg7_2_dis
	FNCALL	_seg7_com_dis,___awmod
	FNCALL	_seg7_com_dis,___awdiv
	FNROOT	_main
	global	_ADRESH
psect	text303,local,class=CODE,delta=2
global __ptext303
__ptext303:
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
	file	"Example7.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_beep
?_beep:	; 0 bytes @ 0x0
	global	?_adc_initialize
?_adc_initialize:	; 0 bytes @ 0x0
	global	??_adc_initialize
??_adc_initialize:	; 0 bytes @ 0x0
	global	?_adc_on
?_adc_on:	; 0 bytes @ 0x0
	global	??_adc_on
??_adc_on:	; 0 bytes @ 0x0
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
	global	?_ui_adc_read
?_ui_adc_read:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	delay_ms@ui_value
delay_ms@ui_value:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_ui_adc_read
??_ui_adc_read:	; 0 bytes @ 0x2
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	seg7_1_dis@uc_number
seg7_1_dis@uc_number:	; 1 bytes @ 0x2
	global	seg7_2_dis@uc_number
seg7_2_dis@uc_number:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??_beep
??_beep:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	beep@uc_count
beep@uc_count:	; 1 bytes @ 0x4
	global	ui_adc_read@temp
ui_adc_read@temp:	; 2 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
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
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@i
main@i:	; 1 bytes @ 0x0
	ds	1
	global	main@temperature
main@temperature:	; 2 bytes @ 0x1
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      3       3
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?_ui_adc_read	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_seg7_com_dis
;;   _beep->_delay_ms
;;   _seg7_com_dis->___awdiv
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0    1099
;;                                             12 COMMON     2     2      0
;;                                              0 BANK0      3     3      0
;;                     _adc_initialize
;;                    _seg7_initialize
;;                               _beep
;;                             _adc_on
;;                        _ui_adc_read
;;                            ___lwdiv
;;                       _seg7_com_dis
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 1     1      0      44
;;                                              4 COMMON     1     1      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _seg7_com_dis                                         3     3      0     706
;;                                              9 COMMON     3     3      0
;;                         _seg7_1_dis
;;                         _seg7_2_dis
;;                            ___awmod
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (2) _delay_ms                                             4     2      2      22
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (2) _seg7_2_dis                                           3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _seg7_1_dis                                           3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _seg7_initialize                                      2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _ui_adc_read                                          6     4      2      47
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _adc_on                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _adc_initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _adc_initialize
;;   _seg7_initialize
;;   _beep
;;     _delay_ms
;;   _adc_on
;;   _ui_adc_read
;;   ___lwdiv
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
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      3       3       5        3.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 57 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temperature     2    1[BANK0 ] unsigned int 
;;  i               1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  2095[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       3       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_adc_initialize
;;		_seg7_initialize
;;		_beep
;;		_adc_on
;;		_ui_adc_read
;;		___lwdiv
;;		_seg7_com_dis
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
	line	57
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	58
	
l4367:	
;Main E_7.c: 58: unsigned char i = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	line	59
	
l4369:	
;Main E_7.c: 59: unsigned int temperature = 0;
	clrf	(main@temperature)
	clrf	(main@temperature+1)
	line	61
;Main E_7.c: 61: PORTA = 0;
	clrf	(5)	;volatile
	line	62
;Main E_7.c: 62: PORTB = 0;
	clrf	(6)	;volatile
	line	63
;Main E_7.c: 63: PORTC = 0;
	clrf	(7)	;volatile
	line	64
;Main E_7.c: 64: PORTD = 0;
	clrf	(8)	;volatile
	line	65
;Main E_7.c: 65: PORTE = 0;
	clrf	(9)	;volatile
	line	71
	
l4371:	
;Main E_7.c: 71: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	72
	
l4373:	
;Main E_7.c: 72: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	73
	
l4375:	
;Main E_7.c: 73: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	74
	
l4377:	
;Main E_7.c: 74: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	75
	
l4379:	
;Main E_7.c: 75: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	78
	
l4381:	
;Main E_7.c: 78: adc_initialize();
	fcall	_adc_initialize
	line	81
	
l4383:	
;Main E_7.c: 81: seg7_initialize();
	fcall	_seg7_initialize
	line	83
	
l4385:	
;Main E_7.c: 83: beep(2);
	movlw	(02h)
	fcall	_beep
	line	90
	
l4387:	
;Main E_7.c: 90: adc_on();
	fcall	_adc_on
	goto	l4389
	line	92
;Main E_7.c: 92: while(1)
	
l2096:	
	line	94
	
l4389:	
;Main E_7.c: 93: {
;Main E_7.c: 94: temperature = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@temperature)
	clrf	(main@temperature+1)
	line	95
	
l4391:	
;Main E_7.c: 95: for( i = 0 ; i < 10 ; i++)
	clrf	(main@i)
	movlw	(0Ah)
	subwf	(main@i),w
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l4395
u2590:
	goto	l4401
	
l4393:	
	goto	l4401
	line	96
	
l2097:	
	line	97
	
l4395:	
;Main E_7.c: 96: {
;Main E_7.c: 97: temperature = temperature + ui_adc_read();
	fcall	_ui_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@temperature),w
	addwf	(0+(?_ui_adc_read)),w
	movwf	(main@temperature)
	movf	(main@temperature+1),w
	skipnc
	incf	(main@temperature+1),w
	addwf	(1+(?_ui_adc_read)),w
	movwf	1+(main@temperature)
	line	95
	
l4397:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l4399:	
	movlw	(0Ah)
	subwf	(main@i),w
	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l4395
u2600:
	goto	l4401
	
l2098:	
	line	100
	
l4401:	
;Main E_7.c: 98: }
;Main E_7.c: 100: temperature = temperature / 10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(main@temperature+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(main@temperature),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@temperature+1)
	addwf	(main@temperature+1)
	movf	(0+(?___lwdiv)),w
	clrf	(main@temperature)
	addwf	(main@temperature)

	line	101
	
l4403:	
;Main E_7.c: 101: temperature = temperature /2 ;
	movf	(main@temperature+1),w
	movwf	(??_main+0)+0+1
	movf	(main@temperature),w
	movwf	(??_main+0)+0
	movlw	01h
u2615:
	clrc
	rrf	(??_main+0)+1,f
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2615
	movf	0+(??_main+0)+0,w
	movwf	(main@temperature)
	movf	1+(??_main+0)+0,w
	movwf	(main@temperature+1)
	line	103
	
l4405:	
;Main E_7.c: 103: seg7_com_dis(temperature);
	movf	(main@temperature),w
	fcall	_seg7_com_dis
	goto	l4389
	line	104
	
l2099:	
	line	92
	goto	l4389
	
l2100:	
	goto	l2102
	line	105
;Main E_7.c: 104: }
;Main E_7.c: 105: while(1) continue;
	
l2101:	
	
l2102:	
	goto	l2102
	
l2103:	
	line	106
	
l2104:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_beep
psect	text304,local,class=CODE,delta=2
global __ptext304
__ptext304:

;; *************** function _beep *****************
;; Defined at:
;;		line 142 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
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
psect	text304
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
	line	142
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 6
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@uc_count stored from wreg
	movwf	(beep@uc_count)
	line	143
	
l4359:	
;Main E_7.c: 143: while (uc_count-- > 0) {
	goto	l4365
	
l2114:	
	line	144
;Main E_7.c: 144: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	145
	
l4361:	
;Main E_7.c: 145: delay_ms(80);
	movlw	low(050h)
	movwf	(?_delay_ms)
	movlw	high(050h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	146
	
l4363:	
;Main E_7.c: 146: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	147
;Main E_7.c: 147: delay_ms(100);
	movlw	low(064h)
	movwf	(?_delay_ms)
	movlw	high(064h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l4365
	line	148
	
l2113:	
	line	143
	
l4365:	
	movlw	low(01h)
	subwf	(beep@uc_count),f
	movf	((beep@uc_count)),w
	xorlw	0FFh
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l2114
u2580:
	goto	l2116
	
l2115:	
	line	149
	
l2116:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,4216
	global	_seg7_com_dis
psect	text305,local,class=CODE,delta=2
global __ptext305
__ptext305:

;; *************** function _seg7_com_dis *****************
;; Defined at:
;;		line 127 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
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
psect	text305
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
	line	127
	global	__size_of_seg7_com_dis
	__size_of_seg7_com_dis	equ	__end_of_seg7_com_dis-_seg7_com_dis
	
_seg7_com_dis:	
	opt	stack 6
; Regs used in _seg7_com_dis: [wreg+status,2+status,0+pclath+cstack]
;seg7_com_dis@uc_number stored from wreg
	movwf	(seg7_com_dis@uc_number)
	line	128
	
l4353:	
;seg7.c: 128: if(uc_number > 99)
	movlw	(064h)
	subwf	(seg7_com_dis@uc_number),w
	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l4357
u2570:
	line	130
	
l4355:	
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
	
l4357:	
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
	global	_delay_ms
psect	text306,local,class=CODE,delta=2
global __ptext306
__ptext306:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 122 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
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
psect	text306
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\Main E_7.c"
	line	122
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 6
; Regs used in _delay_ms: [wreg]
	line	123
	
l4349:	
;Main E_7.c: 123: while (ui_value-- > 0) {
	goto	l2107
	
l2108:	
	line	124
	
l4351:	
;Main E_7.c: 124: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay_ms+0)+0+1),f
	movlw	125
movwf	((??_delay_ms+0)+0),f
u2627:
	decfsz	((??_delay_ms+0)+0),f
	goto	u2627
	decfsz	((??_delay_ms+0)+0+1),f
	goto	u2627
opt asmopt_on

	line	125
	
l2107:	
	line	123
	movlw	low(01h)
	subwf	(delay_ms@ui_value),f
	movlw	high(01h)
	skipc
	decf	(delay_ms@ui_value+1),f
	subwf	(delay_ms@ui_value+1),f
	movlw	high(0FFFFh)
	xorwf	((delay_ms@ui_value+1)),w
	skipz
	goto	u2565
	movlw	low(0FFFFh)
	xorwf	((delay_ms@ui_value)),w
u2565:

	skipz
	goto	u2561
	goto	u2560
u2561:
	goto	l4351
u2560:
	goto	l2110
	
l2109:	
	line	126
	
l2110:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_seg7_2_dis
psect	text307,local,class=CODE,delta=2
global __ptext307
__ptext307:

;; *************** function _seg7_2_dis *****************
;; Defined at:
;;		line 103 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
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
psect	text307
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
	line	103
	global	__size_of_seg7_2_dis
	__size_of_seg7_2_dis	equ	__end_of_seg7_2_dis-_seg7_2_dis
	
_seg7_2_dis:	
	opt	stack 6
; Regs used in _seg7_2_dis: [wreg+status,2+status,0]
;seg7_2_dis@uc_number stored from wreg
	movwf	(seg7_2_dis@uc_number)
	line	104
	
l4339:	
;seg7.c: 104: RE0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	105
	
l4341:	
;seg7.c: 105: PORTD = (PORTD & 0xf0) | uc_number;
	movf	(8),w
	andlw	0F0h
	iorwf	(seg7_2_dis@uc_number),w
	movwf	(8)	;volatile
	line	106
	
l4343:	
;seg7.c: 106: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_2_dis+0)+0+1),f
	movlw	125
movwf	((??_seg7_2_dis+0)+0),f
u2637:
	decfsz	((??_seg7_2_dis+0)+0),f
	goto	u2637
	decfsz	((??_seg7_2_dis+0)+0+1),f
	goto	u2637
opt asmopt_on

	line	107
	
l4345:	
;seg7.c: 107: RE0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(72/8),(72)&7
	line	108
	
l4347:	
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
psect	text308,local,class=CODE,delta=2
global __ptext308
__ptext308:

;; *************** function _seg7_1_dis *****************
;; Defined at:
;;		line 79 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
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
psect	text308
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
	line	79
	global	__size_of_seg7_1_dis
	__size_of_seg7_1_dis	equ	__end_of_seg7_1_dis-_seg7_1_dis
	
_seg7_1_dis:	
	opt	stack 6
; Regs used in _seg7_1_dis: [wreg+status,2+status,0]
;seg7_1_dis@uc_number stored from wreg
	movwf	(seg7_1_dis@uc_number)
	line	80
	
l4329:	
;seg7.c: 80: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	81
	
l4331:	
;seg7.c: 81: PORTD = (PORTD & 0xf0) | uc_number;
	movf	(8),w
	andlw	0F0h
	iorwf	(seg7_1_dis@uc_number),w
	movwf	(8)	;volatile
	line	82
	
l4333:	
;seg7.c: 82: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_1_dis+0)+0+1),f
	movlw	125
movwf	((??_seg7_1_dis+0)+0),f
u2647:
	decfsz	((??_seg7_1_dis+0)+0),f
	goto	u2647
	decfsz	((??_seg7_1_dis+0)+0+1),f
	goto	u2647
opt asmopt_on

	line	83
	
l4335:	
;seg7.c: 83: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	84
	
l4337:	
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
psect	text309,local,class=CODE,delta=2
global __ptext309
__ptext309:

;; *************** function _seg7_initialize *****************
;; Defined at:
;;		line 52 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
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
psect	text309
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\seg7.c"
	line	52
	global	__size_of_seg7_initialize
	__size_of_seg7_initialize	equ	__end_of_seg7_initialize-_seg7_initialize
	
_seg7_initialize:	
	opt	stack 7
; Regs used in _seg7_initialize: [wreg+status,2]
	line	53
	
l4317:	
;seg7.c: 53: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	54
;seg7.c: 54: RE0 = 0;
	bcf	(72/8),(72)&7
	line	55
	
l4319:	
;seg7.c: 55: PORTD = (PORTD & 0xf0) | 0x0A;
	movf	(8),w
	andlw	0F0h
	iorlw	0Ah
	movwf	(8)	;volatile
	line	56
	
l4321:	
;seg7.c: 56: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_initialize+0)+0+1),f
	movlw	125
movwf	((??_seg7_initialize+0)+0),f
u2657:
	decfsz	((??_seg7_initialize+0)+0),f
	goto	u2657
	decfsz	((??_seg7_initialize+0)+0+1),f
	goto	u2657
opt asmopt_on

	line	57
	
l4323:	
;seg7.c: 57: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	58
	
l4325:	
;seg7.c: 58: RE0 = 1;
	bsf	(72/8),(72)&7
	line	59
	
l4327:	
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
	global	_ui_adc_read
psect	text310,local,class=CODE,delta=2
global __ptext310
__ptext310:

;; *************** function _ui_adc_read *****************
;; Defined at:
;;		line 104 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text310
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\adc.c"
	line	104
	global	__size_of_ui_adc_read
	__size_of_ui_adc_read	equ	__end_of_ui_adc_read-_ui_adc_read
	
_ui_adc_read:	
	opt	stack 7
; Regs used in _ui_adc_read: [wreg+status,2+status,0+btemp+1]
	line	105
	
l4297:	
;adc.c: 105: unsigned int temp = 0;
	clrf	(ui_adc_read@temp)
	clrf	(ui_adc_read@temp+1)
	line	107
	
l4299:	
;adc.c: 107: CHS2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(253/8),(253)&7
	line	108
	
l4301:	
;adc.c: 108: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	109
	
l4303:	
;adc.c: 109: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	112
	
l4305:	
;adc.c: 112: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_ui_adc_read+0)+0+1),f
	movlw	125
movwf	((??_ui_adc_read+0)+0),f
u2667:
	decfsz	((??_ui_adc_read+0)+0),f
	goto	u2667
	decfsz	((??_ui_adc_read+0)+0+1),f
	goto	u2667
opt asmopt_on

	line	119
	
l4307:	
;adc.c: 119: GO_DONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	120
;adc.c: 120: while (GO_DONE == 1);
	goto	l696
	
l697:	
	
l696:	
	btfsc	(250/8),(250)&7
	goto	u2551
	goto	u2550
u2551:
	goto	l696
u2550:
	goto	l4309
	
l698:	
	line	124
	
l4309:	
;adc.c: 124: temp = (unsigned int)ADRESH << 8;
	movf	(30),w	;volatile
	movwf	(??_ui_adc_read+0)+0
	clrf	(??_ui_adc_read+0)+0+1
	movf	(??_ui_adc_read+0)+0,w
	movwf	(??_ui_adc_read+0)+1
	clrf	(??_ui_adc_read+0)+0
	movf	0+(??_ui_adc_read+0)+0,w
	movwf	(ui_adc_read@temp)
	movf	1+(??_ui_adc_read+0)+0,w
	movwf	(ui_adc_read@temp+1)
	line	125
	
l4311:	
;adc.c: 125: temp = temp + ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	addwf	(ui_adc_read@temp),w
	movwf	(ui_adc_read@temp)
	movf	(ui_adc_read@temp+1),w
	skipnc
	incf	(ui_adc_read@temp+1),w
	movwf	((ui_adc_read@temp))+1
	line	126
	
l4313:	
;adc.c: 126: return temp;
	movf	(ui_adc_read@temp+1),w
	clrf	(?_ui_adc_read+1)
	addwf	(?_ui_adc_read+1)
	movf	(ui_adc_read@temp),w
	clrf	(?_ui_adc_read)
	addwf	(?_ui_adc_read)

	goto	l699
	
l4315:	
	line	127
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_ui_adc_read
	__end_of_ui_adc_read:
;; =============== function _ui_adc_read ends ============

	signat	_ui_adc_read,90
	global	___awmod
psect	text311,local,class=CODE,delta=2
global __ptext311
__ptext311:

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
psect	text311
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l4263:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2461
	goto	u2460
u2461:
	goto	l4267
u2460:
	line	10
	
l4265:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l4267
	line	12
	
l3007:	
	line	13
	
l4267:	
	btfss	(___awmod@divisor+1),7
	goto	u2471
	goto	u2470
u2471:
	goto	l4271
u2470:
	line	14
	
l4269:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l4271
	
l3008:	
	line	15
	
l4271:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2481
	goto	u2480
u2481:
	goto	l4289
u2480:
	line	16
	
l4273:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l4279
	
l3011:	
	line	18
	
l4275:	
	movlw	01h
	
u2495:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2495
	line	19
	
l4277:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l4279
	line	20
	
l3010:	
	line	17
	
l4279:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2501
	goto	u2500
u2501:
	goto	l4275
u2500:
	goto	l4281
	
l3012:	
	goto	l4281
	line	21
	
l3013:	
	line	22
	
l4281:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2515
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2515:
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l4285
u2510:
	line	23
	
l4283:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l4285
	
l3014:	
	line	24
	
l4285:	
	movlw	01h
	
u2525:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2525
	line	25
	
l4287:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2531
	goto	u2530
u2531:
	goto	l4281
u2530:
	goto	l4289
	
l3015:	
	goto	l4289
	line	26
	
l3009:	
	line	27
	
l4289:	
	movf	(___awmod@sign),w
	skipz
	goto	u2540
	goto	l4293
u2540:
	line	28
	
l4291:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l4293
	
l3016:	
	line	29
	
l4293:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l3017
	
l4295:	
	line	30
	
l3017:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text312,local,class=CODE,delta=2
global __ptext312
__ptext312:

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
psect	text312
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4223:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2361
	goto	u2360
u2361:
	goto	l4227
u2360:
	line	11
	
l4225:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l4227
	line	13
	
l2939:	
	line	14
	
l4227:	
	btfss	(___awdiv@dividend+1),7
	goto	u2371
	goto	u2370
u2371:
	goto	l4233
u2370:
	line	15
	
l4229:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4231:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l4233
	line	17
	
l2940:	
	line	18
	
l4233:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4235:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2381
	goto	u2380
u2381:
	goto	l4255
u2380:
	line	20
	
l4237:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l4243
	
l2943:	
	line	22
	
l4239:	
	movlw	01h
	
u2395:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2395
	line	23
	
l4241:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l4243
	line	24
	
l2942:	
	line	21
	
l4243:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l4239
u2400:
	goto	l4245
	
l2944:	
	goto	l4245
	line	25
	
l2945:	
	line	26
	
l4245:	
	movlw	01h
	
u2415:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2415
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2425
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2425:
	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l4251
u2420:
	line	28
	
l4247:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l4249:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l4251
	line	30
	
l2946:	
	line	31
	
l4251:	
	movlw	01h
	
u2435:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2435
	line	32
	
l4253:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2441
	goto	u2440
u2441:
	goto	l4245
u2440:
	goto	l4255
	
l2947:	
	goto	l4255
	line	33
	
l2941:	
	line	34
	
l4255:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2450
	goto	l4259
u2450:
	line	35
	
l4257:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l4259
	
l2948:	
	line	36
	
l4259:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2949
	
l4261:	
	line	37
	
l2949:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwdiv
psect	text313,local,class=CODE,delta=2
global __ptext313
__ptext313:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text313
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 7
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l4197:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l4199:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2291
	goto	u2290
u2291:
	goto	l4219
u2290:
	line	11
	
l4201:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l4207
	
l2807:	
	line	13
	
l4203:	
	movlw	01h
	
u2305:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2305
	line	14
	
l4205:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l4207
	line	15
	
l2806:	
	line	12
	
l4207:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l4203
u2310:
	goto	l4209
	
l2808:	
	goto	l4209
	line	16
	
l2809:	
	line	17
	
l4209:	
	movlw	01h
	
u2325:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2325
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2335
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2335:
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l4215
u2330:
	line	19
	
l4211:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l4213:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l4215
	line	21
	
l2810:	
	line	22
	
l4215:	
	movlw	01h
	
u2345:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2345
	line	23
	
l4217:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l4209
u2350:
	goto	l4219
	
l2811:	
	goto	l4219
	line	24
	
l2805:	
	line	25
	
l4219:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l2812
	
l4221:	
	line	26
	
l2812:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_adc_on
psect	text314,local,class=CODE,delta=2
global __ptext314
__ptext314:

;; *************** function _adc_on *****************
;; Defined at:
;;		line 61 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\adc.c"
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
psect	text314
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\adc.c"
	line	61
	global	__size_of_adc_on
	__size_of_adc_on	equ	__end_of_adc_on-_adc_on
	
_adc_on:	
	opt	stack 7
; Regs used in _adc_on: []
	line	63
	
l4195:	
;adc.c: 63: ADON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(248/8),(248)&7
	line	64
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_adc_on
	__end_of_adc_on:
;; =============== function _adc_on ends ============

	signat	_adc_on,88
	global	_adc_initialize
psect	text315,local,class=CODE,delta=2
global __ptext315
__ptext315:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\adc.c"
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
psect	text315
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 7\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l4193:	
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
psect	text316,local,class=CODE,delta=2
global __ptext316
__ptext316:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
