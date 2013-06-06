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
# 32 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\Main E_8.c"
	psect config,class=CONFIG,delta=2 ;#
# 32 "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\Main E_8.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFBF & 0xFF7F ;#
	FNCALL	_main,_adc_initialize
	FNCALL	_main,_pwm_initialize
	FNCALL	_main,_adc_on
	FNCALL	_main,_ui_adc_read
	FNCALL	_main,_pwm_set_duty_cycle
	FNROOT	_main
	global	_ADRESH
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
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
	global	_CCP1M2
_CCP1M2	set	186
	global	_CCP1M3
_CCP1M3	set	187
	global	_CCP1X
_CCP1X	set	189
	global	_CCP1Y
_CCP1Y	set	188
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
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_T2CKPS0
_T2CKPS0	set	144
	global	_T2CKPS1
_T2CKPS1	set	145
	global	_TMR2ON
_TMR2ON	set	146
	global	_ADRESL
_ADRESL	set	158
	global	_PR2
_PR2	set	146
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
	file	"Example8.as"
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
	global	?_pwm_initialize
?_pwm_initialize:	; 0 bytes @ 0x0
	global	??_pwm_initialize
??_pwm_initialize:	; 0 bytes @ 0x0
	global	?_pwm_set_duty_cycle
?_pwm_set_duty_cycle:	; 0 bytes @ 0x0
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
	global	pwm_set_duty_cycle@ui_duty_cycle
pwm_set_duty_cycle@ui_duty_cycle:	; 2 bytes @ 0x0
	ds	2
	global	??_pwm_set_duty_cycle
??_pwm_set_duty_cycle:	; 0 bytes @ 0x2
	global	??_ui_adc_read
??_ui_adc_read:	; 0 bytes @ 0x2
	ds	2
	global	ui_adc_read@temp
ui_adc_read@temp:	; 2 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
	global	main@speed
