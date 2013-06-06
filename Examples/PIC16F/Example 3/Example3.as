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
# 32 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
	psect config,class=CONFIG,delta=2 ;#
# 32 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_seg7_initialize
	FNCALL	_main,_beep
	FNCALL	_main,_seg7_com_dis
	FNCALL	_main,_delay_ms
	FNCALL	_seg7_com_dis,_seg7_1_dis
	FNCALL	_seg7_com_dis,_seg7_2_dis
	FNCALL	_seg7_com_dis,___awmod
	FNCALL	_seg7_com_dis,___awdiv
	FNCALL	_beep,_delay_ms
	FNROOT	_main
	global	_ADRESH
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:
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
	file	"Example3.as"
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
	global	?_seg7_initialize
?_seg7_initialize:	; 0 bytes @ 0x0
	global	??_seg7_initialize
??_seg7_initialize:	; 0 bytes @ 0x0
	global	?_beep
?_beep:	; 0 bytes @ 0x0
	global	?_seg7_com_dis
?_seg7_com_dis:	; 0 bytes @ 0x0
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_adc_initialize
?_adc_initialize:	; 0 bytes @ 0x0
	global	??_adc_initialize
??_adc_initialize:	; 0 bytes @ 0x0
	global	?_seg7_1_dis
?_seg7_1_dis:	; 0 bytes @ 0x0
	global	??_seg7_1_dis
??_seg7_1_dis:	; 0 bytes @ 0x0
	global	?_seg7_2_dis
?_seg7_2_dis:	; 0 bytes @ 0x0
	global	??_seg7_2_dis
??_seg7_2_dis:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	delay_ms@ui_value
delay_ms@ui_value:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	seg7_1_dis@uc_number
seg7_1_dis@uc_number:	; 1 bytes @ 0x2
	global	seg7_2_dis@uc_number
seg7_2_dis@uc_number:	; 1 bytes @ 0x2
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
	ds	1
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
	ds	1
	global	main@value
