; AARON LUDWIG A. ALTAR
; CPE4B

.model small                                             
.stack
.code

start:

        mov ah, 02h
       
        mov cx,20
ulit:   mov dl,41h
        int 21h
        mov dl,0dh	       ;line feed
        int 21h	
        mov dl,0ah	       ; carriage return
        int 21h
        loop ulit


mov ah, 4ch
int 21h
end start
