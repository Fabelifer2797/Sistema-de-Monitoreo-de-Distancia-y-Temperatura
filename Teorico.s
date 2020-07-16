;Se renombran los registros que se  van a utilizar para los inputs
;Notaciónes: C = Cámara, T = Térmica, D = Distancia

CT			RN			R0
CD			RN			R1

;Se asignan etiquetas para los espacios de memoria RAM donde se almacenaran los ouputs
;La memoria RAM comienza en la dirección 0x20000000
;Notaciones: S = Salida, SE = Server, LCD = LCD
;Cada dirección de memoria apunta a un bloque de 4 bytes de tamaño

SB			EQU		0x20000000	;se asigna la etiqueta salida de bocina al espacio de memoria
SL			EQU		0x20000004	;se asigna la etiqueta salida de LED al espacio de memoria
SBOC		EQU 	0x20000008	;se asigna la etiqueta salida de BOZZER al espacio de memoria
SLCD		EQU		0x2000000C	;se asigna la etiqueta salida del LCD al espacio de memoria
	

; Definicion de Pines para la coneccion con el LCD
P04		EQU		0	;Corresponde al pin que se conecta al pin RS del LCD 
P05		EQU		0	;Corresponde al pin que se conecta al pin RW del LCD 
P06		EQU		0	;Corresponde al pin que se conecta al pin E del LCD 

P012	EQU		0	;Corresponde al pin que se conecta al pin D4 del LCD 
P013	EQU		0	;Corresponde al pin que se conecta al pin D5 del LCD 
PO14	EQU		0	;Corresponde al pin que se conecta al pin D6 del LCD 
P015	EQU		0	;Corresponde al pin que se conecta al pin D7 del LCD 
	

; Mensajes en hexadecimal que se le envian al LCD
LCDSA1		EQU		5468652073	;corresponde a la parte 1 del mensaje  "sin alerta" que se envia al LCD
LCDSA2		EQU		797374656D	;corresponde a la parte 2 del mensaje  "sin alerta" que se envia al LCD
LCDSA3		EQU		2068617320	;corresponde a la parte 3 del mensaje  "sin alerta" que se envia al LCD
LCDSA4		EQU		6E6F742064	;corresponde a la parte 4 del mensaje  "sin alerta" que se envia al LCD
LCDSA5		EQU		6574656374	;corresponde a la parte 5 del mensaje  "sin alerta" que se envia al LCD
LCDSA6		EQU		656420616E	;corresponde a la parte 6 del mensaje  "sin alerta" que se envia al LCD
LCDSA7		EQU		20616C6572	;corresponde a la parte 7 del mensaje  "sin alerta" que se envia al LCD
LCDSA8		EQU		7420736967	;corresponde a la parte 8 del mensaje  "sin alerta" que se envia al LCD
LCDSA9		EQU		6E616C0A00	;corresponde a la parte 9 del mensaje  "sin alerta" que se envia al LCD

LCDTI1		EQU		6E616C0A00	;corresponde a la parte 1 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI2		EQU		5468652073	;corresponde a la parte 2 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI3		EQU		797374656D	;corresponde a la parte 3 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI4		EQU		2064657465	;corresponde a la parte 4 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI5		EQU		6374656420	;corresponde a la parte 5 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI6		EQU		616E20696C	;corresponde a la parte 6 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI7		EQU		6C6567616C	;corresponde a la parte 7 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI8		EQU		2074656D70	;corresponde a la parte 8 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI9		EQU		6572617475	;corresponde a la parte 9 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI10		EQU		7265000000	;corresponde a la parte 10 del mensaje  "temperatura ilegal" que se envia al LCD

