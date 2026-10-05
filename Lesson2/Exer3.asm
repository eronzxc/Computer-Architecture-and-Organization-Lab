; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.code

start:
    mov ah, 02h

; Row 1: top border (17 chars)
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 2: blank
    mov dl, 2ah
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 3: blank
    mov dl, 2ah
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 4: NAME - AARON LUDWIG
    mov dl, 2ah
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 41h
    int 21h
    mov dl, 41h
    int 21h
    mov dl, 52h
    int 21h
    mov dl, 4fh
    int 21h
    mov dl, 4eh
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 4ch
    int 21h
    mov dl, 55h
    int 21h
    mov dl, 44h
    int 21h
    mov dl, 57h
    int 21h
    mov dl, 49h
    int 21h
    mov dl, 47h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 5: blank
    mov dl, 2ah
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 6: SURNAME - ALTAR
    mov dl, 2ah
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 41h
    int 21h
    mov dl, 4ch
    int 21h
    mov dl, 54h
    int 21h
    mov dl, 41h
    int 21h
    mov dl, 52h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 7: blank
    mov dl, 2ah
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 8: blank
    mov dl, 2ah
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

; Row 9: bottom border (17 chars)
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h
    mov dl, 2ah
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov ah, 4ch
    int 21h

end start