main@value:	; 1 bytes @ 0xD
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      0       0
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
;;   _seg7_com_dis->___awdiv
;;   _beep->_delay_ms
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     555
;;                                             12 COMMON     2     2      0
;;                     _adc_initialize
;;                    _seg7_initialize
;;                               _beep
;;                       _seg7_com_dis
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _seg7_com_dis                                         3     3      0     465
;;                                              9 COMMON     3     3      0
;;                         _seg7_1_dis
;;                         _seg7_2_dis
;;                            ___awmod
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 1     1      0      30
;;                                              4 COMMON     1     1      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (2) _seg7_2_dis                                           3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _seg7_1_dis                                           3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _delay_ms                                             4     2      2      15
;;                                              0 COMMON     4     2      2
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
;;   _seg7_com_dis
;;     _seg7_1_dis
;;     _seg7_2_dis
;;     ___awmod
;;     ___awdiv
;;   _delay_ms
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
;;BANK0               50      0       0       5        0.0%
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
;;		line 57 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  1395[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_adc_initialize
;;		_seg7_initialize
;;		_beep
;;		_seg7_com_dis
;;		_delay_ms
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
	line	57
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	58
	
l4128:	
;Main E_3.c: 58: unsigned char value = 0;
	clrf	(main@value)
	line	60
	
l4130:	
;Main E_3.c: 60: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	61
;Main E_3.c: 61: PORTB = 0;
	clrf	(6)	;volatile
	line	62
;Main E_3.c: 62: PORTC = 0;
	clrf	(7)	;volatile
	line	63
;Main E_3.c: 63: PORTD = 0;
	clrf	(8)	;volatile
	line	64
;Main E_3.c: 64: PORTE = 0;
	clrf	(9)	;volatile
	line	70
	
l4132:	
;Main E_3.c: 70: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	71
	
l4134:	
;Main E_3.c: 71: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	72
	
l4136:	
;Main E_3.c: 72: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	73
	
l4138:	
;Main E_3.c: 73: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	74
	
l4140:	
;Main E_3.c: 74: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	77
	
l4142:	
;Main E_3.c: 77: adc_initialize();
	fcall	_adc_initialize
	line	80
	
l4144:	
;Main E_3.c: 80: seg7_initialize();
	fcall	_seg7_initialize
	line	82
	
l4146:	
;Main E_3.c: 82: beep(2);
	movlw	(02h)
	fcall	_beep
	line	88
;Main E_3.c: 88: while (RB0 == 1) continue;
	goto	l1396
	
l1397:	
	
l1396:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l1396
u2260:
	goto	l1399
	
l1398:	
	line	90
;Main E_3.c: 90: while(1)
	
l1399:	
	line	92
;Main E_3.c: 91: {
;Main E_3.c: 92: for(value = 0; value <100; value ++)
	clrf	(main@value)
	
l4148:	
	movlw	(064h)
	subwf	(main@value),w
	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l4152
u2270:
	goto	l1399
	
l4150:	
	goto	l1399
	line	93
	
l1400:	
	line	94
	
l4152:	
;Main E_3.c: 93: {
;Main E_3.c: 94: seg7_com_dis(value);
	movf	(main@value),w
	fcall	_seg7_com_dis
	line	95
;Main E_3.c: 95: delay_ms(500);
	movlw	low(01F4h)
	movwf	(?_delay_ms)
	movlw	high(01F4h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	92
	
l4154:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@value),f
	
l4156:	
	movlw	(064h)
	subwf	(main@value),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l4152
u2280:
	goto	l1399
	
l1401:	
	goto	l1399
	line	97
	
l1402:	
	line	90
	goto	l1399
	
l1403:	
	goto	l1405
	line	99
;Main E_3.c: 96: }
;Main E_3.c: 97: }
;Main E_3.c: 99: while(1) continue;
	
l1404:	
	
l1405:	
	goto	l1405
	
l1406:	
	line	100
	
l1407:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_seg7_com_dis
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

;; *************** function _seg7_com_dis *****************
;; Defined at:
;;		line 127 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
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
psect	text153
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
	line	127
	global	__size_of_seg7_com_dis
	__size_of_seg7_com_dis	equ	__end_of_seg7_com_dis-_seg7_com_dis
	
_seg7_com_dis:	
	opt	stack 6
; Regs used in _seg7_com_dis: [wreg+status,2+status,0+pclath+cstack]
;seg7_com_dis@uc_number stored from wreg
	movwf	(seg7_com_dis@uc_number)
	line	128
	
l4122:	
;seg7.c: 128: if(uc_number > 99)
	movlw	(064h)
	subwf	(seg7_com_dis@uc_number),w
	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l4126
u2250:
	line	130
	
l4124:	
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
	goto	l2117
	line	133
	
l2115:	
	line	135
	
l4126:	
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
	goto	l2117
	line	137
	
l2116:	
	line	138
	
l2117:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_com_dis
	__end_of_seg7_com_dis:
;; =============== function _seg7_com_dis ends ============

	signat	_seg7_com_dis,4216
	global	_beep
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:

;; *************** function _beep *****************
;; Defined at:
;;		line 136 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
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
psect	text154
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
	line	136
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 6
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@uc_count stored from wreg
	movwf	(beep@uc_count)
	line	137
	
l4114:	
;Main E_3.c: 137: while (uc_count-- > 0) {
	goto	l4120
	
l1417:	
	line	138
;Main E_3.c: 138: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	139
	
l4116:	
;Main E_3.c: 139: delay_ms(80);
	movlw	low(050h)
	movwf	(?_delay_ms)
	movlw	high(050h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	140
	
l4118:	
;Main E_3.c: 140: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	141
;Main E_3.c: 141: delay_ms(100);
	movlw	low(064h)
	movwf	(?_delay_ms)
	movlw	high(064h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l4120
	line	142
	
l1416:	
	line	137
	
l4120:	
	movlw	low(01h)
	subwf	(beep@uc_count),f
	movf	((beep@uc_count)),w
	xorlw	0FFh
	skipz
	goto	u2241
	goto	u2240
u2241:
	goto	l1417
u2240:
	goto	l1419
	
l1418:	
	line	143
	
l1419:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,4216
	global	_seg7_2_dis
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:

;; *************** function _seg7_2_dis *****************
;; Defined at:
;;		line 103 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
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
psect	text155
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
	line	103
	global	__size_of_seg7_2_dis
	__size_of_seg7_2_dis	equ	__end_of_seg7_2_dis-_seg7_2_dis
	
_seg7_2_dis:	
	opt	stack 6
; Regs used in _seg7_2_dis: [wreg+status,2+status,0]
;seg7_2_dis@uc_number stored from wreg
	movwf	(seg7_2_dis@uc_number)
	line	104
	
l4104:	
;seg7.c: 104: RE0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	105
	
l4106:	
;seg7.c: 105: PORTD = (PORTD & 0xf0) | uc_number;
	movf	(8),w
	andlw	0F0h
	iorwf	(seg7_2_dis@uc_number),w
	movwf	(8)	;volatile
	line	106
	
l4108:	
;seg7.c: 106: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_2_dis+0)+0+1),f
	movlw	125
movwf	((??_seg7_2_dis+0)+0),f
u2297:
	decfsz	((??_seg7_2_dis+0)+0),f
	goto	u2297
	decfsz	((??_seg7_2_dis+0)+0+1),f
	goto	u2297
opt asmopt_on

	line	107
	
l4110:	
;seg7.c: 107: RE0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(72/8),(72)&7
	line	108
	
l4112:	
;seg7.c: 108: PORTD = PORTD & 0xf0;
	movf	(8),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	110
	
l2112:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_2_dis
	__end_of_seg7_2_dis:
;; =============== function _seg7_2_dis ends ============

	signat	_seg7_2_dis,4216
	global	_seg7_1_dis
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _seg7_1_dis *****************
;; Defined at:
;;		line 79 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
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
psect	text156
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
	line	79
	global	__size_of_seg7_1_dis
	__size_of_seg7_1_dis	equ	__end_of_seg7_1_dis-_seg7_1_dis
	
_seg7_1_dis:	
	opt	stack 6
; Regs used in _seg7_1_dis: [wreg+status,2+status,0]
;seg7_1_dis@uc_number stored from wreg
	movwf	(seg7_1_dis@uc_number)
	line	80
	
l4094:	
;seg7.c: 80: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	81
	
l4096:	
;seg7.c: 81: PORTD = (PORTD & 0xf0) | uc_number;
	movf	(8),w
	andlw	0F0h
	iorwf	(seg7_1_dis@uc_number),w
	movwf	(8)	;volatile
	line	82
	
l4098:	
;seg7.c: 82: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_1_dis+0)+0+1),f
	movlw	125
