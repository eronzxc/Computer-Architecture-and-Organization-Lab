; AARON LUDWIG A. ALTAR
; CPE4B
; Exer13 - SMPTE TV Color Bars (Interrupt 10h)

.model small
.stack
.data

var1    DB 'GMA NETWORK, INC.','$'
var2    DB 'Channel 7  |  Kapuso Network','$'
var3    DB 'GMA Network Center, EDSA cor. Timog Ave.','$'
var4    DB 'Diliman, Quezon City, Philippines','$'
var5    DB 'PLEASE STAND BY...','$'
var6    DB 'COLOR BARS','$'
var7    DB 'SMPTE','$'

.code
start:

        ; <---- top bars: rows 0-16 (2/3 of the screen), 7 equal bars ---->
        ; white bar (0,0 - 16,10)
        mov ah, 06h            ; Function 06h - scroll up window
        mov bh, 70h            ; white
        mov ch, 0              ; start row
        mov cl, 0              ; start column
        mov dh, 16             ; end row
        mov dl, 10             ; end column
        int 10h                ; BIOS video interrupt - display the window

        ; yellow bar (0,11 - 16,22)
        mov ah, 06h
        mov bh, 60h            ; yellow
        mov ch, 0
        mov cl, 11
        mov dh, 16
        mov dl, 22
        int 10h

        ; cyan bar (0,23 - 16,33)
        mov ah, 06h
        mov bh, 30h            ; cyan
        mov ch, 0
        mov cl, 23
        mov dh, 16
        mov dl, 33
        int 10h

        ; green bar (0,34 - 16,45)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 0
        mov cl, 34
        mov dh, 16
        mov dl, 45
        int 10h

        ; magenta bar (0,46 - 16,56)
        mov ah, 06h
        mov bh, 50h            ; magenta
        mov ch, 0
        mov cl, 46
        mov dh, 16
        mov dl, 56
        int 10h

        ; red bar (0,57 - 16,68)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 0
        mov cl, 57
        mov dh, 16
        mov dl, 68
        int 10h

        ; blue bar (0,69 - 16,79)
        mov ah, 06h
        mov bh, 10h            ; blue
        mov ch, 0
        mov cl, 69
        mov dh, 16
        mov dl, 79
        int 10h

        ; <---- middle strip: rows 17-18 (bars in reverse order with black) ---->
        ; blue strip (17,0 - 18,10)
        mov ah, 06h
        mov bh, 10h            ; blue
        mov ch, 17
        mov cl, 0
        mov dh, 18
        mov dl, 10
        int 10h

        ; black strip (17,11 - 18,22)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 17
        mov cl, 11
        mov dh, 18
        mov dl, 22
        int 10h

        ; magenta strip (17,23 - 18,33)
        mov ah, 06h
        mov bh, 50h            ; magenta
        mov ch, 17
        mov cl, 23
        mov dh, 18
        mov dl, 33
        int 10h

        ; black strip (17,34 - 18,45)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 17
        mov cl, 34
        mov dh, 18
        mov dl, 45
        int 10h

        ; cyan strip (17,46 - 18,56)
        mov ah, 06h
        mov bh, 30h            ; cyan
        mov ch, 17
        mov cl, 46
        mov dh, 18
        mov dl, 56
        int 10h

        ; black strip (17,57 - 18,68)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 17
        mov cl, 57
        mov dh, 18
        mov dl, 68
        int 10h

        ; white strip (17,69 - 18,79)
        mov ah, 06h
        mov bh, 70h            ; white
        mov ch, 17
        mov cl, 69
        mov dh, 18
        mov dl, 79
        int 10h

        ; <---- bottom row: rows 19-24 (-I, white, +Q, black, PLUGE, black) ---->
        ; -I signal (19,0 - 24,13)
        mov ah, 06h
        mov bh, 10h            ; blue
        mov ch, 19
        mov cl, 0
        mov dh, 24
        mov dl, 13
        int 10h

        ; white (19,14 - 24,27)
        mov ah, 06h
        mov bh, 70h            ; white, black text
        mov ch, 19
        mov cl, 14
        mov dh, 24
        mov dl, 27
        int 10h

        ; +Q signal (19,28 - 24,42)
        mov ah, 06h
        mov bh, 50h            ; magenta
        mov ch, 19
        mov cl, 28
        mov dh, 24
        mov dl, 42
        int 10h

        ; black (19,43 - 24,56)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 19
        mov cl, 43
        mov dh, 24
        mov dl, 56
        int 10h

        ; PLUGE (19,57 - 24,68)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 19
        mov cl, 57
        mov dh, 24
        mov dl, 68
        int 10h

        ; black (19,69 - 24,79)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 19
        mov cl, 69
        mov dh, 24
        mov dl, 79
        int 10h

        ; <---- network info box ---->
        ; info box border (5,16 - 11,63)
        mov ah, 06h
        mov bh, 70h            ; white
        mov ch, 5
        mov cl, 16
        mov dh, 11
        mov dl, 63
        int 10h

        ; info box title line (6,18 - 6,61)
        mov ah, 06h
        mov bh, 0Eh            ; black, yellow text
        mov ch, 6
        mov cl, 18
        mov dh, 6
        mov dl, 61
        int 10h

        ; info box body (7,18 - 10,61)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 7
        mov cl, 18
        mov dh, 10
        mov dl, 61
        int 10h

        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dh, 6              ; row
        mov dl, 31             ; column
        int 10h
        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1    ; "GMA NETWORK, INC."
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 7
        mov dl, 26
        int 10h
        mov ah, 09h
        mov dx, offset var2    ; "Channel 7  |  Kapuso Network"
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 8
        mov dl, 20
        int 10h
        mov ah, 09h
        mov dx, offset var3    ; "GMA Network Center, EDSA cor. Timog Ave."
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 9
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var4    ; "Diliman, Quezon City, Philippines"
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 10
        mov dl, 31
        int 10h
        mov ah, 09h
        mov dx, offset var5    ; "PLEASE STAND BY..."
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 21
        mov dl, 16
        int 10h
        mov ah, 09h
        mov dx, offset var6    ; "COLOR BARS"
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 22
        mov dl, 18
        int 10h
        mov ah, 09h
        mov dx, offset var7    ; "SMPTE"
        int 21h

        mov ah, 02h            ; move the cursor near the bottom so the
        mov bh, 00h            ; DOS prompt will not cover the design
        mov dh, 23
        mov dl, 0
        int 10h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
