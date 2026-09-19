; AARON LUDWIG A. ALTAR
; CPE4B

.model small                                            
.stack
.code

start:

        mov ah, 02h
       
        mov cx, 10
        mov dl, 39h	; ASCII character for number 9
ulit:   int 21h
        dec dl
        loop ulit

mov ah, 4ch
int 21h
end start