movwf	((??_seg7_1_dis+0)+0),f
u2307:
	decfsz	((??_seg7_1_dis+0)+0),f
	goto	u2307
	decfsz	((??_seg7_1_dis+0)+0+1),f
	goto	u2307
opt asmopt_on

	line	83
	
l4100:	
;seg7.c: 83: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	84
	
l4102:	
;seg7.c: 84: PORTD = PORTD & 0xf0;
	movf	(8),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	85
	
l2109:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_1_dis
	__end_of_seg7_1_dis:
;; =============== function _seg7_1_dis ends ============

	signat	_seg7_1_dis,4216
	global	_delay_ms
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 116 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
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
;;		_main
;;		_beep
;; This function uses a non-reentrant model
;;
psect	text157
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\Main E_3.c"
	line	116
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 7
; Regs used in _delay_ms: [wreg]
	line	117
	
l4090:	
;Main E_3.c: 117: while (ui_value-- > 0) {
	goto	l1410
	
l1411:	
	line	118
	
l4092:	
;Main E_3.c: 118: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay_ms+0)+0+1),f
	movlw	125
movwf	((??_delay_ms+0)+0),f
u2317:
	decfsz	((??_delay_ms+0)+0),f
	goto	u2317
	decfsz	((??_delay_ms+0)+0+1),f
	goto	u2317
opt asmopt_on

	line	119
	
l1410:	
	line	117
	movlw	low(01h)
	subwf	(delay_ms@ui_value),f
	movlw	high(01h)
	skipc
	decf	(delay_ms@ui_value+1),f
	subwf	(delay_ms@ui_value+1),f
	movlw	high(0FFFFh)
	xorwf	((delay_ms@ui_value+1)),w
	skipz
	goto	u2235
	movlw	low(0FFFFh)
	xorwf	((delay_ms@ui_value)),w
u2235:

	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l4092
u2230:
	goto	l1413
	
l1412:	
	line	120
	
l1413:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_seg7_initialize
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _seg7_initialize *****************
;; Defined at:
;;		line 52 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
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
psect	text158
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\seg7.c"
	line	52
	global	__size_of_seg7_initialize
	__size_of_seg7_initialize	equ	__end_of_seg7_initialize-_seg7_initialize
	
_seg7_initialize:	
	opt	stack 7
; Regs used in _seg7_initialize: [wreg+status,2]
	line	53
	
l4078:	
;seg7.c: 53: RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	54
;seg7.c: 54: RE0 = 0;
	bcf	(72/8),(72)&7
	line	55
	
l4080:	
;seg7.c: 55: PORTD = (PORTD & 0xf0) | 0x0A;
	movf	(8),w
	andlw	0F0h
	iorlw	0Ah
	movwf	(8)	;volatile
	line	56
	
