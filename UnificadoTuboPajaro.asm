.ORIG x3000    

LD R0, COLOR_CELESTE	;DIBUJAMOS EL CIELO MEDIANTE UN BUCLE
LD R1, SCREEN_BASE 
LD R2, #0
LD R3, TOTAL_PIXELS  
FILL_MEMORY
STR R0, R1, #0       
ADD R1, R1, #1       
ADD R2, R2, #1       
ADD R3, R3, #-1      
BRp FILL_MEMORY


LD R4, inicio_columna ; Primer pixel de la columna
ST R4, guardar_tubo

BRnzp PARTE2	;UNA VEZ TERMINAMOS CON EL CIELO, EMPEZAMOS A TRABAJAR CON EL PAJARO

inicio_columna .FILL xC06C      ; Primer pixel de la columna
COLOR_CELESTE .FILL xB6DC	;DEFINIMOS COLORES DEL PAJARO, POSICIÓN INICIAL DEL PAJARO Y LOS ALIAS UTILIZADOS PARA EL CIELO
SCREEN_BASE .FILL xC000
TOTAL_PIXELS .FILL x3E00
pajaroini .FILL xCA28
COLOR_AMARILLO .FILL xFFE0
COLOR_AMARILLOC .FILL xFFF5
COLOR_NARANJA .FILL xFA60
COLOR_NEGRO .FILL x0000
COLOR_BLANCO .FILL xEF9D
guardar_tubo .BLKW 1

GUARDAR .BLKW 1
PARTE2

LD R0, pajaroini	;EMPEZAMOS CON UNA POSICION PRESELECCIONADA
ST R0, GUARDAR		;CARGAMOS POSICION ACTUALIZADA DURANTE EL PRIMER BUCLE DE DIBUJADO EN EL PROCESO DE "CAIDA"

LD R2,ancho         ;Reinicia el valor de R2 a 110
LD R3,dieciocho
ADD R2,R2,R3        ;R2 = ancho pantalla = 128
ST R2,GUARDAR_R2

BRnzp MAIN

REINICIAR_CONT      
LD R2,ancho         ;Reinicia el valor de R2 a 110
LD R3,dieciocho
ADD R2,R2,R3        ;R2 = ancho pantalla = 128
ST R2,GUARDAR_R2
ADD R4,R4,R2        ;Baja un pixel
ST R4, guardar_tubo
MAIN			;BUCLE MAIN
JSR COMPARE_SPACE	;SUBRUTINA QUE ANALIZA SI SE PULSO LA TECLA "SPACE"
LD R0, GUARDAR
LD R1, COLOR_AMARILLO
LD R2, COLOR_AMARILLOC	;CARGAMOS COLORES DEL PAJARO
LD R3, COLOR_NARANJA
LD R4, COLOR_NEGRO
LD R5, COLOR_BLANCO
LD R6, value126		;CARGO UN VALOR ARBITRARIO DE PREFERENCIA QUE ME AYUDARA A MODIFICAR EL R0 (POSICION INICIAL DE DIBUJADO DEL PAJARO)
JSR DIBUJAR_PAJARO	;SUBRUTINA QUE DIBUJA PAJARO
LD R4, guardar_tubo
JSR TUBO
ST R4, guardar_tubo
JSR DELAYAUX		;SUBRUTINA PARA GENERAR UN LEVE DELAY QUE HAGA PARECER QUE LA CAIDA ES MAS LENTA
LD R0, GUARDAR
JSR BORRAR		;SUBRUTINA PARA BORRAR (LUEGO DE "BORRAR" DIBUJA PAJARO MAS ABAJO, YA QUE UTILIZA EL "RET" QUE SE ENCUENTRA DEBAJO DE DIBUJAR_PAJARO)
LD R0, GUARDAR
LD R6, value126		;CARGO UN VALOR ARBITRARIO DE PREFERENCIA QUE ME AYUDARA A MODIFICAR EL R0 (POSICION INICIAL DE DIBUJADO DEL PAJARO)
ADD R0, R0, R6
ADD R0, R0, #2
ST R0, GUARDAR
LD R4, guardar_tubo
JSR BORRAR_TUBO			;Llama a BORRAR_TUBO
ADD R4,R4,#-1			;Mueve R4 1 pixel a la izquerda
ST R4, guardar_tubo
LD R2,GUARDAR_R2		;Recarga R2 con el valor del ancho de la pantalla
ADD R2,R2,#-1			;Reduce R2 en 1
ST R2,GUARDAR_R2		;Guarda el nuevo valor en R2
BRp MAIN				;Vuelve a MAIN si R2 es positivo
BRnzp REINICIAR_CONT    ;Reinicia el contador si llego a 0

