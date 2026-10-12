; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

p0      DB 'Press UPPERCASE or lowercase letter  A/a     ',13,10,'$'
p1      DB 'You Pressed UPPERCASE letter A           ',13,10,'$'
p2      DB 'You Pressed LOWERCASE letter a             ',13,10,'$'
p3      DB 'Press any Key to continue [X] to Exit ',13,10,'$'
p4      DB '                                                               ',13,10,'$'

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset p0      ; prompt: press A or a
        int 21h
        mov dx, offset p4      ; blank line
        int 21h

        mov ah, 07h            ; Function 07h - read a key without echo
        int 21h                ; AL = key pressed

        cmp al, 41h            ; is it 'A' (41h)?
        je Malaki              ; if so, go to Malaki (uppercase)
        cmp al, 61h            ; is it 'a' (61h)?
        je Maliit              ; if so, go to Maliit (lowercase)
        jne start              ; any other key - ask again

Malaki:
        mov ah, 09h
        mov dx, offset p1      ; "You Pressed UPPERCASE letter A"
        int 21h

        mov dx, offset p3      ; continue or exit prompt
        int 21h

        mov ah, 07h            ; wait for a key without echo
        int 21h

        cmp al, 'X'            ; is it X?
        je EXIT                ; if so, end the program
        cmp al, 'x'            ; also accept lowercase x
        je EXIT
        jne start              ; otherwise, start again

Maliit:
        mov ah, 09h
        mov dx, offset p2      ; "You Pressed LOWERCASE letter a"
        int 21h

        mov dx, offset p3      ; continue or exit prompt
        int 21h

        mov ah, 07h            ; wait for a key without echo
        int 21h

        cmp al, 'X'            ; is it X?
        je EXIT                ; if so, end the program
        cmp al, 'x'            ; also accept lowercase x
        je EXIT
        jne start              ; otherwise, start again

EXIT:   mov ah, 4Ch            ; terminate program
        int 21h

end start
