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

HALT

inicio .FILL xC07F
inicio2 .FILL xE57F
abajo .FILL x1900
verde .FILL x03E0
cont .FILL #5
enter .FILL #128
columna .FILL #50
columna2 .FILL #50
.END