BORRAR
LD R6, value126			;CARGO UN VALOR ARBITRARIO DE PREFERENCIA QUE ME AYUDARA A MODIFICAR EL R0 (POSICION INICIAL DE DIBUJADO DEL PAJARO)
LD R1, COLOR_CELESTE	;CARGAMOS EL COLOR CELESTE EN LOS REGISTROS DE LOS COLORES PARA QUE AL DIBUJAR EL PAJARO NUEVAMENTE SE REEMPLACE TODO POR EL MISMO COLOR DEL CIELO.
LD R2, COLOR_CELESTE
LD R3, COLOR_CELESTE
LD R4, COLOR_CELESTE
LD R5, COLOR_CELESTE

DIBUJAR_PAJARO
STR R4, R0, #0
STR R4, R0, #1
STR R4, R0, #2
STR R4, R0, #3
STR R4, R0, #4
STR R4, R0, #5
ADD R0, R0, R6		;DIBUJO DEL PAJARO EN UNA INSTANCIA DETERMINADA (DEFINIDA POR LA POSICION INICIAL DE R0)
STR R4, R0, #0
STR R4, R0, #1
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #4
STR R4, R0, #5
STR R5, R0, #6
STR R5, R0, #7
STR R4, R0, #8
ADD R0, R0, R6
ADD R0, R0, #1
STR R4, R0, #0
STR R1, R0, #1
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #4
STR R4, R0, #5
STR R5, R0, #6
STR R5, R0, #7
STR R5, R0, #8
STR R5, R0, #9
STR R4, R0, #10
ADD R0, R0, R6
ADD R0, R0, #1
STR R4, R0, #0
STR R1, R0, #1
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #4
STR R1, R0, #5
STR R4, R0, #6
STR R5, R0, #7
STR R5, R0, #8
STR R5, R0, #9
STR R4, R0, #10
STR R5, R0, #11
STR R4, R0, #12
ADD R0, R0, R6
ADD R0, R0, #1
STR R4, R0, #0
STR R1, R0, #1
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #4
STR R1, R0, #5
STR R1, R0, #6
STR R4, R0, #7
STR R5, R0, #8
STR R5, R0, #9
STR R5, R0, #10
STR R4, R0, #11
STR R5, R0, #12
STR R4, R0, #13
ADD R0, R0, R6
ADD R0, R0, #2
STR R4, R0, #0
STR R1, R0, #1
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #4
STR R1, R0, #5
STR R1, R0, #6
STR R1, R0, #7
STR R4, R0, #8
STR R5, R0, #9
STR R5, R0, #10
STR R5, R0, #11
STR R5, R0, #12
STR R4, R0, #13
ADD R0, R0, R6
ADD R0, R0, #2
STR R4, R0, #0
STR R4, R0, #1
STR R4, R0, #2
STR R4, R0, #3
STR R4, R0, #4
STR R1, R0, #5
STR R1, R0, #6
STR R1, R0, #7
STR R1, R0, #8
STR R4, R0, #9
STR R4, R0, #10
STR R4, R0, #11
STR R4, R0, #12
STR R4, R0, #13
STR R4, R0, #14
ADD R0, R0, R6
ADD R0, R0, #1
STR R4, R0, #0
STR R2, R0, #1
STR R2, R0, #2
STR R2, R0, #3
STR R2, R0, #4
STR R2, R0, #5
STR R4, R0, #6
STR R1, R0, #7
STR R1, R0, #8
STR R4, R0, #9
STR R3, R0, #10
STR R3, R0, #11
STR R3, R0, #12
STR R3, R0, #13
STR R3, R0, #14
STR R3, R0, #15
STR R4, R0, #16
ADD R0, R0, R6
ADD R0, R0, #2
STR R4, R0, #0
STR R2, R0, #1
STR R2, R0, #2
STR R2, R0, #3
STR R2, R0, #4
STR R4, R0, #5
STR R1, R0, #6
STR R1, R0, #7
STR R4, R0, #8
STR R3, R0, #9
STR R4, R0, #10
STR R4, R0, #11
STR R4, R0, #12
STR R4, R0, #13
STR R4, R0, #14
STR R4, R0, #15
ADD R0, R0, R6
ADD R0, R0, #2
STR R4, R0, #0
STR R2, R0, #1
STR R2, R0, #2
STR R2, R0, #3
STR R4, R0, #4
STR R1, R0, #5
STR R1, R0, #6
STR R1, R0, #7
STR R1, R0, #8
STR R4, R0, #9
STR R3, R0, #10
STR R3, R0, #11
STR R3, R0, #12
STR R3, R0, #13
STR R3, R0, #14
STR R4, R0, #15
ADD R0, R0, R6
ADD R0, R0, #3
STR R4, R0, #0
STR R4, R0, #1
STR R4, R0, #2
STR R4, R0, #3
STR R1, R0, #4
STR R1, R0, #5
STR R1, R0, #6
STR R1, R0, #7
STR R1, R0, #8
STR R4, R0, #9
STR R4, R0, #10
STR R4, R0, #11
STR R4, R0, #12
STR R4, R0, #13
ADD R0, R0, R6
ADD R0, R0, #6
STR R4, R0, #0
STR R4, R0, #1
STR R4, R0, #2
STR R4, R0, #3
STR R4, R0, #4
RET

