;Se asignan etiquetas para las constantes de 0 y 1 que se usaran para mostrar el valor de los outputs que ir�n a las alarmas

TRUE		EQU		1
FALSE		EQU		0
	
; Se asignan etiquetas para los espacios de memoria RAM donde se almacenaran los ouputs del sistema
; La memoria RAM comienza en la direcci�n 0x20000000
;Cada direcci�n de memoria apunta a un bloque de 4 bytes de tama�o

RXPIN		EQU		0x20000000  ; Etiqueta del espacio de memoria donde se asigna el pin RX del ESP8266
TXPIN		EQU		0x20000004  ; Etiqueta del espacio de memoria donde se asigna el pin TX del ESP8266
BRS			EQU		0X20000008	; Etiqueta del espacio de memoria donde se asigna el Baud Rate Serial




;C�digo del programa principal

		AREA Main, CODE, READONLY
		ENTRY
		EXPORT	__main
		
__main

; Conjunto de Branches que representan el esqueleto del c�digo
		
		BL		SMW	  ; Branch de la subrutina SMW = Setup del M�dulo de Wifi
INF		BL		GDC   ; Branch de la subrutina GDC = Get de los Datos de las C�maras
		BL		PDS   ; Branch de la subrutina PDS = Post de los Datos al Server
		BL		GMA   ; Branch de la subrutina GMA = Get del Mensaje y de la Alarma
		BL      EMA   ; Branch de la subrutina EMA = Escritura del Mensaje en el LCD y activar las Alarmas
		
		
; Paso #0
; Subrutina que se encarga de hacer el setup de los pines y las condiciones requeridas por el m�dulo de Wifi ESP8266

		;Se establecen los pines en que va a funcionar el m�dulo
SMW		MOV R6,#2
		MOV R7,#3
		LDR R8,=RXPIN ; RX se establce en el pin 2
		STR R6,[R8]
		LDR R8,=TXPIN ; TX se establece en el pin 3 
		STR R7,[R8]
		;Se establece el Baudrate de la comunicaci�n serial 
		MOV R6,#9600
		LDR R7,=BRS ; Se inicializa la velocidad de comunicaci�n serial en 9600
		STR R6,[R7]
		;Se hace un delay de 2 milisegundos (En este caso se esperan 2 tiempos simb�licos)
		MOV R6,#2
DL2		CBZ	R6,GDC  ;B�sicamente lo saca del loop cuando R6(contador del delay en este caso) sea cero
		SUB R6,R6,#1
		B	DL2
		
		
		
; Paso #1		
; Subrutina que se encarga de hacer el request GET de los datos de la c�mara t�rmica y de la c�mara de distancia

		 
GDC 	MOV R12,1

;Paso #2
; Subrutina que se encarga de hacer el request POST de los datos obtenidos de las c�maras al Server del sistema

PDS		MOV R6,1

;Paso #3
; Subrutina que se encarga de hacer el request GET al Server del Mensaje de que se proyectar� en el LCD y del c�digo de activaci�n de las alarmas

GMA		MOV R7,1


; Paso #4
; Subrutina que se encarga de mandar al LCD el mensaje obtenido atrav�s del servidor y de activar o no las alarmas dependiendo de lo obtenido por el Server

EMA 	MOV R8,0
		BL  INF ; Se regresa al Branch INF para generar un loop infinito
		
		END
