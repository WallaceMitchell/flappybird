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

; Ahora pintamos la primera columna verde
LD R0, inicio       ; Reiniciamos R0 a la posición inicial de la pantalla
LD R1, verde        ; Cargamos el color verde
LD R2, cuarentaydos ; Altura de la columna verde
LD R3, abajo        ; Desplazamiento para la siguiente fila (ancho de la pantalla)

LOOP1
STR R1, R4, #0      ; Pintar columna verde
STR R1, R4, #1
STR R1, R4, #2
STR R1, R4, #3
STR R1, R4, #4
STR R1, R4, #5
STR R1, R4, #6
STR R1, R4, #7
STR R1, R4, #8
STR R1, R4, #9
STR R1, R4, #10
STR R1, R4, #11
STR R1, R4, #12
STR R1, R4, #13
STR R1, R4, #14
STR R1, R4, #15
STR R1, R4, #16
STR R1, R4, #17
STR R1, R4, #18

ADD R4, R4, R3      ; Mover a la siguiente fila para la columna
ADD R2, R2, #-1     ; Reducir contador de altura de la columna
BRp LOOP1           ; Repetir mientras queden filas en la columna


LD R2, espacio ; Cargo 40 pixeles de espacio
ADD R4, R4, R2     

LD R2, cuarentaydos ; Recargo altura columna
LOOP2
STR R1, R4, #0      ; Columna verde
STR R1, R4, #1
STR R1, R4, #2
STR R1, R4, #3
STR R1, R4, #4
STR R1, R4, #5
STR R1, R4, #6
STR R1, R4, #7
STR R1, R4, #8
STR R1, R4, #9
STR R1, R4, #10
STR R1, R4, #11
STR R1, R4, #12
STR R1, R4, #13
STR R1, R4, #14
STR R1, R4, #15
STR R1, R4, #16
STR R1, R4, #17
STR R1, R4, #18

ADD R4, R4, R3      ; Baja de linea
ADD R2, R2, #-1     ; Contador de altura columna
BRp LOOP2           ; 

inicio .FILL xC000  ; Primer pixel
celeste .FILL x07FF ; Celeste
verde .FILL x03E0   ; Verde
cuarentaydos .FILL #42  ; Altura columna
pixeles .FILL #15872    ; Cant pixeles totales
ancho .FILL #128        ; Ancho pantalla
abajo .FILL x80         ; Baja de fila
inicio_columna .FILL xC040 ; Primer pixel de la columna
espacio .FILL #5120 ; Espacio entre columnas

