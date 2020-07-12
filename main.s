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

EMA 	MOV R8,0
		BL  INF ; Se regresa al Branch INF para generar un loop infinito
		
		END
