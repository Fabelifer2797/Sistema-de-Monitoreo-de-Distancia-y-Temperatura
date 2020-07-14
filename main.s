;Se asignan etiquetas para las constantes de 0 y 1 que se usaran para mostrar el valor de los outputs que irán a las alarmas

TRUE		EQU		1
FALSE		EQU		0
	
; Se renombran los registros que se van a utilizar como variables
CT			RN		R0
CD			RN		R1

	
; Se asignan etiquetas para los espacios de memoria RAM donde se almacenaran los ouputs del sistema
; La memoria RAM comienza en la dirección 0x20000000
;Cada dirección de memoria apunta a un bloque de 4 bytes de tamaño

RXPIN		EQU		0x20000000  ; Etiqueta del espacio de memoria donde se asigna el pin RX del ESP8266
TXPIN		EQU		0x20000004  ; Etiqueta del espacio de memoria donde se asigna el pin TX del ESP8266
BRS			EQU		0X20000008	; Etiqueta del espacio de memoria donde se asigna el Baud Rate Serial
EMC1		EQU		0x2000000C  ; Etiqueta del espacio de memoria para el Enable Multiple Connections TCP del Módulo Wifi Parte 1
EMC2		EQU		0x20000010  ; Etiqueta del espacio de memoria para el Enable Multiple Connections TCP del Módulo Wifi Parte 2
EMC3		EQU		0x20000014  ; Etiqueta del espacio de memoria para el Enable Multiple Connections TCP del Módulo Wifi Parte 3
EMC4		EQU		0x20000018  ; Etiqueta del espacio de memoria para el Enable Multiple Connections TCP del Módulo Wifi Parte 4
EMC5		EQU		0x2000001C  ; Etiqueta del espacio de memoria para el Enable Multiple Connections TCP del Módulo Wifi Parte 5
EMC6		EQU		0x20000020  ; Etiqueta del espacio de memoria para el Enable Multiple Connections TCP del Módulo Wifi Parte 6
TCPS1		EQU		0x20000024  ; Etiqueta del espacio de memoria para el TCP Start del Módulo Wifi Parte 1
TCPS2		EQU		0x20000028  ; Etiqueta del espacio de memoria para el TCP Start del Módulo Wifi Parte 2
TCPS3		EQU		0x2000002C  ; Etiqueta del espacio de memoria para el TCP Start del Módulo Wifi Parte 3
TCPS4		EQU		0x20000030  ; Etiqueta del espacio de memoria para el TCP Start del Módulo Wifi Parte 4
TCPS5		EQU		0x20000034  ; Etiqueta del espacio de memoria para el TCP Start del Módulo Wifi Parte 5
TCPS6		EQU		0x20000038  ; Etiqueta del espacio de memoria para el TCP Start del Módulo Wifi Parte 6
TCPS7		EQU		0x2000003C  ; Etiqueta del espacio de memoria para el TCP Start del Módulo Wifi Parte 7	
TCP			EQU		0x20000040  ; Etiqueta del espacio de memoria para el valor de activación de TCP	
IPS1		EQU		0x20000044  ; Etiqueta del espacio de memoria para la IP del Server Parte 1
IPS2		EQU		0x20000048  ; Etiqueta del espacio de memoria para la IP del Server Parte 2	
IPS3		EQU		0x2000004C  ; Etiqueta del espacio de memoria para la IP del Server Parte 3	
IPS4		EQU		0x20000050  ; Etiqueta del espacio de memoria para la IP del Server Parte 4
IPS5		EQU		0x20000054  ; Etiqueta del espacio de memoria para la IP del Server Parte 5
IPS6		EQU		0x20000058  ; Etiqueta del espacio de memoria para la IP del Server Parte 6	
PTCP		EQU		0x2000005C	; Etiqueta del espacio de memoria para el puerto TCP de comunicación con el módulo de Wifi	
EDMW1		EQU		0x20000060  ; Etiqueta del espacio de memoria para el comando de Enviar Datos por medio del Módulo de Wifi Parte 1
EDMW2		EQU		0x20000064  ; Etiqueta del espacio de memoria para el comando de Enviar Datos por medio del Módulo de Wifi Parte 2
EDMW3		EQU		0x20000068  ; Etiqueta del espacio de memoria para el comando de Enviar Datos por medio del Módulo de Wifi Parte 3
EDMW4		EQU		0x2000006C  ; Etiqueta del espacio de memoria para el comando de Enviar Datos por medio del Módulo de Wifi Parte 4
EDMW5		EQU		0x20000070  ; Etiqueta del espacio de memoria para el comando de Enviar Datos por medio del Módulo de Wifi Parte 5
EDMW6		EQU		0x20000074  ; Etiqueta del espacio de memoria para el comando de Enviar Datos por medio del Módulo de Wifi Parte 6
EDMW7		EQU		0x20000078  ; Etiqueta del espacio de memoria para el comando de Enviar Datos por medio del Módulo de Wifi Parte 7
URL1		EQU		0x2000007C  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 1
URL2		EQU		0x20000080  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 2
URL3		EQU		0x20000084  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 3
URL4		EQU		0x20000088  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 4
URL5		EQU		0x2000008C  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 5
URL6		EQU		0x20000090  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 6
URL7		EQU		0x20000094  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 7
URL8		EQU		0x20000098  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 8
URL9		EQU		0x2000009C  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 9
URL10		EQU		0x200000A0  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 10
URL11		EQU		0x200000A4  ; Etiqueta del espacio de memoria para la URL de comunicación Parte 11
G4BS		EQU		0x200000A8	; Etiqueta del espacio de memoria que represeta el GET de 4 Bytes que se obtienen a través de la comunicación serial
DCT			EQU		0x200000AC  ; Etiqueta del espacio de memoria que indica el inicio donde se almacenan los datos de la cámara térmica
DCDD		EQU		0x200002A0	; Etiqueta del espacio de memoria que indica el inicio donde se almacenan los datos de la cámara de distancia