main@speed:	; 2 bytes @ 0x6
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
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
;; (0) _main                                                 2     2      0      75
;;                                              6 COMMON     2     2      0
;;                     _adc_initialize
;;                     _pwm_initialize
;;                             _adc_on
;;                        _ui_adc_read
;;                 _pwm_set_duty_cycle
;; ---------------------------------------------------------------------------------
;; (1) _ui_adc_read                                          6     4      2      30
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _pwm_set_duty_cycle                                   4     2      2      30
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _pwm_initialize                                       0     0      0       0
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
;;   _pwm_initialize
;;   _adc_on
;;   _ui_adc_read
;;   _pwm_set_duty_cycle
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
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
;;		line 57 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\Main E_8.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  speed           2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  1395[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_adc_initialize
;;		_pwm_initialize
;;		_adc_on
;;		_ui_adc_read
;;		_pwm_set_duty_cycle
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\Main E_8.c"
	line	57
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	58
	
l4065:	
;Main E_8.c: 58: unsigned int speed = 0;
	clrf	(main@speed)
	clrf	(main@speed+1)
	line	60
;Main E_8.c: 60: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	61
;Main E_8.c: 61: PORTB = 0;
	clrf	(6)	;volatile
	line	62
;Main E_8.c: 62: PORTC = 0;
	clrf	(7)	;volatile
	line	63
;Main E_8.c: 63: PORTD = 0;
	clrf	(8)	;volatile
	line	64
;Main E_8.c: 64: PORTE = 0;
	clrf	(9)	;volatile
	line	70
	
l4067:	
;Main E_8.c: 70: TRISA = 0b00010001;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	71
	
l4069:	
;Main E_8.c: 71: TRISB = 0b00001111;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	72
	
l4071:	
;Main E_8.c: 72: TRISC = 0b10010011;
	movlw	(093h)
	movwf	(135)^080h	;volatile
	line	73
	
l4073:	
;Main E_8.c: 73: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	74
	
l4075:	
;Main E_8.c: 74: TRISE = 0;
	clrf	(137)^080h	;volatile
	line	77
	
l4077:	
;Main E_8.c: 77: adc_initialize();
	fcall	_adc_initialize
	line	80
	
l4079:	
;Main E_8.c: 80: pwm_initialize();
	fcall	_pwm_initialize
	line	88
	
l4081:	
;Main E_8.c: 88: adc_on();
	fcall	_adc_on
	line	89
	
l4083:	
;Main E_8.c: 89: RB4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	90
	
l4085:	
;Main E_8.c: 90: RB5 = 0;
	bcf	(53/8),(53)&7
	goto	l4087
	line	92
;Main E_8.c: 92: while(1)
	
l1396:	
	line	94
	
l4087:	
;Main E_8.c: 93: {
;Main E_8.c: 94: speed = ui_adc_read();
	fcall	_ui_adc_read
	movf	(1+(?_ui_adc_read)),w
	clrf	(main@speed+1)
	addwf	(main@speed+1)
	movf	(0+(?_ui_adc_read)),w
	clrf	(main@speed)
	addwf	(main@speed)

	line	95
	
l4089:	
;Main E_8.c: 95: pwm_set_duty_cycle(speed);
	movf	(main@speed+1),w
	clrf	(?_pwm_set_duty_cycle+1)
	addwf	(?_pwm_set_duty_cycle+1)
	movf	(main@speed),w
	clrf	(?_pwm_set_duty_cycle)
	addwf	(?_pwm_set_duty_cycle)

	fcall	_pwm_set_duty_cycle
	goto	l4087
	line	96
	
l1397:	
	line	92
	goto	l4087
	
l1398:	
	goto	l1400
	line	97
;Main E_8.c: 96: }
;Main E_8.c: 97: while(1) continue;
	
l1399:	
	
l1400:	
	goto	l1400
	
l1401:	
	line	98
	
l1402:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_ui_adc_read
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _ui_adc_read *****************
;; Defined at:
;;		line 104 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\adc.c"
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
psect	text129
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\adc.c"
	line	104
	global	__size_of_ui_adc_read
	__size_of_ui_adc_read	equ	__end_of_ui_adc_read-_ui_adc_read
	
_ui_adc_read:	
	opt	stack 7
; Regs used in _ui_adc_read: [wreg+status,2+status,0+btemp+1]
	line	105
	
l4045:	
;adc.c: 105: unsigned int temp = 0;
	clrf	(ui_adc_read@temp)
	clrf	(ui_adc_read@temp+1)
	line	107
	
l4047:	
;adc.c: 107: CHS2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(253/8),(253)&7
	line	108
	
l4049:	
;adc.c: 108: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	109
	
l4051:	
;adc.c: 109: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	112
	
l4053:	
;adc.c: 112: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_ui_adc_read+0)+0+1),f
	movlw	125
movwf	((??_ui_adc_read+0)+0),f
u2277:
	decfsz	((??_ui_adc_read+0)+0),f
	goto	u2277
	decfsz	((??_ui_adc_read+0)+0+1),f
	goto	u2277
opt asmopt_on

	line	119
	
l4055:	
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
	goto	u2261
	goto	u2260
u2261:
	goto	l696
u2260:
	goto	l4057
	
l698:	
	line	124
	
l4057:	
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
	
l4059:	
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
	
l4061:	
;adc.c: 126: return temp;
	movf	(ui_adc_read@temp+1),w
	clrf	(?_ui_adc_read+1)
	addwf	(?_ui_adc_read+1)
	movf	(ui_adc_read@temp),w
	clrf	(?_ui_adc_read)
	addwf	(?_ui_adc_read)

	goto	l699
	
l4063:	
	line	127
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_ui_adc_read
	__end_of_ui_adc_read:
;; =============== function _ui_adc_read ends ============

	signat	_ui_adc_read,90
	global	_pwm_set_duty_cycle
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _pwm_set_duty_cycle *****************
;; Defined at:
;;		line 62 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\pwm.c"
;; Parameters:    Size  Location     Type
;;  ui_duty_cycl    2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
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
psect	text130
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\pwm.c"
	line	62
	global	__size_of_pwm_set_duty_cycle
	__size_of_pwm_set_duty_cycle	equ	__end_of_pwm_set_duty_cycle-_pwm_set_duty_cycle
	
_pwm_set_duty_cycle:	
	opt	stack 7
; Regs used in _pwm_set_duty_cycle: [wreg+status,2+status,0]
	line	63
	
