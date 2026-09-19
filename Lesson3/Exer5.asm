; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.code

start:
        mov ah, 02h
        mov cx, 26        ; 26 letters, A to Z

        mov bl, 5ah       ; bl = 'Z'
        mov dl, 61h       ; dl = 'a'
        mov dh, dl        ; dh = 'a'
back:
        int 21h           ; display uppercase (dl)
        mov dl, bl        ; load lowercase
        int 21h           ; display lowercase

        inc bl            ; next uppercase letter
        dec dh            ; next lowercase letter 
        
        mov dl, dh
        loop back

        mov dl, 0dh     
        int 21h
        mov dl, 0ah	     
        int 21h

        mov ah, 4ch
        int 21h
end start