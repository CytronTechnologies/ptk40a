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
# 31 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
	psect config,class=CONFIG,delta=2 ;#
# 31 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_beep
	FNCALL	_main,_adc_on
	FNCALL	_main,_ui_adc_read
	FNCALL	_main,_delay_10us
	FNCALL	_main,_delay_ms
	FNCALL	_beep,_delay_ms
	FNROOT	_main
	global	_ADRESH
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:
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
	global	_RE2
_RE2	set	74
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
	file	"Example10.as"
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
	global	?_delay_10us
?_delay_10us:	; 0 bytes @ 0x0
	global	??_delay_10us
??_delay_10us:	; 0 bytes @ 0x0
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_adc_initialize
?_adc_initialize:	; 0 bytes @ 0x0
	global	??_adc_initialize
??_adc_initialize:	; 0 bytes @ 0x0
	global	?_adc_on
?_adc_on:	; 0 bytes @ 0x0
	global	??_adc_on
??_adc_on:	; 0 bytes @ 0x0
	global	?_ui_adc_read
?_ui_adc_read:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	delay_ms@ui_value
delay_ms@ui_value:	; 2 bytes @ 0x0
	ds	1
	global	delay_10us@uc_value
delay_10us@uc_value:	; 1 bytes @ 0x1
	ds	1
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	??_ui_adc_read
??_ui_adc_read:	; 0 bytes @ 0x2
	ds	2
	global	??_beep
??_beep:	; 0 bytes @ 0x4
	global	beep@uc_count
beep@uc_count:	; 1 bytes @ 0x4
	global	ui_adc_read@temp
ui_adc_read@temp:	; 2 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
	global	main@angle
