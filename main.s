; Se asignan etiquetas para las constantes de 0 y 1 que se usaran para mostrar el valor de los outputs que irán a las alarmas

TRUE		EQU		1
FALSE		EQU		0
	
; Se renombran los registros que se van a utilizar como variables
CT			RN		R0 ; CT: Cámara Térmica 
CD			RN		R1 ; CD: Cámara de Distancia	
AS			RN		R2 ; AS: Alarmas provenientes del Server
MS			RN		R3 ; MS: Mensaje del Server que se imprimirá en el LCD

	
; Se asignan etiquetas para los espacios de memoria RAM donde se almacenarán los ouputs del sistema
; La memoria RAM comienza en la dirección 0x20000000
; Cada dirección de memoria apunta a un bloque de 4 bytes de tamaño
; Notaciones: S = Salida, SE = Server, LCD = LCD

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
G4BS		EQU		0x200000A8	; Etiqueta del espacio de memoria que representa el GET de 4 Bytes que se obtienen a través de la comunicación serial
DCT			EQU		0x200000AC  ; Etiqueta del espacio de memoria que indica el inicio donde se almacenan los datos de la cámara térmica
DCDD		EQU		0x200002A0	; Etiqueta del espacio de memoria que indica el inicio donde se almacenan los datos de la cámara de distancia
P4BS		EQU		0x20000494	; Etiqueta del espacio de memoria que representa el POST de 4 Bytes que se mandan a través de la comunicación serial
DMS			EQU		0x20000498  ; Etiqueta del espacio de memoria que indica el inicio donde se almacenan los datos del mensaje obtenido por el server
DAS			EQU		0x200004C4	; Etiqueta del espacio de memoria donde se almacena el activador de las alarmas de acuerdo a lo que diga el server 
SB1			EQU		0x200004C8	; Se asigna la etiqueta salida de bocina al espacio de memoria
SL1			EQU		0x200004CC	; Se asigna la etiqueta salida de LED al espacio de memoria
SBOC		EQU 	0x200004D0	; Se asigna la etiqueta salida de BOZZER al espacio de memoria
SLCD		EQU		0x200004D4	; Se asigna la etiqueta salida del LCD al espacio de memoria
	
; Definicion de Pines para la coneccion con el LCD
P04		   	EQU		0	; Corresponde al pin que se conecta al pin RS del LCD 
P05			EQU		0	; Corresponde al pin que se conecta al pin RW del LCD 
P06			EQU		0	; Corresponde al pin que se conecta al pin E del LCD 
P012		EQU		0	; Corresponde al pin que se conecta al pin D4 del LCD 
P013		EQU		0	; Corresponde al pin que se conecta al pin D5 del LCD 
PO14		EQU		0	; Corresponde al pin que se conecta al pin D6 del LCD 
P015		EQU		0	; Corresponde al pin que se conecta al pin D7 del LCD 
	
; Mensajes en hexadecimal que se le envian al LCD
LCDSA1		EQU		54686520	;corresponde a la parte 1 del mensaje  "sin alerta" que se envia al LCD
LCDSA2		EQU		79737465	;corresponde a la parte 2 del mensaje  "sin alerta" que se envia al LCD
LCDSA3		EQU		20686173	;corresponde a la parte 3 del mensaje  "sin alerta" que se envia al LCD
LCDSA4		EQU		6E6F7420	;corresponde a la parte 4 del mensaje  "sin alerta" que se envia al LCD
LCDSA5		EQU		65746563	;corresponde a la parte 5 del mensaje  "sin alerta" que se envia al LCD
LCDSA6		EQU		65642061	;corresponde a la parte 6 del mensaje  "sin alerta" que se envia al LCD
LCDSA7		EQU		20616C65	;corresponde a la parte 7 del mensaje  "sin alerta" que se envia al LCD
LCDSA8		EQU		74207369	;corresponde a la parte 8 del mensaje  "sin alerta" que se envia al LCD
LCDSA9		EQU		6E616C0A	;corresponde a la parte 9 del mensaje  "sin alerta" que se envia al LCD

LCDTI1		EQU		6E616C0A	;corresponde a la parte 1 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI2		EQU		54686520	;corresponde a la parte 2 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI3		EQU		79737465	;corresponde a la parte 3 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI4		EQU		20646574	;corresponde a la parte 4 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI5		EQU		63746564	;corresponde a la parte 5 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI6		EQU		616E2069	;corresponde a la parte 6 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI7		EQU		6C656761	;corresponde a la parte 7 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI8		EQU		2074656D	;corresponde a la parte 8 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI9		EQU		65726174	;corresponde a la parte 9 del mensaje  "temperatura ilegal" que se envia al LCD
LCDTI10		EQU		72650000	;corresponde a la parte 10 del mensaje  "temperatura ilegal" que se envia al LCD