l3175:	
;pwm.c: 63: CCP1CON = (CCP1CON & 0b11001111) | (0b00110000 & ((unsigned char)(ui_duty_cycle << 4)));
	movf	(pwm_set_duty_cycle@ui_duty_cycle),w
	movwf	(??_pwm_set_duty_cycle+0)+0
	movlw	04h
u15:
	clrc
	rlf	(??_pwm_set_duty_cycle+0)+0,f
	addlw	-1
	skipz
	goto	u15
	movlw	(030h)
	andwf	0+(??_pwm_set_duty_cycle+0)+0,w
	movwf	(??_pwm_set_duty_cycle+1)+0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(23),w
	andlw	0CFh
	iorwf	0+(??_pwm_set_duty_cycle+1)+0,w
	movwf	(23)	;volatile
	line	64
;pwm.c: 64: CCPR1L = ui_duty_cycle >> 2;
	movf	(pwm_set_duty_cycle@ui_duty_cycle+1),w
	movwf	(??_pwm_set_duty_cycle+0)+0+1
	movf	(pwm_set_duty_cycle@ui_duty_cycle),w
	movwf	(??_pwm_set_duty_cycle+0)+0
	movlw	02h
u25:
	clrc
	rrf	(??_pwm_set_duty_cycle+0)+1,f
	rrf	(??_pwm_set_duty_cycle+0)+0,f
	addlw	-1
	skipz
	goto	u25
	movf	0+(??_pwm_set_duty_cycle+0)+0,w
	movwf	(21)	;volatile
	line	65
	
l2102:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_set_duty_cycle
	__end_of_pwm_set_duty_cycle:
;; =============== function _pwm_set_duty_cycle ends ============

	signat	_pwm_set_duty_cycle,4216
	global	_pwm_initialize
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _pwm_initialize *****************
;; Defined at:
;;		line 29 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\pwm.c"
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
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\pwm.c"
	line	29
	global	__size_of_pwm_initialize
	__size_of_pwm_initialize	equ	__end_of_pwm_initialize-_pwm_initialize
	
_pwm_initialize:	
	opt	stack 7
; Regs used in _pwm_initialize: [wreg+status,2]
	line	31
	
l3155:	
;pwm.c: 31: PR2 = 0xff;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	32
	
l3157:	
;pwm.c: 32: T2CKPS1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(145/8),(145)&7
	line	33
	
l3159:	
;pwm.c: 33: T2CKPS0 = 1;
	bsf	(144/8),(144)&7
	line	35
	
l3161:	
;pwm.c: 35: CCPR1L = 0;
	clrf	(21)	;volatile
	line	36
	
l3163:	
;pwm.c: 36: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	38
	
l3165:	
;pwm.c: 38: CCP1M3 = 1;
	bsf	(187/8),(187)&7
	line	39
	
l3167:	
;pwm.c: 39: CCP1M2 = 1;
	bsf	(186/8),(186)&7
	line	41
	
l3169:	
;pwm.c: 41: CCP1X = 0;
	bcf	(189/8),(189)&7
	line	42
	
l3171:	
;pwm.c: 42: CCP1Y = 0;
	bcf	(188/8),(188)&7
	line	43
	
l3173:	
;pwm.c: 43: CCPR1L = 0x00;
	clrf	(21)	;volatile
	line	44
	
l2099:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_initialize
	__end_of_pwm_initialize:
;; =============== function _pwm_initialize ends ============

	signat	_pwm_initialize,88
	global	_adc_on
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _adc_on *****************
;; Defined at:
;;		line 61 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\adc.c"
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
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\adc.c"
	line	61
	global	__size_of_adc_on
	__size_of_adc_on	equ	__end_of_adc_on-_adc_on
	
_adc_on:	
	opt	stack 7
; Regs used in _adc_on: []
	line	63
	
l3151:	
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
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:

;; *************** function _adc_initialize *****************
;; Defined at:
;;		line 27 in file "E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\adc.c"
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
psect	text133
	file	"E:\Cytron SVN\PTK40A (PIC Training Kit)\Source Code\Examples\Example 8\adc.c"
	line	27
	global	__size_of_adc_initialize
	__size_of_adc_initialize	equ	__end_of_adc_initialize-_adc_initialize
	
_adc_initialize:	
	opt	stack 7
; Regs used in _adc_initialize: []
	line	29
	
l3149:	
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
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
