; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

var1   DB 'Aaron Ludwig A. Altar',13,10,'$'
var2   DB 'Computer Engineering',13,10,'$'

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1   ; offset of first string
        int 21h                ; show "Aaron Ludwig A. Altar"

        mov ah, 09h
        mov dx, offset var2   ; offset of second string
        int 21h                ; show "Computer Engineering"

        mov ah, 4Ch            ; terminate program
        int 21h

end start