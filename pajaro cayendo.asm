.ORIG x3000    

LD R0, COLOR_CELESTE 
LD R1, SCREEN_BASE 
LD R2, #0
LD R3, TOTAL_PIXELS  

FILL_MEMORY
STR R0, R1, #0       
ADD R1, R1, #1       
ADD R2, R2, #1       
ADD R3, R3, #-1      
BRp FILL_MEMORY


LD R0, pajaroini
ST R0, GUARDAR

CAIDA
ST R0, GUARDAR
LD R0, GUARDAR
LD R1, COLOR_AMARILLO
LD R2, COLOR_AMARILLOC
LD R3, COLOR_NARANJA
LD R4, COLOR_NEGRO
LD R5, COLOR_BLANCO
LD R6, value126

STR R4, R0, #0
STR R4, R0, #1
STR R4, R0, #2
STR R4, R0, #3
STR R4, R0, #4
STR R4, R0, #5
ADD R0, R0, R6
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
BRnzp BORRAR_PAJARO
CONTINUE1
BRnzp DELAY
CONTINUE2
ADD R0, R0, R6
ADD R0, R0, #2
BRnzp CAIDA

HALT

DELAY
LD R7, delay
DELAY_LOOP
ADD R7, R7, #-1
BRp DELAY_LOOP
BRnzp CONTINUE2

BORRAR_PAJARO
LD R7, COLOR_CELESTE
LD R0, GUARDAR
STR R7, R0, #0
STR R7, R0, #1
STR R7, R0, #2
STR R7, R0, #3
STR R7, R0, #4
STR R7, R0, #5
ADD R0, R0, R6
STR R7, R0, #0
STR R7, R0, #1
ADD R0, R0, R6
ADD R0, R0, #1
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, #1
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, #1
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, R6
ADD R0, R0, R6
ADD R0, R0, #5
STR R7, R0, #0
LD R0, GUARDAR
ADD R0, R0, #5
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, #3
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, #3
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, #3
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, R6
ADD R0, R0, R6
ADD R0, R0, #7
STR R7, R0, #0
ADD R0, R0, R6
ADD R0, R0, #3
STR R7, R0, #0
LD R0, GUARDAR
BRnzp CONTINUE1

; Datos
COLOR_CELESTE .FILL xB6DC
SCREEN_BASE .FILL xC000
TOTAL_PIXELS .FILL x3E00
pajaroini .FILL xCA28
COLOR_AMARILLO .FILL xFFE0
COLOR_AMARILLOC .FILL xFFF5
COLOR_NARANJA .FILL xFA60
COLOR_NEGRO .FILL x0000
COLOR_BLANCO .FILL xEF9D
value126 .FILL #126
delay .FILL #10000
GUARDAR .BLKW 1


.END