COMPARE_SPACE		;SUBRUTINA QUE ANALIZA SI SE PULSO LA TECLA "SPACE" (LO HACE CON LA AYUDA DE "AUX")
LDI R1, STATUS
BRn AUX
RET

AUX
LDI R1, TECLA		;SI SE PULSO LA TECLA "SPACE", PASA DIRECTAMENTE A LA ETIQUETA "SUBIR"
LD R2, spacekey
ADD R1, R1, R2
BRz SUBIR

SUBIR
LD R0, GUARDAR		;MODIFICA EL VALOR ACTUAL DE R0 Y SE DIBUJA EL PAJARO 2048 PIXELES MAS ARRIBA. LUEGO, CONTINUA CON LA CAIDA
JSR BORRAR
LD R0, GUARDAR		;MODIFICA EL VALOR ACTUAL DE R0 Y SE DIBUJA EL PAJARO 2048 PIXELES MAS ARRIBA. LUEGO, CONTINUA CON LA CAIDA
LD R1, valuejump
ADD R0, R0, R1
ST R0, GUARDAR
BRnzp MAIN

HALT			;LLAMADA A HALT PARA INTERRUMPIR LA EJECUCION DEL PROGRAMA

DELAYAUX		;SUBRUTINA PARA GENERAR DELAY
LD R1, delayaux
DELAY_LOOP2
ADD R1, R1, #-10
BRp DELAY_LOOP2
RET

