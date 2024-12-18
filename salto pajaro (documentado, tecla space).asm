.ORIG x3000    

LD R0, COLOR_CELESTE	;DIBUJAMOS EL CIELO MEDIANTE UN BUCLE
LD R1, SCREEN_BASE 
LD R2, #0
LD R3, TOTAL_PIXELS  
FILL_MEMORY
STR R0, R1, #0       
ADD R1, R1, #1       
ADD R2, R2, #1       
ADD R3, R3, #-1      
BRp FILL_MEMORY

BRnzp PARTE2	;UNA VEZ TERMINAMOS CON EL CIELO, EMPEZAMOS A TRABAJAR CON EL PAJARO

COLOR_CELESTE .FILL xB6DC	;DEFINIMOS COLORES DEL PAJARO, POSICIÓN INICIAL DEL PAJARO Y LOS ALIAS UTILIZADOS PARA EL CIELO
SCREEN_BASE .FILL xC000
TOTAL_PIXELS .FILL x3E00
pajaroini .FILL xCA28
COLOR_AMARILLO .FILL xFFE0
COLOR_AMARILLOC .FILL xFFF5
COLOR_NARANJA .FILL xFA60
COLOR_NEGRO .FILL x0000
COLOR_BLANCO .FILL xEF9D

GUARDAR .BLKW 1
PARTE2

LD R0, pajaroini	;EMPEZAMOS CON UNA POSICION PRESELECCIONADA
ST R0, GUARDAR		;CARGAMOS POSICION ACTUALIZADA DURANTE EL PRIMER BUCLE DE DIBUJADO EN EL PROCESO DE "CAIDA"

CAIDA			;BUCLE DE CAIDA
JSR COMPARE_SPACE	;SUBRUTINA QUE ANALIZA SI SE PULSO LA TECLA "SPACE"
LD R0, GUARDAR
LD R1, COLOR_AMARILLO
LD R2, COLOR_AMARILLOC	;CARGAMOS COLORES DEL PAJARO
LD R3, COLOR_NARANJA
LD R4, COLOR_NEGRO
LD R5, COLOR_BLANCO
LD R6, value126		;CARGO UN VALOR ARBITRARIO DE PREFERENCIA QUE ME AYUDARA A MODIFICAR EL R0 (POSICION INICIAL DE DIBUJADO DEL PAJARO)
JSR DIBUJAR_PAJARO	;SUBRUTINA QUE DIBUJA PAJARO
JSR DELAYAUX		;SUBRUTINA PARA GENERAR UN LEVE DELAY QUE HAGA PARECER QUE LA CAIDA ES MAS LENTA
LD R0, GUARDAR
JSR BORRAR		;SUBRUTINA PARA BORRAR (LUEGO DE "BORRAR" DIBUJA PAJARO MAS ABAJO, YA QUE UTILIZA EL "RET" QUE SE ENCUENTRA DEBAJO DE DIBUJAR_PAJARO)
LD R0, GUARDAR
ADD R0, R0, R6
ADD R0, R0, #2
ST R0, GUARDAR
BRnzp CAIDA

BORRAR
LD R1, COLOR_CELESTE	;CARGAMOS EL COLOR CELESTE EN LOS REGISTROS DE LOS COLORES PARA QUE AL DIBUJAR EL PAJARO NUEVAMENTE SE REEMPLACE TODO POR EL MISMO COLOR DEL CIELO.
LD R2, COLOR_CELESTE
LD R3, COLOR_CELESTE
LD R4, COLOR_CELESTE
LD R5, COLOR_CELESTE

DIBUJAR_PAJARO
STR R4, R0, #0
STR R4, R0, #1
STR R4, R0, #2
STR R4, R0, #3
STR R4, R0, #4
STR R4, R0, #5
ADD R0, R0, R6		;DIBUJO DEL PAJARO EN UNA INSTANCIA DETERMINADA (DEFINIDA POR LA POSICION INICIAL DE R0)
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
RET

COMPARE_SPACE		;SUBRUTINA QUE ANALIZA SI SE PULSO LA TECLA "SPACE" (LO HACE CON LA AYUDA DE "AUX")
LDI R1, STATUS
BRn AUX
RET

AUX
LDI R1, TECLA		;SI SE PULSO LA TECLA "SPACE", PASA DIRECTAMENTE A LA ETIQUETA "SUBIR"
LD R2, spacekey
ADD R1, R1, R2
BRz SUBIR

SUBIR
LD R0, GUARDAR		;MODIFICA EL VALOR ACTUAL DE R0 Y SE DIBUJA EL PAJARO 2048 PIXELES MAS ARRIBA. LUEGO, CONTINUA CON LA CAIDA
LD R1, valuejump
ADD R0, R0, R1
ST R0, GUARDAR
BRnzp CAIDA

HALT			;LLAMADA A HALT PARA INTERRUMPIR LA EJECUCION DEL PROGRAMA

DELAYAUX		;SUBRUTINA PARA GENERAR DELAY
LD R1, delayaux
DELAY_LOOP2
ADD R1, R1, #-1
BRp DELAY_LOOP2
RET

value126 .FILL #126	;DEFINICIONES AUXILIARES DE COSAS QUE SE FUERON USANDO EN LAS SUBRUTINAS
delay .FILL #5000
spacekey .FILL #-32
STATUS	.FILL xFE00
TECLA	.FILL xFE02
valuejump .FILL #-2048
delayaux .FILL #10000

.END