;Código del programa principal

		AREA Main, CODE, READONLY
		ENTRY
		EXPORT	__main
		
__main

; Conjunto de Branches que representan el esqueleto del código
		
		BL		SMW	  ; Branch de la subrutina SMW = Setup del Módulo de Wifi
INF		BL		GDC   ; Branch de la subrutina GDC = Get de los Datos de las Cámaras
		BL		PDS   ; Branch de la subrutina PDS = Post de los Datos al Server
		BL		GMA   ; Branch de la subrutina GMA = Get del Mensaje y de la Alarma
		BL      EMA   ; Branch de la subrutina EMA = Escritura del Mensaje en el LCD y activar las Alarmas
		
		
; Paso #0
; Subrutina que se encarga de hacer el setup de los pines y las condiciones requeridas por el módulo de Wifi ESP8266

		;Se establecen los pines en que va a funcionar el módulo
SMW		MOV R6,#2
		MOV R7,#3
		LDR R8,=RXPIN ; RX se establce en el pin 2
		STR R6,[R8]
		LDR R8,=TXPIN ; TX se establece en el pin 3 
		STR R7,[R8]
		;Se establece el Baudrate de la comunicación serial 
		MOV R6,#9600
		LDR R7,=BRS ; Se inicializa la velocidad de comunicación serial en 9600
		STR R6,[R7]
		
		;Se alamcena un valor simbólico en el espacio de memoria donde se obtendrían los 4 bytes al hacer un GET al Server del sistema
		MOV R7,0x0000FFFF
		LDR R8,=G4BS
		STR R7,[R8]
		
		;Se hace un delay de 2 milisegundos (En este caso se esperan 2 tiempos simbólicos)
		MOV R6,#2
DL2		CBZ	R6,SMW2  ;Básicamente lo saca del loop cuando R6(contador del delay en este caso) sea cero
		SUB R6,R6,#1
		B	DL2 ; Ciclo DL2 = Delay de 2 tiempos
		
SMW2	BX	LR
		
		
		
; Paso #1		
; Subrutina que se encarga de hacer el request GET de los datos de la cámara térmica y de la cámara de distancia

		
		; Establecer conexiones múltiples TCP en el módulo  Wifi, con el comando AT: AT+CIPMUX=1 = 0x41542B4349504D55583D31
GDC 	MOV R7, 0x4154
		LDR R8,=EMC1
		STR R7,[R8]
		MOV R7,0x2B43
		LDR R8,=EMC2
		STR R7,[R8]
		MOV R7,0x4950
		LDR R8,=EMC3
		STR R7,[R8]
		MOV R7,0x4D55
		LDR R8,=EMC4
		STR R7,[R8]
		MOV R7,0x583D
		LDR R8,=EMC5
		STR R7,[R8]
		MOV R7,0x31
		LDR R8,=EMC6
		STR R7,[R8]
		
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL1		CBZ	R7,GDC2  ;Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL1 ; Ciclo DL1 = Primer Delay de 1 tiempo
		
		; Se establece una conexión TCP cliente al servidor del sistema, dando como párametros el IP del Server y el puerto de comunicación
		; Se utiliza el comando AT+CIPSTART=4 = 0x41542b43495053544152543d34 
		
