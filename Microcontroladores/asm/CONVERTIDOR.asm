	PROCESSOR	P16F887
	INCLUDE		<P16F887.INC>

	__CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
	__CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)
	
VC5		EQU		0x20
VC6		EQU		0x21

		ORG			0x00
		BANKSEL		ANSEL
		MOVLW		0x60
		MOVF		ANSEL
		CLRF		ANSELH
		
		BANKSEL		TRISA
		MOVLW		0xFF
		MOVWF		TRISA
		CLRF		TRISB
		CLRF		TRISC
		CLRF		TRISD
		MOVLW		0x0B
		MOVWF		TRISE
		CLRF		ADCON1
		
		BANKSEL		PORTA
C_P		MOVLW		0xD5
		MOVWF		ADCON0
EAD5	BSF			ADCON0,GO_DONE
		BTFSC		ADCON0,GO_DONE
		GOTO 		EAD5
		MOVF		ADRESH,W
		MOVWF		VC5
		BCF			ADCON0,ADON
		
		MOVLW		0xD9
		MOVWF		ADCON0
EAD6	BSF			ADCON0,GO_DONE
		BTFSC		ADCON0,GO_DONE
		GOTO 		EAD6
		MOVF		ADRESH,W
		MOVWF		VC6
		BCF			ADCON0,ADON
		
		BTFSS		PORTE,RE3
		GOTO		MVC5
		MOVF		VC6,W
		MOVWF		PORTB
		GOTO		F_X
MVC5	MOVF		VC5,
		MOVWF		PORTB
F_X		GOTO		C_P
		END