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
# 31 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
	psect config,class=CONFIG,delta=2 ;#
# 31 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_beep
	FNCALL	_beep,_delay_ms
	FNROOT	_main
	global	_ADRESH
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:
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
	global	_RB1
_RB1	set	49
	global	_RC2
_RC2	set	58
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
	file	"Example2.as"
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
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	delay_ms@ui_value
delay_ms@ui_value:	; 2 bytes @ 0x0
	ds	2
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	ds	2
	global	??_beep
??_beep:	; 0 bytes @ 0x4
	global	beep@uc_count
beep@uc_count:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_beep
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      30
;;                     _adc_initialize
;;                               _beep
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 1     1      0      30
;;                                              4 COMMON     1     1      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (2) _delay_ms                                             4     2      2      15
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _adc_initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _adc_initialize
;;   _beep
;;     _delay_ms
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
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
;;		line 57 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  1389[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_adc_initialize
;;		_beep
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
	line	57
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	59
	
l3352:	
;Main E_2.c: 59: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	60
;Main E_2.c: 60: PORTB = 0;
	clrf	(6)	;volatile
	line	61
;Main E_2.c: 61: PORTC = 0;
	clrf	(7)	;volatile
	line	62
;Main E_2.c: 62: PORTD = 0;
	clrf	(8)	;volatile
	line	63
;Main E_2.c: 63: PORTE = 0;
	clrf	(9)	;volatile
	line	69
	
l3354:	
;Main E_2.c: 69: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	70
	
l3356:	
;Main E_2.c: 70: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	71
	
l3358:	
;Main E_2.c: 71: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	72
	
l3360:	
;Main E_2.c: 72: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	73
	
l3362:	
;Main E_2.c: 73: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	76
	
l3364:	
;Main E_2.c: 76: adc_initialize();
	fcall	_adc_initialize
	line	78
	
l3366:	
;Main E_2.c: 78: beep(2);
	movlw	(02h)
	fcall	_beep
	goto	l3368
	line	85
;Main E_2.c: 85: while(1)
	
l1390:	
	line	87
	
l3368:	
;Main E_2.c: 86: {
;Main E_2.c: 87: if(RB0 == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l1391
u2250:
	line	88
	
l3370:	
;Main E_2.c: 88: RC2 = 1;
	bsf	(58/8),(58)&7
	goto	l3368
	line	90
	
l1391:	
;Main E_2.c: 90: else if (RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l3368
u2260:
	line	91
	
l3372:	
;Main E_2.c: 91: RC2 = 0;
	bcf	(58/8),(58)&7
	goto	l3368
	
l1393:	
	goto	l3368
	line	92
	
l1392:	
	goto	l3368
	
l1394:	
	line	85
	goto	l3368
	
l1395:	
	goto	l1397
	line	94
;Main E_2.c: 92: }
;Main E_2.c: 94: while(1) continue;
	
l1396:	
	
l1397:	
	goto	l1397
	
l1398:	
	line	95
	
l1399:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_beep
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:

;; *************** function _beep *****************
;; Defined at:
;;		line 131 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
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
psect	text101
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
	line	131
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 6
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@uc_count stored from wreg
	movwf	(beep@uc_count)
	line	132
	
l3344:	
;Main E_2.c: 132: while (uc_count-- > 0) {
	goto	l3350
	
l1409:	
	line	133
;Main E_2.c: 133: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	134
	
l3346:	
;Main E_2.c: 134: delay_ms(80);
	movlw	low(050h)
	movwf	(?_delay_ms)
	movlw	high(050h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	135
	
l3348:	
;Main E_2.c: 135: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	136
;Main E_2.c: 136: delay_ms(100);
	movlw	low(064h)
	movwf	(?_delay_ms)
	movlw	high(064h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l3350
	line	137
	
l1408:	
	line	132
	
l3350:	
	movlw	low(01h)
	subwf	(beep@uc_count),f
	movf	((beep@uc_count)),w
	xorlw	0FFh
	skipz
	goto	u2241
	goto	u2240
u2241:
	goto	l1409
u2240:
	goto	l1411
	
l1410:	
	line	138
	
l1411:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,4216
	global	_delay_ms
psect	text102,local,class=CODE,delta=2
global __ptext102
__ptext102:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 111 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
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
psect	text102
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\Main E_2.c"
	line	111
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 6
; Regs used in _delay_ms: [wreg]
	line	112
	
l3340:	
;Main E_2.c: 112: while (ui_value-- > 0) {
	goto	l1402
	
l1403:	
	line	113
	
l3342:	
;Main E_2.c: 113: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay_ms+0)+0+1),f
	movlw	125
movwf	((??_delay_ms+0)+0),f
u2277:
	decfsz	((??_delay_ms+0)+0),f
	goto	u2277
	decfsz	((??_delay_ms+0)+0+1),f
	goto	u2277
opt asmopt_on

	line	114
	
l1402:	
	line	112
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
	goto	l3342
u2230:
	goto	l1405
	
l1404:	
	line	115
	
l1405:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_adc_initialize
psect	text103,local,class=CODE,delta=2
global __ptext103
__ptext103:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\adc.c"
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
psect	text103
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 2\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l2458:	
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
psect	text104,local,class=CODE,delta=2
global __ptext104
__ptext104:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