inicio .FILL xC000              ; Primer pixel
celeste .FILL xB6DC             ; Celeste
verde .FILL x03E0               ; Verde
cuarentaydos .FILL #42          ; Altura columna
pixeles .FILL #15872            ; Cant pixeles totales
ancho .FILL #110                ; Ancho pantalla - 18
abajo .FILL x80                 ; Baja de fila
espacio .FILL #4974             ; Espacio entre columnas
negro .FILL x0000               ; Color negro
dieciocho .FILL #18             ; valor 18
GUARDAR_R4  	.BLKW 1
GUARDAR_R2  	.BLKW 1
value126 .FILL #126				;DEFINICIONES AUXILIARES DE COSAS QUE SE FUERON USANDO EN LAS SUBRUTINAS
delay .FILL #5000
spacekey .FILL #-32
STATUS	.FILL xFE00
TECLA	.FILL xFE02
valuejump .FILL #-2048
delayaux .FILL #10000

BORRAR_TUBO
LD R1, celeste      ;Carga color celeste para borrar el tubo
LD R3, ancho        
LD R6	,dieciocho  
ADD R3,R3,R6        ;Desplazamiento a la siguiente fila
LD R2, ancho        ;Carga ancho de pantalla - 18
ADD R2,R2,#14       ;Le suma 14 a R2
ST R4,GUARDAR_R4    ;Guarda pocision en el momento de R4 
ADD R4,R4,R6        ;Ajusta R4 para empezar a borrar
LUPP
STR R1, R4, #1      ;Pinta de celeste el pixel en R4
ADD R4,R4,R3        ;Baja a la siguiente fila
ADD R2,R2,#-1       ;Decrementa el contador
BRp LUPP            ;Vuelve a LUPP mientras sea positivo
LD R4,GUARDAR_R4    ;Reinicia la pocision original de R4
RET                 

TUBO
LD R1, verde        ; Cargamos el color verde
LD R5, negro        ; Cargamos el color Negro
ST R4,GUARDAR_R4
LD R2, cuarentaydos ; Altura de la columna verde
LD R3, ancho        ; Desplazamiento para la siguiente fila (ancho de la pantalla)

LOOP1
STR R5, R4, #-1     ; Pintar de negro el pixel anterior a R4
LD R6, dieciocho              
PINTO               ;Pinto tubo de 18 pixeles de ancho
STR R1, R4, #0
ADD R4, R4, #1
ADD R6, R6, #-1
BRp PINTO
STR R5, R4, #0      ;Pinta el ultimo pixel de negro

ADD R4, R4, R3      ; Mover a la siguiente fila para la columna
ADD R2, R2, #-1     ; Reducir contador de altura de la columna
BRp LOOP1           ; Repetir mientras queden filas en la columna

STR R5, R4, #-1     
LD R6, dieciocho              
PINTO11
STR R5, R4, #0      ;Pinta de negro el pixel en R4
ADD R4, R4, #1      ;Mueve al siguiente pixel
ADD R6, R6, #-1     ;Reduce el contador
BRp PINTO11         ;Se repite hasta pintar 18 pixeles
STR R5, R4, #0      


LD R2, espacio      ;Cargo 40 pixeles de espacio
ADD R4, R4, R2      ;Mueve al inicio de la siguiente columna

STR R5, R4, #-1     
LD R6, dieciocho              
PINTO21             
STR R5, R4, #0     
ADD R4, R4, #1
ADD R6, R6, #-1
BRp PINTO21
STR R5, R4, #0

ADD R4, R4, R3    ;Mueve a la siguiente fila

LD R2, cuarentaydos             ;Recargo altura columna
LOOP2
STR R5, R4, #-1                 ;Pintar columna verde
LD R6, dieciocho                
PINTO2
STR R1, R4, #0                  
ADD R4, R4, #1
ADD R6, R6, #-1
BRp PINTO2
STR R5, R4, #0

ADD R4, R4, R3					; Mover a la siguiente fila para la columna
ADD R2, R2, #-1                 ; Reducir contador de altura de la columna
BRp LOOP2                       ;Repetir mientras haya filas en las columnas
LD R4,GUARDAR_R4
RET

.END