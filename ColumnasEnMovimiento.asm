.ORIG x3000

LD R0, inicio       ; Primer pixel de la pantalla
LD R1, celeste      ; Celeste
LD R2, pixeles      ; Cant de pixeles
LD R3, ancho        ; Ancho pantalla - 18
LD R4, inicio_columna ; Primer pixel de la columna



; Fondo celeste
FONDO
STR R1, R0, #0      ; Pintar pixel de celeste
ADD R0, R0, #1      ; Mueve al siguiente pixel
ADD R2, R2, #-1     ; Reduce el cont de pixeles
BRp FONDO

LD R2,ancho         ;carga el ancho de la pantalla en R2
LD R3,dieciocho     ;carga el valor 18 en R3
ADD R2,R2,R3        ;R2 = ancho pantalla = 128
ST R2,GUARDAR_R2    ;guarda el valor de R2
BRnzp MAIN          ;salta al MAIN
REINICIAR_CONT      
LD R2,ancho         ;Reinicia el valor de R2 a 110
LD R3,dieciocho
ADD R2,R2,R3        ;R2 = ancho pantalla = 128
ST R2,GUARDAR_R2
ADD R4,R4,R2        ;Baja un pixel
MAIN
JSR TUBO            ;Pinta el tubo

ATRASAR             ;delay para que se mueva mas lento
LD R1,inicio
ADD R1,R1,#-1
BRp ATRASAR

JSR BORRAR_TUBO     ;Llama a BORRAR_TUBO
ADD R4,R4,#-1       ;Mueve R4 1 pixel a la izquerda
LD R2,GUARDAR_R2    ;Recarga R2 con el valor del ancho de la pantalla
ADD R2,R2,#-1       ;Reduce R2 en 1
ST R2,GUARDAR_R2    ;Guarda el nuevo valor en R2
BRp MAIN            ;Vuelve a MAIN si R2 es positivo
BRnzp REINICIAR_CONT   ;Reinicia el contador si llego a 0

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

ADD R4, R4, R3                  ; Mover a la siguiente fila para la columna
ADD R2, R2, #-1                 ; Reducir contador de altura de la columna
BRp LOOP2                       ;Repetir mientras haya filas en las columnas
LD R4,GUARDAR_R4
RET
inicio .FILL xC000              ; Primer pixel
celeste .FILL x07FF             ; Celeste
verde .FILL x03E0               ; Verde
cuarentaydos .FILL #42          ; Altura columna
pixeles .FILL #15872            ; Cant pixeles totales
ancho .FILL #110                ; Ancho pantalla - 18
abajo .FILL x80                 ; Baja de fila
inicio_columna .FILL xC06C      ; Primer pixel de la columna
espacio .FILL #4974             ; Espacio entre columnas
negro .FILL x0000               ; Color negro
dieciocho .FILL #18             ; valor 18
GUARDAR_R4  	.BLKW 1
GUARDAR_R2  	.BLKW 1