LCDDI1		EQU		54686520	;corresponde a la parte 1 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI2		EQU		79737465	;corresponde a la parte 2 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI3		EQU		20646574	;corresponde a la parte 3 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI4		EQU		63746564	;corresponde a la parte 4 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI5		EQU		616E2075	;corresponde a la parte 5 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI6		EQU		61636365	;corresponde a la parte 6 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI7		EQU		7461626C	;corresponde a la parte 7 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI8		EQU		20646973	;corresponde a la parte 8 del mensaje  "distancia ilegal" que se envia al LCD
LCDDI9		EQU		616E6365	;corresponde a la parte 9 del mensaje  "distancia ilegal" que se envia al LCD




; Código del programa principal

		AREA Main, CODE, READONLY
		ENTRY
		EXPORT	__main
		
__main

; Conjunto de Branches que representan el esqueleto del código
		
		BL		SMW	  ; Branch de la subrutina SMW = Setup del Módulo de Wifi
INF		BL		GDC   ; Branch de la subrutina GDC = Get de los Datos de las Cámaras
		BL		PDS   ; Branch de la subrutina PDS = Post de los Datos al Server
		BL		GMA   ; Branch de la subrutina GMA = Get del Mensaje y de la Alarma
		BL 		SDE	  ; Branch de la subrutina SDE = Subrutina de Envio
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
		
		; Se establece el Baudrate de la comunicación serial 
		MOV R6,#9600
		LDR R7,=BRS ; Se inicializa la velocidad de comunicación serial en 9600
		LTORG
		STR R6,[R7]
		
		; Se alamcena un valor simbólico en el espacio de memoria donde se obtendrían los 4 bytes al hacer un GET al Server del sistema
		MOV R7,0x0000FFFF
		LDR R8,=G4BS
		STR R7,[R8]
		
		; Se hace un delay de 2 milisegundos (En este caso se esperan 2 tiempos simbólicos)
		MOV R6,#2
DL2		CBZ	R6,SMW2  ; Básicamente lo saca del loop cuando R6(contador del delay en este caso) sea cero
		SUB R6,R6,#1
		B	DL2      ; Ciclo DL2 = Delay de 2 tiempos
				
		
		; Establecer conexiones múltiples TCP en el módulo  Wifi, con el comando AT: AT+CIPMUX=1 = 0x41542B4349504D55583D31
SMW2 	MOV R7, 0x4154
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
DL1		CBZ	R7,SMW3  ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL1      ; Ciclo DL1 = Primer Delay de 1 tiempo
		
		; Se establece una conexión TCP cliente al servidor del sistema, dando como párametros el IP del Server y el puerto de comunicación
		; Se utiliza el comando AT+CIPSTART=4 = 0x41542b43495053544152543d34 
SMW3   	MOV R7, 0x4154
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
DL12	CBZ	R7,SMW4  ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL12     ; Ciclo DL12 = Segundo Delay de 1 tiempo
		
		; Establecer el comando AT para poder enviar datos através del módulo de wifi
		; En este caso se utiliza el comando AT+CIPSEND=4 : 0x41542b43495053454e443d340a
SMW4	MOV R7, 0x4154
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
		BX	LR  ; Se regresa al flujo principal del programa
		
; Paso #1		
; Subrutina que se encarga de hacer el request GET de los datos de la cámara térmica y de la cámara de distancia
		
		; Establecer la URL de Envío, que en este caso corresponde con la Operación GET, para obtener los datos de la cámara térmica
		; GET/CT.html HTTP/1.1 = 0x4745542f43542e68746d6c20485454502f312e31
GDC		MOV R7, 0x4745
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
		MOV R7,#0
		LDR	R8,=URL11
		STR	R7,[R8]
		
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL13	CBZ	R7,GDC2  ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL13     ; Ciclo DL13 = Tercer Delay de 1 tiempo
		
		
		
		; Ciclo que realiza el GET de los datos de la cámara térmica
GDC2	MOV R6,#0     ; Se establece el contador en 0
		LDR R7,=G4BS  ; Se carga en R7 la dirección de memoria donde se obtienen los datos del GET
