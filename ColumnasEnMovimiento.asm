.ORIG x3000

LD R0, inicio       ; Primer pixel de la pantalla
LD R1, celeste      ; Celeste
LD R2, pixeles      ; Cant de pixeles
LD R3, ancho        ; Ancho pantalla 
LD R4, inicio_columna ; Primer pixel de la columna



; Fondo celeste
FONDO
STR R1, R0, #0      ; Pintar pixel de celeste
ADD R0, R0, #1      ; Mueve al siguiente pixel
ADD R2, R2, #-1     ; REduce el cont de pixeles
BRp FONDO

LD R2,ancho
LD R3,dieciocho
ADD R2,R2,R3     
ST R2,GUARDAR_R2 
BRnzp MAIN
REINICIAR_CONT
LD R2,ancho
LD R3,dieciocho
ADD R2,R2,R3
ST R2,GUARDAR_R2
ADD R4,R4,R2
SALTAR
MAIN
JSR TUBO

ATRASAR
LD R1,inicio
ADD R1,R1,#-1
BRp ATRASAR

JSR BORRAR_TUBO
ADD R4,R4,#-1
LD R2,GUARDAR_R2
ADD R2,R2,#-1
ST R2,GUARDAR_R2
BRp MAIN
BRnzp REINICIAR_CONT

BORRAR_TUBO
LD R1, celeste
LD R3, ancho        ; Desplazamiento para la siguiente fila (ancho de la pantalla)
LD R6	,dieciocho
ADD R3,R3,R6
LD R2, ancho
ADD R2,R2,#14  
ST R4,GUARDAR_R4
ADD R4,R4,R6
LUPP
STR R1, R4, #1
ADD R4,R4,R3
ADD R2,R2,#-1
BRp LUPP
LD R4,GUARDAR_R4
RET

TUBO
LD R1, verde        ; Cargamos el color verde
LD R5, negro        ; Negro
ST R4,GUARDAR_R4
LD R2, cuarentaydos ; Altura de la columna verde
LD R3, ancho        ; Desplazamiento para la siguiente fila (ancho de la pantalla)

LOOP1
STR R5, R4, #-1                 ; Pintar columna verde
LD R6, dieciocho              
PINTO
STR R1, R4, #0
ADD R4, R4, #1
ADD R6, R6, #-1
BRp PINTO
STR R5, R4, #0

ADD R4, R4, R3      ; Mover a la siguiente fila para la columna
ADD R2, R2, #-1     ; Reducir contador de altura de la columna
BRp LOOP1           ; Repetir mientras queden filas en la columna

STR R5, R4, #-1
LD R6, dieciocho              
PINTO11
STR R5, R4, #0
ADD R4, R4, #1
ADD R6, R6, #-1
BRp PINTO11
STR R5, R4, #0


LD R2, espacio ; Cargo 40 pixeles de espacio
ADD R4, R4, R2     

STR R5, R4, #-1
LD R6, dieciocho              
PINTO21
STR R5, R4, #0
ADD R4, R4, #1
ADD R6, R6, #-1
BRp PINTO21
STR R5, R4, #0

ADD R4, R4, R3    

LD R2, cuarentaydos ; Recargo altura columna
LOOP2
STR R5, R4, #-1                 ; Pintar columna verde
LD R6, dieciocho              
PINTO2
STR R1, R4, #0
ADD R4, R4, #1
ADD R6, R6, #-1
BRp PINTO2
STR R5, R4, #0

ADD R4, R4, R3      ; Mover a la siguiente fila para la columna
ADD R2, R2, #-1     ; Reducir contador de altura de la columna
BRp LOOP2           ; 
LD R4,GUARDAR_R4
RET
inicio .FILL xC000  ; Primer pixel
celeste .FILL x07FF ; Celeste
verde .FILL x03E0   ; Verde
cuarentaydos .FILL #42  ; Altura columna
pixeles .FILL #15872    ; Cant pixeles totales
ancho .FILL #110        ; Ancho pantalla
abajo .FILL x80         ; Baja de fila
inicio_columna .FILL xC06C ; Primer pixel de la columna
espacio .FILL #4974 ; Espacio entre columnas
negro .FILL x0000
dieciocho .FILL #18
GUARDAR_R4  	.BLKW 1
GUARDAR_R2  	.BLKW 1
