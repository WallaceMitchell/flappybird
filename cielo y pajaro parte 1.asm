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
LD R1, COLOR_AMARILLO
LD R2, COLOR_AMARILLOC
LD R3, COLOR_NARANJA
LD R4, COLOR_NEGRO
LD R5, COLOR_BLANCO


PAJARO
STR R4, R0, #0  ; negro
STR R4, R0, #1  ; negro
STR R4, R0, #2  ; negro
STR R4, R0, #3  ; negro
STR R4, R0, #4  ; negro
STR R4, R0, #5  ; negro

HALT

; Datos
COLOR_CELESTE .FILL xB6DC
SCREEN_BASE .FILL xC000
TOTAL_PIXELS .FILL x3E00
pajaroini .FILL xCA28
COLOR_AMARILLO .FILL xFFE0
COLOR_AMARILLOC .FILL xFFE8
COLOR_NARANJA .FILL xFA60
COLOR_NEGRO .FILL x0000
COLOR_BLANCO .FILL xC8C8

.END