l4082:	
;seg7.c: 56: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_seg7_initialize+0)+0+1),f
	movlw	125
movwf	((??_seg7_initialize+0)+0),f
u2327:
	decfsz	((??_seg7_initialize+0)+0),f
	goto	u2327
	decfsz	((??_seg7_initialize+0)+0+1),f
	goto	u2327
opt asmopt_on

	line	57
	
l4084:	
;seg7.c: 57: RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	58
	
l4086:	
;seg7.c: 58: RE0 = 1;
	bsf	(72/8),(72)&7
	line	59
	
l4088:	
;seg7.c: 59: PORTD = PORTD & 0xf0;
	movf	(8),w
	andlw	0F0h
	movwf	(8)	;volatile
	line	60
	
l2106:	
	return
	opt stack 0
GLOBAL	__end_of_seg7_initialize
	__end_of_seg7_initialize:
;; =============== function _seg7_initialize ends ============

	signat	_seg7_initialize,88
	global	___awmod
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:

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
psect	text159
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l3816:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u1571
	goto	u1570
u1571:
	goto	l3820
u1570:
	line	10
	
l3818:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l3820
	line	12
	
l3008:	
	line	13
	
l3820:	
	btfss	(___awmod@divisor+1),7
	goto	u1581
	goto	u1580
u1581:
	goto	l3824
u1580:
	line	14
	
l3822:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l3824
	
l3009:	
	line	15
	
l3824:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u1591
	goto	u1590
u1591:
	goto	l3842
u1590:
	line	16
	
l3826:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l3832
	
l3012:	
	line	18
	
l3828:	
	movlw	01h
	
u1605:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u1605
	line	19
	
l3830:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l3832
	line	20
	
l3011:	
	line	17
	
l3832:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u1611
	goto	u1610
u1611:
	goto	l3828
u1610:
	goto	l3834
	
l3013:	
	goto	l3834
	line	21
	
l3014:	
	line	22
	
l3834:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u1625
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u1625:
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l3838
u1620:
	line	23
	
l3836:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l3838
	
l3015:	
	line	24
	
l3838:	
	movlw	01h
	
u1635:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u1635
	line	25
	
l3840:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u1641
	goto	u1640
u1641:
	goto	l3834
u1640:
	goto	l3842
	
l3016:	
	goto	l3842
	line	26
	
l3010:	
	line	27
	
l3842:	
	movf	(___awmod@sign),w
	skipz
	goto	u1650
	goto	l3846
u1650:
	line	28
	
l3844:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l3846
	
l3017:	
	line	29
	
l3846:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l3018
	
l3848:	
	line	30
	
l3018:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:

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
psect	text160
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l3652:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u1101
	goto	u1100
u1101:
	goto	l3656
u1100:
	line	11
	
l3654:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l3656
	line	13
	
l2940:	
	line	14
	
l3656:	
	btfss	(___awdiv@dividend+1),7
	goto	u1111
	goto	u1110
u1111:
	goto	l3662
u1110:
	line	15
	
l3658:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l3660:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l3662
	line	17
	
l2941:	
	line	18
	
l3662:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l3664:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u1121
	goto	u1120
u1121:
	goto	l3684
u1120:
	line	20
	
l3666:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l3672
	
l2944:	
	line	22
	
l3668:	
	movlw	01h
	
u1135:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u1135
	line	23
	
l3670:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l3672
	line	24
	
l2943:	
	line	21
	
l3672:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u1141
	goto	u1140
u1141:
	goto	l3668
u1140:
	goto	l3674
	
l2945:	
	goto	l3674
	line	25
	
l2946:	
	line	26
	
l3674:	
	movlw	01h
	
u1155:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u1155
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u1165
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u1165:
	skipc
	goto	u1161
	goto	u1160
u1161:
	goto	l3680
u1160:
	line	28
	
l3676:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l3678:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l3680
	line	30
	
l2947:	
	line	31
	
l3680:	
	movlw	01h
	
u1175:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u1175
	line	32
	
l3682:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u1181
	goto	u1180
u1181:
	goto	l3674
u1180:
	goto	l3684
	
l2948:	
	goto	l3684
	line	33
	
l2942:	
	line	34
	
l3684:	
	movf	(___awdiv@sign),w
	skipz
	goto	u1190
	goto	l3688
u1190:
	line	35
	
l3686:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l3688
	
l2949:	
	line	36
	
l3688:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2950
	
l3690:	
	line	37
	
l2950:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_adc_initialize
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\adc.c"
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
psect	text161
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 3\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l3192:	
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
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
