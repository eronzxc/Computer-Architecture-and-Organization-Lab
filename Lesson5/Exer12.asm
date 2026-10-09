; AARON LUDWIG A. ALTAR
; CPE4B
; Exer12 - My Logo (Interrupt 10h)

.model small
.stack
.data

var1    DB 'EST. 2026','$'
var2    DB 'A L T A R   D E V   S T U D I O','$'
var3    DB 'Code . Create . Innovate','$'

.code
start:

        ; screen background (0,0 - 24,79)
        mov ah, 06h            ; Function 06h - scroll up window
        mov bh, 1Eh            ; blue background, yellow text
        mov ch, 0              ; start row
        mov cl, 0              ; start column
        mov dh, 24             ; end row
        mov dl, 79             ; end column
        int 10h                ; BIOS video interrupt - display the window

        ; badge shadow (3,26 - 18,57)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 3
        mov cl, 26
        mov dh, 18
        mov dl, 57
        int 10h

        ; badge outer ring (2,24 - 17,55)
        mov ah, 06h
        mov bh, 30h            ; cyan
        mov ch, 2
        mov cl, 24
        mov dh, 17
        mov dl, 55
        int 10h

        ; badge inner (3,26 - 16,53)
        mov ah, 06h
        mov bh, 70h            ; white, black text
        mov ch, 3
        mov cl, 26
        mov dh, 16
        mov dl, 53
        int 10h

        ; <---- corner accents ---->
        ; top-left accent (2,24 - 2,25)
        mov ah, 06h
        mov bh, 60h            ; yellow
        mov ch, 2
        mov cl, 24
        mov dh, 2
        mov dl, 25
        int 10h

        ; top-right accent (2,54 - 2,55)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 2
        mov cl, 54
        mov dh, 2
        mov dl, 55
        int 10h

        ; bottom-left accent (17,24 - 17,25)
        mov ah, 06h
        mov bh, 50h            ; magenta
        mov ch, 17
        mov cl, 24
        mov dh, 17
        mov dl, 25
        int 10h

        ; bottom-right accent (17,54 - 17,55)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 17
        mov cl, 54
        mov dh, 17
        mov dl, 55
        int 10h

        ; <---- letter A ---->
        ; A - top (5,29 - 6,39)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 5
        mov cl, 29
        mov dh, 6
        mov dl, 39
        int 10h

        ; A - left leg (7,29 - 14,31)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 7
        mov cl, 29
        mov dh, 14
        mov dl, 31
        int 10h

        ; A - right leg (7,37 - 14,39)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 7
        mov cl, 37
        mov dh, 14
        mov dl, 39
        int 10h

        ; A - crossbar (9,32 - 10,36)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 9
        mov cl, 32
        mov dh, 10
        mov dl, 36
        int 10h

        ; <---- letter L ---->
        ; L - vertical (5,42 - 14,44)
        mov ah, 06h
        mov bh, 10h            ; blue
        mov ch, 5
        mov cl, 42
        mov dh, 14
        mov dl, 44
        int 10h

        ; L - foot (13,45 - 14,50)
        mov ah, 06h
        mov bh, 10h            ; blue
        mov ch, 13
        mov cl, 45
        mov dh, 14
        mov dl, 50
        int 10h

        ; name banner (19,20 - 21,59)
        mov ah, 06h
        mov bh, 4Fh            ; red, white text
        mov ch, 19
        mov cl, 20
        mov dh, 21
        mov dl, 59
        int 10h

        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dh, 16             ; row
        mov dl, 35             ; column
        int 10h
        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1    ; year under the letters
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 20
        mov dl, 24
        int 10h
        mov ah, 09h
        mov dx, offset var2    ; logo name in the banner
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 23
        mov dl, 28
        int 10h
        mov ah, 09h
        mov dx, offset var3    ; tagline
        int 21h

        mov ah, 02h            ; move the cursor near the bottom so the
        mov bh, 00h            ; DOS prompt will not cover the design
        mov dh, 23
        mov dl, 0
        int 10h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
