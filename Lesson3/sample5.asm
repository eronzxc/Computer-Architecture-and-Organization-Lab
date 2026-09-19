; AARON LUDWIG A. ALTAR
; CPE4B

.model small                                            
.stack
.code

start:

        mov ah, 02h
       
        mov cx, 10		; counter set to 10
        mov dl, 30h	;ASCII code for number 0
ulit:   int 21h
        inc dl		; increment count from 0 onwards
        loop ulit		


       mov ah, 4ch
       int 21h
       end start