LCDDI1		EQU		5468652073	;corresponde a la parte 1 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI2		EQU		797374656D	;corresponde a la parte 2 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI3		EQU		2064657465	;corresponde a la parte 3 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI4		EQU		6374656420	;corresponde a la parte 4 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI5		EQU		616E20756E	;corresponde a la parte 5 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI6		EQU		6163636570	;corresponde a la parte 6 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI7		EQU		7461626C65	;corresponde a la parte 7 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI8		EQU		2064697374	;corresponde a la parte 8 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI9		EQU		616E636500	;corresponde a la parte 9 del mensaje  "distancia ilegal" que se envia al LCD

;Se asignan etiquetas para las constantes de 0 y 1 que se usaran para mostrar el valor de los outputs que irán a las alarmas

TRUE		EQU		1
FALSE		EQU		0


;Código del programa principal

		AREA Main, CODE, READONLY
		ENTRY
		EXPORT	__main
		
__main

; Conjunto de Branches que representan el esqueleto del código

INF		BL		GDC   ; Branch de la subrutina GDC = Get de los Datos de las Cámaras
		BL		PDS   ; Branch de la subrutina PDS = Post de los Datos al Server
		BL		GMA   ; Branch de la subrutina GMA = Get del Mensaje y de la Alarma
		BL 		SDE	  ; Branch de la subrutina SDE = Subrutina de Envio
		BL      EMA   ; Branch de la subrutina EMA = Escritura del Mensaje en el LCD y activar las Alarmas
		
; Paso #1		
; Subrutina que se encarga de hacer el request GET de los datos de la cámara térmica y de la cámara de distancia

GDC 	MOV R5,0

;Paso #2
; Subrutina que se encarga de hacer el request POST de los datos obtenidos de las cámaras al Server del sistema

PDS		MOV R6,1

;Paso #3
; Subrutina que se encarga de hacer el request GET al Server del Mensaje de que se proyectará en el LCD y del código de activación de las alarmas

GMA		MOV R7,1


; Paso #4
; Subrutina de envio al LCD

SDE		LDR R6,=P04	;Se inicializa el pin 4 que corresponde al RS del LCD
			STR TRUE,[R6] ;RS = 1
			LDR R8,=P06	;Se inicializa el pin 6 que corresponde al E del LCD
			STR TRUE,[R8] ;E = 1
			LDR R7,=P05	;Se inicializa el pin 5 que corresponde al RW del LCD
			STR FALSE,[R7] ;RW = 0
			
			MOV R9,#2
	DL2		SUB R9,R9,#1	;delay de 2 milisegundos
			B	DL2
			
			MOV R8,FALSE	;EN = 0
			
			MOV R9,#5
	DL5		SUB R9,R9,#1	;delay de 5 milisegundos
			B	DL5


; Paso #5
; Subrutina que se encarga de mandar al LCD el mensaje obtenido através del servidor y de activar o no las alarmas dependiendo de lo obtenido por el Server		
	
EMA 	CMP #MENSAJE,#1
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA1,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA2,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA3,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA4,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA5,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA6,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA7,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA8,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDSA9,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
			
		BEQ DONE

		CMP #MENSAJE,#2
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI1,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI2,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI3,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI4,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI5,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI6,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI7,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI8,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI9,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
			
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDTI10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio	
			
		BEQ DONE

		CMP #MENSAJE,#3
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI2,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI3,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI4,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI5,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI6,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI7,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI8,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, = SLDC	;Se inicializa la salida de datos al LCD
		STR LCDDI9,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
			
		BEQ DONE

	DONE	
			CMP R2,TRUE	;if alarma == 1
			BNE L1
			LDR    R1,  =SL
			LDR    R0,  [R1]
			ORR.W  R0,  #0x08	;enciende el LED
			STR    R0,  [R1]
			B L2	
		L1
			LDR	   R1,  =SL
			LDR	   R0,  [R1]
			AND.W  R0,  #0xFFFF0FFF	;apaga el LED
			STR	   R0,  [R1]
		L2
			
			BL  INF ; Se regresa al Branch INF para generar un loop infinito
			
			END