GDC3	CMP R6,#500   ; El valor real es 153600, para efectos de prueba se deja en 500
		BEQ	GDC4
		LDRNE CT,[R7] ; Se almacena el contenido de la dirección guardada en R7 en el registro de la cámara térmica
		LDRNE R8,=DCT ; Se almacena en R8 la dirección de memoria donde se almacenan los datos de la cámara térmica
		
		; Para guardar los datos de la cámara se usa como base el valor inicial de R8 y se le suma el offset correspondiente al valor actual del contador
		STRNE CT,[R8,R6] ; Se guarda lo que hay en el registro de la cámara térmica en la dirección de memoria correspondiente
		ADDNE R6,R6,#4   ; Se incrementa el contador en 4, que es el tamaño de los bloques de memoria (4 bytes)
		BNE GDC3
	
	
		; Establecer la URL de Envío, que en este caso corresponde con la Operación GET, para obtener los datos de la cámara de distancia
		; GET/CD.html HTTP/1.1 = 0x4745542f43442e68746d6c20485454502f312e31
GDC4	MOV R7, 0x4745
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
		MOV R7,#0
		LDR	R8,=URL11
		STR	R7,[R8]
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL14	CBZ	R7,GDC5  ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL14     ; Ciclo DL14 = Cuarto Delay de 1 tiempo
		
		
		; Ciclo que realiza el GET de los datos de la cámara de distancia
		; Se almacena otro valor simbólico en el espacio de memoria donde se obtendrían los 4 bytes al hacer un GET al Server del sistema. Esto para revisar en memoria y simular el envío de datos distintos
GDC5	MOV R7,0x0000DDDD
		LDR R8,=G4BS
		STR R7,[R8]
		MOV R6,#0    ; Se establece el contador en 0
		LDR R7,=G4BS ; Se carga en R7 la dirección de memoria donde se obtienen los datos del GET
GDC6	CMP R6,#500  ; El valor real es 4147200, para efectos de prueba se deja en 500
		BEQ	GDC7
		LDRNE CD,[R7]  ; Se almacena el contenido de la dirección guardada en R7 en el registro de la cámara de distancia
		LDRNE R8,=DCDD ; Se almacena en R8 la dirección de memoria donde se almacenan los datos de la cámara de distancia
		
		; Para guardar los datos de la cámara se usa como base el valor inicial de R8 y se le suma el offset correspondiente al valor actual del contador
		STRNE CD,[R8,R6] ; Se guarda lo que hay en el registro de la cámara de distancia en la dirección de memoria correspondiente
		ADDNE R6,R6,#4   ; Se incrementa el contador en 4, que es el tamaño de los bloques de memoria (4 bytes)
		BNE GDC6
		
GDC7	BX	LR  ; Se regresa al flujo principal del programa
		


; Paso #2
; Subrutina que se encarga de hacer el request POST de los datos obtenidos de las cámaras al Server del sistema

		; Establecer la URL de Envío, que en este caso corresponde con la Operación POST, para mandar los datos de la cámara térmica
		; POST/CT.html HTTP/1.1 = 0x504f53542f43542e68746d6c20485454502f312e31
PDS		MOV R7, 0x504F
		LDR R8,=URL1
		STR R7,[R8]
		MOV R7, 0x5354
		LDR R8,=URL2
		STR R7,[R8]
		MOV R7, 0x2F43
		LDR R8,=URL3
		STR R7,[R8]
		MOV R7, 0x542E
		LDR R8,=URL4
		STR R7,[R8]
		MOV R7, 0x6874
		LDR R8,=URL5
		STR R7,[R8]
		MOV R7, 0x6D6C
		LDR R8,=URL6
		STR R7,[R8]
		MOV R7, 0x2048
		LDR R8,=URL7
		STR R7,[R8]
		MOV R7, 0x5454
		LDR R8,=URL8
		STR R7,[R8]
		MOV R7, 0x502F
		LDR R8,=URL9
		STR R7,[R8]
		MOV R7, 0x312E
		LDR R8,=URL10
		STR R7,[R8]
		MOV R7,0x31
		LDR	R8,=URL11
		STR	R7,[R8]
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL15	CBZ	R7,PDS2 ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL15    ; Ciclo DL15 = Quinto Delay de 1 tiempo
		
		; Ciclo que realiza el POST de los datos de la cámara térmica
PDS2	MOV R6,#0    ; Se establece el contador en 0
		LDR R7,=P4BS ; Se carga en R7 la dirección de memoria donde se guardan los datos que serán enviados mediante la instrucción POST
		LDR R8,=DCT  ; Se carga en R8 la dirección de memoria donde comienzan los datos de la cámara térmica
