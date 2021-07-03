	PROCESSOR	P16F887
	INCLUDE		<P16F887.INC>

	;_CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
	;_CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)



CT0		EQU		0x20
NX		EQU		0x21
	
		ORG	0x00
		BANKSEL	ANSEL
		CLRF	ANSEL
		CLRF	ANSELH
		BANKSEL	TRISA
		MOVLW	0xFF
		MOVWF	TRISA
		CLRF	TRISB
		CLRF	TRISC
		CLRF	TRISD
		CLRF	TRISE
		MOVLW	0xD7
		MOVWF	OPTION_REG
		BANKSEL	PORTA
		MOVF	0X01,W
		MOVWF	NX
C_P
		BSF		PORTB,RB0
		CALL	RVX
		BCF		PORTB,RB0
		CALL	RF
		GOTO	C_P

RVX		CLRF	TMR0
C_NX	MOVF	TMR0,W
		SUBWF	NX,W
		BTFSS	STATUS,Z
		GOTO	C_NX
		INCFSZ	NX,F
		GOTO	F_F
		BSF		NX,0
F_F		RETURN

RF		CLRF	TMR0
EBI		BTFSS	TMR0,1
		GOTO	EBI
		RETURN
	
		END