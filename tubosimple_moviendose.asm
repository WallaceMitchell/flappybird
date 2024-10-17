.ORIG x3000
LD R0, inicio       ; Cargar dirección del inicio del tubo 1
LD R1, negro        ; Color negro
LD R2, verde        ; Color verde
LD R4, columna      ; Altura del tubo 1
LD R5, enter        ; Espacio entre líneas
LD R6, inicio2      ; Cargar dirección del inicio del tubo 2
LD R7, columna2     ; Altura del tubo 2

LOOP

; Dibuja el tubo 1
TUBO1
STR R2, R0, #0
STR R2, R0, #-1
STR R2, R0, #-2
STR R2, R0, #-3
STR R2, R0, #-4
ADD R0, R0, R5      ; Mover a la derecha
ADD R4, R4, #-1     ; Decrementar altura
BRp TUBO1

; Dibuja el tubo 2
TUBO2
STR R2, R6, #0
STR R2, R6, #-1
STR R2, R6, #-2
STR R2, R6, #-3
STR R2, R6, #-4
ADD R6, R6, R5      ; Mover a la derecha
ADD R7, R7, #-1     ; Decrementar altura
BRp TUBO2

JSR DELAY           ; Llama a la rutina de retardo

; Restablecer posiciones
LD R4, columna
LD R7, columna2

; Mover a la izquierda para el siguiente ciclo
NOT R5, R5
ADD R5, R5, #1

RESTART1
ADD R0, R0, R5      ; Mover R0 a la izquierda
ADD R4, R4, #-1     ; Decrementar altura del tubo 1
BRp RESTART1

RESTART2
ADD R6, R6, R5      ; Mover R6 a la izquierda
ADD R7, R7, #-1     ; Decrementar altura del tubo 2
BRp RESTART2

; Dibuja el tubo 3 (color negro)
LD R4, columna
LD R7, columna2

NOT R5, R5
ADD R5, R5, #1

TUBO3
STR R1, R0, #0      ; Dibuja el tubo negro en R0
ADD R0, R0, R5      ; Mover a la derecha
ADD R4, R4, #-1     ; Decrementar altura
BRp TUBO3

; Dibuja el tubo 4 (color negro)
TUBO4
STR R1, R6, #0      ; Dibuja el tubo negro en R6
ADD R6, R6, R5      ; Mover a la derecha
ADD R7, R7, #-1     ; Decrementar altura
BRp TUBO4

; Restablecer posiciones
LD R4, columna
LD R7, columna2

NOT R5, R5
ADD R5, R5, #1

RESTART3
ADD R0, R0, R5      ; Mover R0 a la izquierda
ADD R4, R4, #-1     ; Decrementar altura
BRp RESTART3

RESTART4
ADD R6, R6, R5      ; Mover R6 a la izquierda
ADD R7, R7, #-1     ; Decrementar altura
BRp RESTART4

NOT R5, R5
ADD R5, R5, #1

; Preparar para la siguiente iteración
LD R4, columna
LD R7, columna2

ADD R0, R0, #-1     ; Ajustar posición de R0
ADD R6, R6, #-1     ; Ajustar posición de R6

BRnzp LOOP          ; Volver a empezar el ciclo

DELAY
LD R3, delay_val
DELAY_LOOP
ADD R3, R3, #-1
BRp DELAY_LOOP
RET

HALT

inicio .FILL xC07F   ; Dirección inicial del tubo 1
inicio2 .FILL xE57F  ; Dirección inicial del tubo 2
negro .FILL x0000     ; Color negro
verde .FILL x03E0     ; Color verde
delay_val .FILL #9000; Valor para el retardo
enter .FILL #128      ; Espacio entre líneas
columna .FILL #50     ; Altura del tubo 1
columna2 .FILL #50    ; Altura del tubo 2
.END