PDS3	CMP R6,#500  ; El valor real es 153600, para efectos de prueba se deja en 500
		BEQ	PDS4
		LDRNE CT,[R8,R6]
		STRNE CT,[R7]
		ADDNE R6,R6,#4  ; Se incrementa el contador en 4, que es el tamaño de los bloques de memoria (4 bytes)
		BNE PDS3
		
		; Establecer la URL de Envío, que en este caso corresponde con la Operación POST, para mandar los datos de la cámara de distancia
		; POST/CD.html HTTP/1.1 = 0x504f53542f43442e68746d6c20485454502f312e31
PDS4	MOV R7, 0x504F
		LDR R8,=URL1
		STR R7,[R8]
		MOV R7, 0x5354
		LDR R8,=URL2
		STR R7,[R8]
		MOV R7, 0x2F43
		LDR R8,=URL3
		STR R7,[R8]
		MOV R7, 0x442E
		LDR R8,=URL4
		STR R7,[R8]
		MOV R7, 0x6874
		LDR R8,=URL5
		STR R7,[R8]
		MOV R7, 0x6D6C
		LDR R8,=URL6
		STR R7,[R8]
		MOV R7, 0x2048
		LDR R8,=URL7
		STR R7,[R8]
		MOV R7, 0x5454
		LDR R8,=URL8
		STR R7,[R8]
		MOV R7, 0x502F
		LDR R8,=URL9
		STR R7,[R8]
		MOV R7, 0x312E
		LDR R8,=URL10
		STR R7,[R8]
		MOV R7, 0x31
		LDR	R8,=URL11
		STR	R7,[R8]
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL16	CBZ	R7,PDS5 ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL16    ; Ciclo DL16 = Sexto Delay de 1 tiempo

		
		; Ciclo que realiza el POST de los datos de la cámara de distancia
PDS5	MOV R6,#0    ; Se establece el contador en 0
		LDR R7,=P4BS ; Se carga en R7 la dirección de memoria donde se guardan los datos que serán enviados mediante la instrucción POST
		LDR R8,=DCDD ; Se carga en R8 la dirección de memoria donde comienzan los datos de la cámara de distancia
PDS6	CMP R6,#500  ; El valor real es 4147200, para efectos de prueba se deja en 500
		BEQ	PDS7
		LDRNE CD,[R8,R6]
		STRNE CD,[R7]
		ADDNE R6,R6,#4 ; Se incrementa el contador en 4, que es el tamaño de los bloques de memoria (4 bytes)
		BNE PDS6
		
PDS7	BX	LR	; Se regresa al flujo principal del programa

; Paso #3
; Subrutina que se encarga de hacer el request GET al Server del Mensaje de que se proyectará en el LCD y del código de activación de las alarmas

		; Establecer la URL de Envío, que en este caso corresponde con la Operación GET, para obtener los datos del mensaje del server
		; GET/MS.html HTTP/1.1 = 0x4745542f4d532e68746d6c20485454502f312e31
GMA		MOV R7, 0x4745
		LDR R8,=URL1
		STR R7,[R8]
		MOV R7, 0x542F
		LDR R8,=URL2
		STR R7,[R8]
		MOV R7, 0x4D53
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
		MOV R7,#0
		LDR	R8,=URL11
		STR	R7,[R8]
		
		; Se alamcena otro valor simbólico en el espacio de memoria donde se obtendrían los 4 bytes al hacer un GET al Server del sistema, para efectos de pruebas
		MOV R7,0x0000AAAA
		LDR R8,=G4BS
		STR R7,[R8]
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL17	CBZ	R7,GMA2 ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL17    ; Ciclo DL17 = Séptimo Delay de 1 tiempo
		
		; Ciclo que realiza el GET de los datos del mensaje del server
GMA2	MOV R6,#0    ; Se establece el contador en 0
		LDR R7,=G4BS ; Se carga en R7 la dirección de memoria donde se obtienen los datos del GET
GMA3	CMP R6,#44   ; Se deben llenar 11 bloques de memoria con 4 bytes cada uno, para obtener el mensaje completo del server 
		BEQ	GMA4
		LDRNE MS,[R7] ; Se almacena el contenido de la dirección guardada en R7 en el registro del mensaje del server
		LDRNE R8,=DMS ; Se almacena en R8 la dirección de memoria donde se almacenan los datos del mensaje del server
		
		; Para guardar el mensaje del server se usa como base el valor inicial de R8 y se le suma el offset correspondiente al valor actual del contador
		STRNE MS,[R8,R6] ; Se guarda lo que hay en el registro del mensaje del server en la dirección de memoria correspondiente
		ADDNE R6,R6,#4   ; Se incrementa el contador en 4, que es el tamaño de los bloques de memoria (4 bytes)
		BNE GMA3
		
		; Establecer la URL de Envío, que en este caso corresponde con la Operación GET, para el valor de las alarmas enviado por el server
		; GET/AS.html HTTP/1.1 = 0x4745542f41532e68746d6c20485454502f312e31
