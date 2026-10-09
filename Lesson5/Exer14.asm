; AARON LUDWIG A. ALTAR
; CPE4B
; Exer14 - Mobile Phone (Interrupt 10h)

.model small
.stack
.data

var1    DB 'V   13:26    #','$'
var2    DB 'V   iGlobe   #','$'
var3    DB 'V            #','$'
var4    DB 'V  AARON L.  #','$'
var5    DB 'O    CPE4B   #','$'
var6    DB 'Menu     Names','$'
var7    DB 'CALL   OK   END','$'
var8    DB '1     2     3','$'
var9    DB '4     5     6','$'
var10   DB '7     8     9','$'
var11   DB '*     0     #','$'

.code
start:

        ; screen background (0,0 - 24,79)
        mov ah, 06h            ; Function 06h - scroll up window
        mov bh, 1Fh            ; blue background, white text
        mov ch, 0              ; start row
        mov cl, 0              ; start column
        mov dh, 24             ; end row
        mov dl, 79             ; end column
        int 10h                ; BIOS video interrupt - display the window

        ; antenna (0,32 - 2,33)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 0
        mov cl, 32
        mov dh, 2
        mov dl, 33
        int 10h

        ; phone body (3,30 - 24,49)
        mov ah, 06h
        mov bh, 70h            ; white
        mov ch, 3
        mov cl, 30
        mov dh, 24
        mov dl, 49
        int 10h

        ; earpiece (4,37 - 4,42)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 4
        mov cl, 37
        mov dh, 4
        mov dl, 42
        int 10h

        ; LCD bezel (5,32 - 12,47)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 5
        mov cl, 32
        mov dh, 12
        mov dl, 47
        int 10h

        ; LCD screen (6,33 - 11,46)
        mov ah, 06h
        mov bh, 20h            ; green, black text
        mov ch, 6
        mov cl, 33
        mov dh, 11
        mov dl, 46
        int 10h

        ; <---- control keys ---->
        ; call key (14,32 - 14,35)
        mov ah, 06h
        mov bh, 2Fh            ; green, white text
        mov ch, 14
        mov cl, 32
        mov dh, 14
        mov dl, 35
        int 10h

        ; OK / navigation key (14,38 - 14,41)
        mov ah, 06h
        mov bh, 1Fh            ; blue, white text
        mov ch, 14
        mov cl, 38
        mov dh, 14
        mov dl, 41
        int 10h

        ; end key (14,44 - 14,47)
        mov ah, 06h
        mov bh, 4Fh            ; red, white text
        mov ch, 14
        mov cl, 44
        mov dh, 14
        mov dl, 47
        int 10h

        ; <---- keypad (4 rows x 3 keys) ---->
        ; key 1 (16,32 - 16,35)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 16
        mov cl, 32
        mov dh, 16
        mov dl, 35
        int 10h

        ; key 2 (16,38 - 16,41)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 16
        mov cl, 38
        mov dh, 16
        mov dl, 41
        int 10h

        ; key 3 (16,44 - 16,47)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 16
        mov cl, 44
        mov dh, 16
        mov dl, 47
        int 10h

        ; key 4 (18,32 - 18,35)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 18
        mov cl, 32
        mov dh, 18
        mov dl, 35
        int 10h

        ; key 5 (18,38 - 18,41)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 18
        mov cl, 38
        mov dh, 18
        mov dl, 41
        int 10h

        ; key 6 (18,44 - 18,47)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 18
        mov cl, 44
        mov dh, 18
        mov dl, 47
        int 10h

        ; key 7 (20,32 - 20,35)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 20
        mov cl, 32
        mov dh, 20
        mov dl, 35
        int 10h

        ; key 8 (20,38 - 20,41)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 20
        mov cl, 38
        mov dh, 20
        mov dl, 41
        int 10h

        ; key 9 (20,44 - 20,47)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 20
        mov cl, 44
        mov dh, 20
        mov dl, 47
        int 10h

        ; key * (22,32 - 22,35)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 22
        mov cl, 32
        mov dh, 22
        mov dl, 35
        int 10h

        ; key 0 (22,38 - 22,41)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 22
        mov cl, 38
        mov dh, 22
        mov dl, 41
        int 10h

        ; key # (22,44 - 22,47)
        mov ah, 06h
        mov bh, 0Fh            ; black, white text
        mov ch, 22
        mov cl, 44
        mov dh, 22
        mov dl, 47
        int 10h

        mov ax, @data          ; initialize the data segment
        mov ds, ax

        ; <---- LCD text ---->
        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dh, 6              ; row
        mov dl, 33             ; column
        int 10h
        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1    ; signal / time / battery
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 7
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var2    ; network name
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 8
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var3    ; signal / battery
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 9
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var4    ; owner name
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 10
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var5    ; signal / section / battery
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 11
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var6    ; soft keys
        int 21h

        ; <---- key labels ---->
        mov ah, 02h
        mov bh, 00h
        mov dh, 14
        mov dl, 32
        int 10h
        mov ah, 09h
        mov dx, offset var7    ; control key labels
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 16
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var8    ; keys 1 2 3
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 18
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var9    ; keys 4 5 6
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 20
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var10   ; keys 7 8 9
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 22
        mov dl, 33
        int 10h
        mov ah, 09h
        mov dx, offset var11   ; keys * 0 #
        int 21h

        mov ah, 02h            ; move the cursor near the bottom so the
        mov bh, 00h            ; DOS prompt will not cover the design
        mov dh, 23
        mov dl, 0
        int 10h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
