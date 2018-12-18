;Registros del SCI

BAUD   EQU $2B
SCCR1  EQU $2C
SCCR2  EQU $2D
SCSR   EQU $2E
SCDR   EQU $2F

       ORG $0000 
       LDX #$1000   ;Para acceder a registros SCI     
	   
;Inicializando al SCI
	
       LDAA #$30
       STAA BAUD,X  ;Velocidad de transmision
       LDAA #$00
       STAA SCCR1,X ;8 bits de datos
       LDAA #$0C
       STAA SCCR2,X  ;Activa transmisor y receptor

bucle
       BSR leer
       BSR enviar
       BRA bucle
	   
leer   BRCLR SCSR,X $20 leer
       LDAA SCDR,X
       RTS
	   
enviar BRCLR SCSR,X $80 enviar
       STAA SCDR,X
       RTS
	   
END