GDC2   	MOV R7, 0x4154
		LDR R8,=TCPS1
		STR R7,[R8]
		MOV R7, 0x2B43
		LDR R8,=TCPS2
		STR R7,[R8]
		MOV R7, 0x4950
		LDR R8,=TCPS3
		STR R7,[R8]
		MOV R7, 0x5354
		LDR R8,=TCPS4
		STR R7,[R8]
		MOV R7, 0x4152
		LDR R8,=TCPS5
		STR R7,[R8]
		MOV R7, 0x543D
		LDR R8,=TCPS6
		STR R7,[R8]
		MOV R7, 0x34
		LDR R8,=TCPS7
		STR R7,[R8]
		
		; Se establece el valor de TCP en 1 para indicar el tipo de conexión
		MOV R7, #1
		LDR R8,=TCP
		STR R7,[R8]
		
		; Se establece el valor de la IP:192.168.1.19 = 0x3139322e3136382e312e310a
		MOV R7, 0x3139
		LDR R8,=IPS1
		STR R7,[R8]
		MOV R7, 0x322E
		LDR R8,=IPS2
		STR R7,[R8]
		MOV R7, 0x3136
		LDR R8,=IPS3
		STR R7,[R8]
		MOV R7, 0x382E
		LDR R8,=IPS4
		STR R7,[R8]
		MOV R7, 0x312E
		LDR R8,=IPS5
		STR R7,[R8]
		MOV R7, 0x310A
		LDR R8,=IPS6
		STR R7,[R8]
		
		; Se define el puerto de comunicación EN 8080
		MOV R7, #8080
		LDR R8,=PTCP
		STR R7,[R8]
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL12	CBZ	R7,GDC3  ;Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL12 ; Ciclo DL12 = Segundo Delay de 1 tiempo
		
		;Establecer el comando AT para poder enviar datos através del módulo de wifi
		;En este caso se utiliza el comando AT+CIPSEND=4 : 0x41542b43495053454e443d340a
GDC3	MOV R7, 0x4154
		LDR R8,=EDMW1
		STR R7,[R8]
		MOV R7, 0x2B43
		LDR R8,=EDMW2
		STR R7,[R8]
		MOV R7, 0x4950
		LDR R8,=EDMW3
		STR R7,[R8]
		MOV R7, 0x5345
		LDR R8,=EDMW4
		STR R7,[R8]
		MOV R7, 0x4E44
		LDR R8,=EDMW5
		STR R7,[R8]
		MOV R7, 0x3D34
		LDR R8,=EDMW6
		STR R7,[R8]
		MOV R7, 0x0A
		LDR R8,=EDMW7
		STR R7,[R8]
		
		;Establecer la URL de Envío, que en este caso corresponde con la Operación GET, para obtener los datos de la cámara térmica
		; GET/CT.html HTTP/1.1 = 0x4745542f43542e68746d6c20485454502f312e31
		MOV R7, 0x4745
		LDR R8,=URL1
		STR R7,[R8]
		MOV R7, 0x542F
		LDR R8,=URL2
		STR R7,[R8]
		MOV R7, 0x4354
		LDR R8,=URL3
		STR R7,[R8]
		MOV R7, 0x2E68
		LDR R8,=URL4
		STR R7,[R8]
		MOV R7, 0x746D
		LDR R8,=URL5
		STR R7,[R8]
		MOV R7, 0x6C20
		LDR R8,=URL6
		STR R7,[R8]
		MOV R7, 0x4854
		LDR R8,=URL7
		STR R7,[R8]
		MOV R7, 0x5450
		LDR R8,=URL8
		STR R7,[R8]
		MOV R7, 0x2F31
		LDR R8,=URL9
		STR R7,[R8]
		MOV R7, 0x2E31
		LDR R8,=URL10
		STR R7,[R8]
		
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL13	CBZ	R7,GDC4  ;Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL13 ; Ciclo DL13 = Tercer Delay de 1 tiempo
		
		
		
		; Ciclo que realiza el GET de los datos de la cámara térmica
