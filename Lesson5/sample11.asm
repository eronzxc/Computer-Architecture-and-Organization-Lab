; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

var1    DB 'PROUD TO BE A ',13,10,'$'
var2    DB 'FILIPINO ENGINEER ',13,10,'$'

.code
start:

        ; 1st layer - green background (0,0 - 24,79)
        mov ah, 07h            ; Function 07h - scroll down window
        mov bh, 20h            ; background color green
        mov ch, 0              ; start row
        mov cl, 0              ; start column
        mov dh, 24             ; end row
        mov dl, 79             ; end column
        int 10h                ; BIOS video interrupt - display the window

        ; 2nd layer - red background (3,3 - 21,76)
        mov ah, 07h
        mov bh, 40h            ; background color red
        mov ch, 3
        mov cl, 3
        mov dh, 21
        mov dl, 76
        int 10h

        ; 3rd layer - yellow background (7,7 - 17,72)
        mov ah, 07h
        mov bh, 60h            ; background color yellow
        mov ch, 7
        mov cl, 7
        mov dh, 17
        mov dl, 72
        int 10h

        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00             ; page 0
        mov dh, 8              ; row 8
        mov dl, 8              ; column 8
        int 10h

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1    ; "PROUD TO BE A" at 8,8
        int 21h

        mov ah, 02h
        mov bh, 00
        mov dh, 9              ; row 9
        mov dl, 8              ; column 8
        int 10h

        mov ah, 09h
        mov dx, offset var2    ; "FILIPINO ENGINEER" at 9,8
        int 21h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
