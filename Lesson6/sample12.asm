; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

pol1    DB ' 10th CHARACTER HAS BEEN PRESSED..!!! $'

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov cx, 10             ; counter - accept 10 characters only
        mov ah, 01h            ; Function 01h - read a key with echo
balik:  mov dl, al             ; copy the last key pressed to DL
        int 21h                ; wait for a key then display it
        loop balik             ; CX = CX - 1, repeat until CX = 0

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset pol1    ; message after the 10th key
        int 21h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
