; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.code

start:
        mov ah, 02h
        mov cx, 26        ; 26 letters
        mov bl, 7Ah       ; bl = 'z'
        mov dh, 41h       ; dh = 'A' 

back:
        mov dl, bl        ; display lowercase 
        int 21h
        mov dl, dh        ; display uppercase
        int 21h

        dec bl            ; next lowercase letter
        inc dh            ; next uppercase letter

        loop back

        mov dl, 0dh     
        int 21h
        mov dl, 0ah	     
        int 21h

        mov ah, 4ch
        int 21h
end start