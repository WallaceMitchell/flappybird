.ORIG x3000

LD R0, inicio
LD R1, negro
LD R2, verde
LD R4, columna
LD R5, enter
LD R6, inicio2
LD R7, columna2

LOOP

TUBO1
STR R2, R0, #0
ADD R0, R0, R5
ADD R4, R4, #-1
BRp TUBO1

TUBO2
STR R2, R6, #0
ADD R6, R6, R5
ADD R7, R7, #-1
BRp TUBO2

JSR DELAY

LD R4, columna
LD R7, columna2

NOT R5, R5
ADD R5, R5, #1

RESTART1
ADD R0, R0, R5
ADD R4, R4, #-1
BRp RESTART1

RESTART2
ADD R6, R6, R5
ADD R7, R7, #-1
BRp RESTART2

LD R4, columna
LD R7, columna2

NOT R5, R5
ADD R5, R5, #1

TUBO3
STR R1, R0, #0
ADD R0, R0, R5
ADD R4, R4, #-1
BRp TUBO3

TUBO4
STR R1, R6, #0
ADD R6, R6, R5
ADD R7, R7, #-1
BRp TUBO4

LD R4, columna
LD R7, columna2

NOT R5, R5
ADD R5, R5, #1

RESTART3
ADD R0, R0, R5
ADD R4, R4, #-1
BRp RESTART3

RESTART4
ADD R6, R6, R5
ADD R7, R7, #-1
BRp RESTART4

NOT R5, R5
ADD R5, R5, #1

LD R4, columna
LD R7, columna2

ADD R0, R0, #-1
ADD R6, R6, #-1

BRnzp LOOP

DELAY
LD R3, delay_val
DELAY_LOOP
ADD R3, R3, #-1
BRp DELAY_LOOP
RET

HALT

inicio .FILL xC07F
inicio2 .FILL xE57F
negro .FILL x0000
verde .FILL x03E0
delay_val .FILL #9000
enter .FILL #128
columna .FILL #50
columna2 .FILL #50
.END