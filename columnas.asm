.ORIG x3000

LD R0, inicio       ; Primer pixel de la pantalla
LD R1, celeste      ; Celeste
LD R2, pixeles      ; Cant de pixeles
LD R3, ancho        ; Ancho pantalla 
LD R4, inicio_columna ; Primer pixel de la columna
LD R5, negro        ; Negro


; Fondo celeste
FONDO
STR R1, R0, #0      ; Pintar pixel de celeste
ADD R0, R0, #1      ; Mueve al siguiente pixel
ADD R2, R2, #-1     ; REduce el cont de pixeles
BRp FONDO           


LD R0, inicio       ; Reiniciamos R0 a la posición inicial de la pantalla
LD R1, verde        ; Cargamos el color verde
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


LD R2, espacio ; Cargo 40 pixeles de espacio
ADD R4, R4, R2     

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

inicio .FILL xC000  ; Primer pixel
celeste .FILL x07FF ; Celeste
verde .FILL x03E0   ; Verde
cuarentaydos .FILL #42  ; Altura columna
pixeles .FILL #15872    ; Cant pixeles totales
ancho .FILL #110        ; Ancho pantalla
abajo .FILL x80         ; Baja de fila
inicio_columna .FILL xC040 ; Primer pixel de la columna
espacio .FILL #5120 ; Espacio entre columnas
negro .FILL x0000
dieciocho .FILL #18