GMA4	MOV R7, 0x4745
		LDR R8,=URL1
		STR R7,[R8]
		MOV R7, 0x542F
		LDR R8,=URL2
		STR R7,[R8]
		MOV R7, 0x4153
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
		MOV R7, 0x2e31
		LDR R8,=URL10
		STR R7,[R8]
		MOV R7,#0
		LDR	R8,=URL11
		STR	R7,[R8]
		
		; Se alamcena otro valor simbólico en el espacio de memoria donde se obtendrían los 4 bytes al hacer un GET al Server del sistema, para efectos de pruebas
		MOV R7,0x0000EAEA
		LDR R8,=G4BS
		STR R7,[R8]
		
		; Se hace un delay de 1 milisegundo (En este caso se espera 1 tiempo simbólico)
		MOV R7,#1
DL18	CBZ	R7,GMA5 ; Básicamente lo saca del loop cuando R7(contador del delay en este caso) sea cero
		SUB R7,R7,#1
		B	DL18    ; Ciclo DL18 = Octavo Delay de 1 tiempo
		
		; Subrutina que se encarga de almacenar en memoria el valor obtenido al hacer el GET al Server del activador de las alarmas
GMA5	LDR R7,=G4BS ; Se carga en R7 la dirección de memoria donde se obtienen los datos del GET
		LDR	R8,=DAS	 ; Se almacena en R8 la dirección de memoria donde se almacenan los datos del activador de las alarmas
		LDR	AS,[R7]
		STR	AS,[R8]
		BX	LR ; Se regresa al flujo principal del programa
		

; Paso #4
; Subrutina de envio al LCD

SDE		LDR R6,=P04	;Se inicializa el pin 4 que corresponde al RS del LCD
		MOV	R7,TRUE
		STR R7,[R6] ;RS = 1
		LDR R8,=P06	;Se inicializa el pin 6 que corresponde al E del LCD
		STR R7,[R8] ;E = 1
		LDR R7,=P05	;Se inicializa el pin 5 que corresponde al RW del LCD
		MOV R8,FALSE
		STR R8,[R7] ;RW = 0
			
		MOV R7,#2
DL22	CBZ	R7,SDE2
		SUB R7,R7,#1	;delay de 2 milisegundos
		B	DL22
			
SDE2	MOV R8,FALSE	;EN = 0
			
		MOV R7,#5
DL5		CBZ	R7,SDE3
		SUB R7,R7,#1	;delay de 5 milisegundos
		B	DL5
			
SDE3	BX	LR ; Se retorna al flujo principal
			
			
; Paso #5
; Subrutina que se encarga de mandar al LCD el mensaje obtenido através del servidor y de activar o no las alarmas dependiendo de lo obtenido por el Server		
		
 	
EMA		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10, LCDSA1
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV	R10,LCDSA2
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDSA3
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDSA4
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDSA5
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDSA6
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDSA7
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDSA8
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDSA9
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
			
		BEQ DONE

		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI1
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI2
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI3
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI4
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI5
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI6
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI7
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI8
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI9
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio
			
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDTI10
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL  SDE			;Se llama a la subrutina de envio	
			
		BEQ DONE

		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI2
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI3
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI4
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI5
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI6
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI7
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI8
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
		
		LDR R3, =SLDC	;Se inicializa la salida de datos al LCD
		MOV R10,LCDDI9
		STR R10,[R3]	;Se carga la parte del mensaje 
		BL SDE			;Se llama a la subrutina de envio
			
		BEQ DONE

		
DONE	CMP R2,TRUE	;if alarma == 1
		BNE L1
		LDR    R1,  =SL1
		LDR    R0,  [R1]
		ORR.W  R0,  #0x08	;enciende el LED
		STR    R0,  [R1]
		B L2	
		
L1		LDR	   R1,  =SL1
		LDR	   R0,  [R1]
		AND.W  R0,  #0xFFFF0FFF	;apaga el LED
		STR	   R0,  [R1]
		
			
L2		BL  INF ; Se regresa al Branch INF para generar un loop infinito que pase realizando las peticiones GET,POST y activar o no las alarmas del sistema
			
		END



		
		

			
			