GDC4	MOV R6,#0 ; Se establece el contador en 0
		LDR R7,=G4BS ; Se carga en R7 la dirección de memoria donde se obtienen los datos del GET
		
GDC5	CMP R6,#500 ; El valor real es 153600, para efectos de prueba se deja en 500
		BEQ	GDC6
		LDRNE CT,[R7] ; Se almacena el contenido de la dirección guardada en R7 en el registro de la cámara térmica
		LDRNE R8,=DCT ; Se almacena en R8 la dirección de memoria donde se almacenan los datos de la cámara térmica
		;Para guardar los datos de la cámara se usa como base el valor inicial de R8 y se le suma el offset correspondiente al valor actual del contador
		STRNE CT,[R8,R6] ; Se guarda lo que hay en el registro de la cámara térmica en la dirección de memoria correspondiente
		ADDNE R6,R6,#4 ; Se incrementa el contador en 4, que es tamaño de los bloques de memoria (4 bytes)
		BNE GDC5
	
	
		;Establecer la URL de Envío, que en este caso corresponde con la Operación GET, para obtener los datos de la cámara de distancia
		;GET/CD.html HTTP/1.1 = 0x4745542f43442e68746d6c20485454502f312e31
GDC6	MOV R7, 0x4745
		LDR R8,=URL1
		STR R7,[R8]
		MOV R7, 0x542F
		LDR R8,=URL2
		STR R7,[R8]
		MOV R7, 0x4344
		LDR R8,=URL3
		STR R7,[R8]
		MOV R7, 0x2E68
		LDR R8,=URL4
		STR R7,[R8]
		MOV R7, 0x746D
		LDR R8,=URL5
		STR R7,[R8]
		MOV R7, 0x6C20
		LDR R8,=URL6
		STR R7,[R8]
		MOV R7, 0x4854
		LDR R8,=URL7
		STR R7,[R8]
		MOV R7, 0x5450
		LDR R8,=URL8
		STR R7,[R8]
		MOV R7, 0x2F31
		LDR R8,=URL9
		STR R7,[R8]
		MOV R7, 0x2E31
		LDR R8,=URL10
		STR R7,[R8]
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL14	CBZ	R7,GDC7  ;Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL14 ; Ciclo DL14 = Cuarto Delay de 1 tiempo
		
		
		;Ciclo que realiza el GET de los datos de la cámara de distancia
		;Se almacena otro valor simbólico en el espacio de memoria donde se obtendrían los 4 bytes al hacer un GET al Server del sistema. Esto para revisar en memoria y simular el envío de datos distintos
GDC7	MOV R7,0x0000DDDD
		LDR R8,=G4BS
		STR R7,[R8]
		MOV R6,#0 ; Se establece el contador en 0
		LDR R7,=G4BS ; Se carga en R7 la dirección de memoria donde se obtienen los datos del GET

GDC8	CMP R6,#500 ; El valor real es 4147200, para efectos de prueba se deja en 500
		BEQ	GDC9
		LDRNE CD,[R7] ; Se almacena el contenido de la dirección guardada en R7 en el registro de la cámara de distancia
		LDRNE R8,=DCDD ; Se almacena en R8 la dirección de memoria donde se almacenan los datos de la cámara de distancia
		;Para guardar los datos de la cámara se usa como base el valor inicial de R8 y se le suma el offset correspondiente al valor actual del contador
		STRNE CD,[R8,R6] ; Se guarda lo que hay en el registro de la cámara de distancia en la dirección de memoria correspondiente
		ADDNE R6,R6,#4 ; Se incrementa el contador en 4, que es tamaño de los bloques de memoria (4 bytes)
		BNE GDC8
		
GDC9	BX	LR
		


;Paso #2
; Subrutina que se encarga de hacer el request POST de los datos obtenidos de las cámaras al Server del sistema

PDS		MOV R6,1

;Paso #3
; Subrutina que se encarga de hacer el request GET al Server del Mensaje de que se proyectará en el LCD y del código de activación de las alarmas

GMA		MOV R7,1


; Paso #4
; Subrutina que se encarga de mandar al LCD el mensaje obtenido através del servidor y de activar o no las alarmas dependiendo de lo obtenido por el Server

EMA 	MOV R8,0
		BL  INF ; Se regresa al Branch INF para generar un loop infinito
		
		END
