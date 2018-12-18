;Registros del SCI

BAUD   EQU $2B
SCCR1  EQU $2C
SCCR2  EQU $2D
SCSR   EQU $2E
SCDR   EQU $2F

       ORG $0000
	   LDX #$1000
	   
;Inicializando al SCI
	   
	   LDAA #$30
       STAA BAUD,X  ;Velocidad de transmision
       LDAA #$00
       STAA SCCR1,X ;8 bits de datos
       LDAA #$0C
       STAA SCCR2,X  ;Activa transmisor y receptor

bucle  
	   LDY #hola
	   BSR cadena
	   BRA bucle
	   
enviar BRCLR SCSR,X $80 enviar
       STAA SCDR,X
       RTS

cadena LDAA 0,Y
       CMPA #0
       BEQ fin
	   BSR enviar
	   INY
	   BRA cadena
	   RTS
fin

hola   FCC "Hola, mueranse todos"
       FCB 0

END	   