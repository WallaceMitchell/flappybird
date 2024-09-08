.ORIG x3000


LD R0, inicio
LD R1, abajo
LD R2, verde
LD R3, cont
LD R4, columna
LD R5, enter
LD R6, inicio2
LD R7, columna2

ADD R3, R3, #-1

TUBO1
STR R2, R0, #0
STR R2, R0, #-1
STR R2, R0, #-2
STR R2, R0, #-3
STR R2, R0, #-4
ADD R0, R0, R5
ADD R4, R4, #-1
BRp TUBO1

TUBO2
STR R2, R6, #0
STR R2, R6, #-1
STR R2, R6, #-2
STR R2, R6, #-3
STR R2, R6, #-4
ADD R6, R6, R5
ADD R7, R7, #-1
BRp TUBO2

LD R0, ini
LD R1, green
LD R2, cinco
LD R3, down
LD R4, chau
LD R5, negro
LD R6, cont2
LD R7, delay

MAIN
BRnzp CUADRADO
EMPIEZA
LD R2, cinco

BRnzp BORRAR
ERASE

LOOP2
ADD R7, R7, #-1
BRp LOOP2
LD R7, delay

ADD R6, R6, #-1
BRp MAIN

HALT

CUADRADO 
ST R0,GUARDAR_R0
LOOP1
STR R1, R0, #0
STR R1, R0, #1
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #4

ADD R0, R0, R3
ADD R2, R2, #-1
BRp LOOP1
LD R0,GUARDAR_R0
ADD R0, R0, R3
BRnzp EMPIEZA


BORRAR
STR R5, R4, #0
STR R5, R4, #1
STR R5, R4, #2
STR R5, R4, #3
STR R5, R4, #4

ADD R4, R4, R3

BRnzp ERASE


inicio .FILL xC07F
inicio2 .FILL xE57F
abajo .FILL x1900
verde .FILL x03E0
cont .FILL #5
enter .FILL #128
columna .FILL #50
columna2 .FILL #50
delay .FILL x2000
cont2 .FILL #119
chau .FILL xC020
negro .FILL x0000
ini .FILL xC020
green .FILL x03E0
cinco .FILL #5
down .FILL x80
GUARDAR_R0      .BLKW 1

.END