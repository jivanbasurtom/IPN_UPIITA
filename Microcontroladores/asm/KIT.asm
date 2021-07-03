	PROCESSOR	P16F887
	INCLUDE		<P16F887.INC>

	;_CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
	;_CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)



CT0	EQU	0x20

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
	MOVLW	0xD6
	MOVWF	OPTION_REG
	BANKSEL	PORTA
C_P
	CLRF	PORTB

	MOVLW	0x81
	MOVWF	PORTB
	CALL	R.5S
	CLRF	PORTB

	MOVLW	0x42
	MOVWF	PORTB
	CALL	R.5S
	CLRF	PORTB

	MOVLW	0x24
	MOVWF	PORTB
	CALL	R.5S
	CLRF	PORTB

	MOVLW	0x18
	MOVWF	PORTB
	CALL	R.5S
	CLRF	PORTB
	
	MOVLW	0x24
	MOVWF	PORTB
	CALL	R.5S
	CLRF	PORTB

	MOVLW	0x42
	MOVWF	PORTB
	CALL	R.5S
	
	
	GOTO	C_P

	
R.5S
	MOVLW	0x41
	MOVWF	CT0	
CIT0	
	CLRF	TMR0
E64	BTFSS	TMR0,6
	GOTO	E64
	DECFSZ	CT0,F
	GOTO	CIT0
	END