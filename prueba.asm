.ORIG x3000

LD R0, inicio
LD R1, verde
LD R2, cinco
LD R3, abajo
LD R4, chau
LD R5, negro
LD R6, cont
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

delay .FILL x2000
cont .FILL #119
chau .FILL xC020
negro .FILL x0000
inicio .FILL xC020
verde .FILL x03E0
cinco .FILL #5
abajo .FILL x80

GUARDAR_R0      .BLKW 1
