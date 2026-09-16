; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.code

start:
        mov ah, 02h
        mov cx, 26        ; 26 letters, A to Z

        mov bl, 7ah       ; bl = 'z'
        mov dl, 41h       ; dl = 'A'
        mov dh, dl        ; dh = 'A'
back:
        int 21h           ; display uppercase (dl)
        mov dl, bl        ; load lowercase
        int 21h           ; display lowercase
 
        dec bl            ; next uppercase letter
        inc dh            ; next lowercase letter 
        
        mov dl, 0ah     
        int 21h

        mov dl, dh
        loop back

        mov dl, 0dh     
        int 21h
        mov dl, 0ah	     
        int 21h

        mov ah, 4ch
        int 21h
end start