main@angle:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      10
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_ui_adc_read	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_ui_adc_read
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0     120
;;                                              6 COMMON     4     4      0
;;                     _adc_initialize
;;                               _beep
;;                             _adc_on
;;                        _ui_adc_read
;;                         _delay_10us
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 1     1      0      30
;;                                              4 COMMON     1     1      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _delay_ms                                             4     2      2      15
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _delay_10us                                           2     2      0      15
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _ui_adc_read                                          6     4      2      30
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _adc_on                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _adc_initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _adc_initialize
;;   _beep
;;     _delay_ms
;;   _adc_on
;;   _ui_adc_read
;;   _delay_10us
;;   _delay_ms
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
;;		line 57 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  angle           1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  1397[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_adc_initialize
;;		_beep
;;		_adc_on
;;		_ui_adc_read
;;		_delay_10us
;;		_delay_ms
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
	line	57
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	58
	
l3373:	
;Main E_10.c: 58: unsigned char angle = 0;
	clrf	(main@angle)
	line	60
	
l3375:	
;Main E_10.c: 60: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	61
;Main E_10.c: 61: PORTB = 0;
	clrf	(6)	;volatile
	line	62
;Main E_10.c: 62: PORTC = 0;
	clrf	(7)	;volatile
	line	63
;Main E_10.c: 63: PORTD = 0;
	clrf	(8)	;volatile
	line	64
;Main E_10.c: 64: PORTE = 0;
	clrf	(9)	;volatile
	line	70
	
l3377:	
;Main E_10.c: 70: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	71
	
l3379:	
;Main E_10.c: 71: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	72
	
l3381:	
;Main E_10.c: 72: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	73
	
l3383:	
;Main E_10.c: 73: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	74
	
l3385:	
;Main E_10.c: 74: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	77
	
l3387:	
;Main E_10.c: 77: adc_initialize();
	fcall	_adc_initialize
	line	79
	
l3389:	
;Main E_10.c: 79: beep(2);
	movlw	(02h)
	fcall	_beep
	line	87
	
l3391:	
;Main E_10.c: 87: adc_on();
	fcall	_adc_on
	goto	l3393
	line	90
;Main E_10.c: 90: while(1)
	
l1398:	
	line	92
	
l3393:	
;Main E_10.c: 91: {
;Main E_10.c: 92: angle = ui_adc_read()>>2;
	fcall	_ui_adc_read
	movf	(0+?_ui_adc_read),w
	movwf	(??_main+0)+0
	movf	(1+?_ui_adc_read),w
	movwf	((??_main+0)+0+1)
	movlw	02h
u2265:
	clrc
	rrf	(??_main+0)+1,f
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2265
	movf	0+(??_main+0)+0,w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	(main@angle)
	line	94
	
l3395:	
;Main E_10.c: 94: RE2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(74/8),(74)&7
	line	95
	
l3397:	
;Main E_10.c: 95: delay_10us(50);
	movlw	(032h)
	fcall	_delay_10us
	line	100
	
l3399:	
;Main E_10.c: 100: if (angle <= 130)
	movlw	(083h)
	subwf	(main@angle),w
	skipnc
	goto	u2271
	goto	u2270
u2271:
	goto	l3403
u2270:
	line	102
	
l3401:	
;Main E_10.c: 101: {
;Main E_10.c: 102: delay_10us(angle);
	movf	(main@angle),w
	fcall	_delay_10us
	line	103
;Main E_10.c: 103: }
	goto	l3405
	line	104
	
l1399:	
	line	105
	
l3403:	
;Main E_10.c: 104: else
;Main E_10.c: 105: delay_10us(130);
	movlw	(082h)
	fcall	_delay_10us
	goto	l3405
	
l1400:	
	line	107
	
l3405:	
;Main E_10.c: 107: RE2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	108
;Main E_10.c: 108: delay_ms(18);
	movlw	low(012h)
	movwf	(?_delay_ms)
	movlw	high(012h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l3393
	line	109
	
l1401:	
	line	90
	goto	l3393
	
l1402:	
	goto	l1404
	line	110
;Main E_10.c: 109: }
;Main E_10.c: 110: while(1) continue;
	
l1403:	
	
l1404:	
	goto	l1404
	
l1405:	
	line	111
	
l1406:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_beep
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:

;; *************** function _beep *****************
;; Defined at:
;;		line 166 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
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
psect	text127
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
	line	166
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 6
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@uc_count stored from wreg
	movwf	(beep@uc_count)
	line	167
	
l3365:	
;Main E_10.c: 167: while (uc_count-- > 0) {
	goto	l3371
	
l1422:	
	line	168
;Main E_10.c: 168: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	169
	
l3367:	
;Main E_10.c: 169: delay_ms(80);
	movlw	low(050h)
	movwf	(?_delay_ms)
	movlw	high(050h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	170
	
l3369:	
;Main E_10.c: 170: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	171
;Main E_10.c: 171: delay_ms(100);
	movlw	low(064h)
	movwf	(?_delay_ms)
	movlw	high(064h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	goto	l3371
	line	172
	
l1421:	
	line	167
	
l3371:	
	movlw	low(01h)
	subwf	(beep@uc_count),f
	movf	((beep@uc_count)),w
	xorlw	0FFh
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l1422
u2250:
	goto	l1424
	
l1423:	
	line	173
	
l1424:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,4216
	global	_delay_ms
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 146 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
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
psect	text128
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
	line	146
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 7
; Regs used in _delay_ms: [wreg]
	line	147
	
l3361:	
;Main E_10.c: 147: while (ui_value-- > 0) {
	goto	l1415
	
l1416:	
	line	148
	
l3363:	
;Main E_10.c: 148: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_delay_ms+0)+0+1),f
	movlw	125
movwf	((??_delay_ms+0)+0),f
u2287:
	decfsz	((??_delay_ms+0)+0),f
	goto	u2287
	decfsz	((??_delay_ms+0)+0+1),f
	goto	u2287
opt asmopt_on

	line	149
	
l1415:	
	line	147
	movlw	low(01h)
	subwf	(delay_ms@ui_value),f
	movlw	high(01h)
	skipc
	decf	(delay_ms@ui_value+1),f
	subwf	(delay_ms@ui_value+1),f
	movlw	high(0FFFFh)
	xorwf	((delay_ms@ui_value+1)),w
	skipz
	goto	u2245
	movlw	low(0FFFFh)
	xorwf	((delay_ms@ui_value)),w
u2245:

	skipz
	goto	u2241
	goto	u2240
u2241:
	goto	l3363
u2240:
	goto	l1418
	
l1417:	
	line	150
	
l1418:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_delay_10us
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _delay_10us *****************
;; Defined at:
;;		line 126 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
;; Parameters:    Size  Location     Type
;;  uc_value        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uc_value        1    1[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text129
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\Main E_10.c"
	line	126
	global	__size_of_delay_10us
	__size_of_delay_10us	equ	__end_of_delay_10us-_delay_10us
	
_delay_10us:	
	opt	stack 7
; Regs used in _delay_10us: [wreg+status,2+status,0]
;delay_10us@uc_value stored from wreg
	movwf	(delay_10us@uc_value)
	line	127
	
l3355:	
;Main E_10.c: 127: while (uc_value-- > 0) {
	goto	l3359
	
l1410:	
	line	128
	
l3357:	
;Main E_10.c: 128: _delay((unsigned long)((10)*(20000000/4000000.0)));
	opt asmopt_off
movlw	16
movwf	(??_delay_10us+0)+0,f
u2297:
decfsz	(??_delay_10us+0)+0,f
	goto	u2297
	clrwdt
opt asmopt_on

	goto	l3359
	line	129
	
l1409:	
	line	127
	
l3359:	
	movlw	low(01h)
	subwf	(delay_10us@uc_value),f
	movf	((delay_10us@uc_value)),w
	xorlw	0FFh
	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l3357
u2230:
	goto	l1412
	
l1411:	
	line	130
	
l1412:	
	return
	opt stack 0
GLOBAL	__end_of_delay_10us
	__end_of_delay_10us:
;; =============== function _delay_10us ends ============

	signat	_delay_10us,4216
	global	_ui_adc_read
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _ui_adc_read *****************
;; Defined at:
;;		line 104 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\adc.c"
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
psect	text130
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\adc.c"
	line	104
	global	__size_of_ui_adc_read
	__size_of_ui_adc_read	equ	__end_of_ui_adc_read-_ui_adc_read
	
_ui_adc_read:	
	opt	stack 7
; Regs used in _ui_adc_read: [wreg+status,2+status,0+btemp+1]
	line	105
	
l3335:	
;adc.c: 105: unsigned int temp = 0;
	clrf	(ui_adc_read@temp)
	clrf	(ui_adc_read@temp+1)
	line	107
	
l3337:	
;adc.c: 107: CHS2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(253/8),(253)&7
	line	108
	
l3339:	
;adc.c: 108: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	109
	
l3341:	
;adc.c: 109: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	112
	
l3343:	
;adc.c: 112: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_ui_adc_read+0)+0+1),f
	movlw	125
movwf	((??_ui_adc_read+0)+0),f
u2307:
	decfsz	((??_ui_adc_read+0)+0),f
	goto	u2307
	decfsz	((??_ui_adc_read+0)+0+1),f
	goto	u2307
opt asmopt_on

	line	119
	
l3345:	
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
	goto	u2221
	goto	u2220
u2221:
	goto	l696
u2220:
	goto	l3347
	
l698:	
	line	124
	
l3347:	
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
	
l3349:	
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
	
l3351:	
;adc.c: 126: return temp;
	movf	(ui_adc_read@temp+1),w
	clrf	(?_ui_adc_read+1)
	addwf	(?_ui_adc_read+1)
	movf	(ui_adc_read@temp),w
	clrf	(?_ui_adc_read)
	addwf	(?_ui_adc_read)

	goto	l699
	
l3353:	
	line	127
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_ui_adc_read
	__end_of_ui_adc_read:
;; =============== function _ui_adc_read ends ============

	signat	_ui_adc_read,90
	global	_adc_on
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _adc_on *****************
;; Defined at:
;;		line 61 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\adc.c"
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
psect	text131
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\adc.c"
	line	61
	global	__size_of_adc_on
	__size_of_adc_on	equ	__end_of_adc_on-_adc_on
	
_adc_on:	
	opt	stack 7
; Regs used in _adc_on: []
	line	63
	
l2473:	
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
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\adc.c"
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
psect	text132
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 10\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l2471:	
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
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
