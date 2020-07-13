;Se renombran los registros que se  van a utilizar para los inputs
;Notaci�nes: C = C�mara, T = T�rmica, D = Distancia

CT			RN			R0
CD			RN			R1

;Se renombran los registros que se van a utilizar como variables

BOCINA				RN		R5
LED					RN		R6


;Se asignan etiquetas para los espacios de memoria RAM donde se almacenaran los ouputs
;La memoria RAM comienza en la direcci�n 0x20000000
;Notaciones: S = Salida, SE = Server, LCD = LCD
;Cada direcci�n de memoria apunta a un bloque de 4 bytes de tama�o

SA			EQU		0x20000000	;se asigna la etiqueta salida de alarmas al espacio de memoria
SSE			EQU		0x20000004	;se asigna la etiqueta salida hacia el servidor al espacio de memoria
SLCD		EQU		0x20000008	;se asigna la etiqueta salida del LCD al espacio de memoria
	

;Se asignan etiquetas para las constantes de 0 y 1 que se usaran para mostrar el valor de los outputs que ir�n a las alarmas

TRUE		EQU		1
FALSE		EQU		0


;C�digo del programa principal

		AREA Main, CODE, READONLY
		ENTRY
		EXPORT	__main
		
__main

; Conjunto de Branches que representan el esqueleto del c�digo

INF		BL		GDC   ; Branch de la subrutina GDC = Get de los Datos de las C�maras
		BL		PDS   ; Branch de la subrutina PDS = Post de los Datos al Server
		BL		GMA   ; Branch de la subrutina GMA = Get del Mensaje y de la Alarma
		BL      EMA   ; Branch de la subrutina EMA = Escritura del Mensaje en el LCD y activar las Alarmas
		
		
; Paso #1		
; Subrutina que se encarga de hacer el request GET de los datos de la c�mara t�rmica y de la c�mara de distancia

GDC 	MOV R5,0

;Paso #2
; Subrutina que se encarga de hacer el request POST de los datos obtenidos de las c�maras al Server del sistema

PDS		MOV R6,1

;Paso #3
; Subrutina que se encarga de hacer el request GET al Server del Mensaje de que se proyectar� en el LCD y del c�digo de activaci�n de las alarmas

GMA		MOV R7,1


; Paso #4
; Subrutina que se encarga de mandar al LCD el mensaje obtenido atrav�s del servidor y de activar o no las alarmas dependiendo de lo obtenido por el Server

EMA 	CMP R2,TRUE	;if alarma == 1
		BNE L1
		MOV R5,TRUE	;bocina a 1
		MOV R6,TRUE	;bocina a 1
		B L2
	L1
		MOV R5,FALSE	;bocina a 0
		MOV R6,FALSE	;LED a 0
	L2
		
		
		
		BL  INF ; Se regresa al Branch INF para generar un loop infinito
		
		END