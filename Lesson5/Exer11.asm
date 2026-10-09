; AARON LUDWIG A. ALTAR
; CPE4B
; Exer11 - Resistor Color Code (Interrupt 10h)

.model small
.stack
.data

var1    DB 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0DBh, 0DBh,'$'
var2    DB 0B1h, 0B1h, 0B1h, 0B1h, 0B1h, 0B1h, 0B1h, 0B1h, 0B1h, 0B1h, 0B1h, 0B1h,'$'
var3    DB 'RESISTOR COLOR CODE CHART','$'
var4    DB '5    6    x100      2%','$'
var5    DB 'Green-Blue-Red-Red = 56 x 100 = 5,600 Ohms (5.6 kOhms) +/-2%','$'
var6    DB 'BAND','$'
var7    DB 'COLOR     DIGIT   MULTIPLIER   TOLERANCE','$'
var8    DB 'BLACK     0       x1           -','$'
var9    DB 'BROWN     1       x10          +/-1%','$'
var10   DB 'RED       2       x100         +/-2%','$'
var11   DB 'ORANGE    3       x1K          -','$'
var12   DB 'YELLOW    4       x10K         -','$'
var13   DB 'GREEN     5       x100K        +/-0.5%','$'
var14   DB 'BLUE      6       x1M          +/-0.25%','$'
var15   DB 'VIOLET    7       x10M         +/-0.1%','$'
var16   DB 'GRAY      8       x100M        +/-0.05%','$'
var17   DB 'WHITE     9       x1G          -','$'
var18   DB 'GOLD      -       x0.1         +/-5%','$'
var19   DB 'SILVER    -       x0.01        +/-10%','$'
var20   DB 'NONE      -       -            +/-20%','$'

.code
start:

        ; screen background (0,0 - 24,79)
        mov ah, 06h            ; Function 06h - scroll up window
        mov bh, 0Fh            ; black background, white text
        mov ch, 0              ; start row
        mov cl, 0              ; start column
        mov dh, 24             ; end row
        mov dl, 79             ; end column
        int 10h                ; BIOS video interrupt - display the window

        ; title bar (0,0 - 0,79)
        mov ah, 06h
        mov bh, 1Eh            ; blue background, yellow text
        mov ch, 0
        mov cl, 0
        mov dh, 0
        mov dl, 79
        int 10h

        ; <---- resistor drawing ---->
        ; lead wire (4,8 - 4,71)
        mov ah, 06h
        mov bh, 70h            ; white (silver)
        mov ch, 4
        mov cl, 8
        mov dh, 4
        mov dl, 71
        int 10h

        ; resistor body (2,24 - 6,55)
        mov ah, 06h
        mov bh, 30h            ; cyan
        mov ch, 2
        mov cl, 24
        mov dh, 6
        mov dl, 55
        int 10h

        ; 1st band - green (5) (2,28 - 6,29)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 2
        mov cl, 28
        mov dh, 6
        mov dl, 29
        int 10h

        ; 2nd band - blue (6) (2,33 - 6,34)
        mov ah, 06h
        mov bh, 10h            ; blue
        mov ch, 2
        mov cl, 33
        mov dh, 6
        mov dl, 34
        int 10h

        ; 3rd band - red (x100) (2,38 - 6,39)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 2
        mov cl, 38
        mov dh, 6
        mov dl, 39
        int 10h

        ; 4th band - red (+/-2%) (2,48 - 6,49)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 2
        mov cl, 48
        mov dh, 6
        mov dl, 49
        int 10h

        ; <---- color code chart ---->
        ; chart panel (10,6 - 23,73)
        mov ah, 06h
        mov bh, 30h            ; cyan, black text
        mov ch, 10
        mov cl, 6
        mov dh, 23
        mov dl, 73
        int 10h

        ; chart header (10,6 - 10,73)
        mov ah, 06h
        mov bh, 1Eh            ; blue, yellow text
        mov ch, 10
        mov cl, 6
        mov dh, 10
        mov dl, 73
        int 10h

        ; black swatch (11,8 - 11,19)
        mov ah, 06h
        mov bh, 00h            ; black
        mov ch, 11
        mov cl, 8
        mov dh, 11
        mov dl, 19
        int 10h

        ; brown swatch (12,8 - 12,19)
        mov ah, 06h
        mov bh, 60h            ; brown
        mov ch, 12
        mov cl, 8
        mov dh, 12
        mov dl, 19
        int 10h

        ; red swatch (13,8 - 13,19)
        mov ah, 06h
        mov bh, 40h            ; red
        mov ch, 13
        mov cl, 8
        mov dh, 13
        mov dl, 19
        int 10h

        ; orange swatch (14,8 - 14,19)
        mov ah, 06h
        mov bh, 4Eh            ; red background, yellow text
        mov ch, 14
        mov cl, 8
        mov dh, 14
        mov dl, 19
        int 10h

        ; yellow swatch (15,8 - 15,19)
        mov ah, 06h
        mov bh, 0Eh            ; black background, yellow text
        mov ch, 15
        mov cl, 8
        mov dh, 15
        mov dl, 19
        int 10h

        ; green swatch (16,8 - 16,19)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 16
        mov cl, 8
        mov dh, 16
        mov dl, 19
        int 10h

        ; blue swatch (17,8 - 17,19)
        mov ah, 06h
        mov bh, 10h            ; blue
        mov ch, 17
        mov cl, 8
        mov dh, 17
        mov dl, 19
        int 10h

        ; violet swatch (18,8 - 18,19)
        mov ah, 06h
        mov bh, 50h            ; magenta (violet)
        mov ch, 18
        mov cl, 8
        mov dh, 18
        mov dl, 19
        int 10h

        ; gray swatch (19,8 - 19,19)
        mov ah, 06h
        mov bh, 08h            ; black background, gray text
        mov ch, 19
        mov cl, 8
        mov dh, 19
        mov dl, 19
        int 10h

        ; white swatch (20,8 - 20,19)
        mov ah, 06h
        mov bh, 0Fh            ; black background, white text
        mov ch, 20
        mov cl, 8
        mov dh, 20
        mov dl, 19
        int 10h

        ; gold swatch (21,8 - 21,19)
        mov ah, 06h
        mov bh, 6Eh            ; brown background, yellow text
        mov ch, 21
        mov cl, 8
        mov dh, 21
        mov dl, 19
        int 10h

        ; silver swatch (22,8 - 22,19)
        mov ah, 06h
        mov bh, 70h            ; white (silver)
        mov ch, 22
        mov cl, 8
        mov dh, 22
        mov dl, 19
        int 10h

        mov ax, @data          ; initialize the data segment
        mov ds, ax

        ; <---- title and resistor values ---->
        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dh, 0              ; row
        mov dl, 27             ; column
        int 10h
        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var3    ; "RESISTOR COLOR CODE CHART"
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 7
        mov dl, 28
        int 10h
        mov ah, 09h
        mov dx, offset var4    ; value under each band
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 8
        mov dl, 10
        int 10h
        mov ah, 09h
        mov dx, offset var5    ; sample reading of the resistor
        int 21h

        ; <---- fill the swatches that need a brighter / mixed color ---->
        ; 0DBh = full block (solid text color), 0B1h = shaded block (mix of text and background)
        mov ah, 02h
        mov bh, 00h
        mov dh, 14
        mov dl, 8
        int 10h
        mov ah, 09h
        mov dx, offset var2    ; orange swatch - shaded blocks
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 15
        mov dl, 8
        int 10h
        mov ah, 09h
        mov dx, offset var1    ; yellow swatch - full blocks
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 19
        mov dl, 8
        int 10h
        mov ah, 09h
        mov dx, offset var1    ; gray swatch - full blocks
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 20
        mov dl, 8
        int 10h
        mov ah, 09h
        mov dx, offset var1    ; white swatch - full blocks
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 21
        mov dl, 8
        int 10h
        mov ah, 09h
        mov dx, offset var2    ; gold swatch - shaded blocks
        int 21h

        ; <---- chart text ---->
        mov ah, 02h
        mov bh, 00h
        mov dh, 10
        mov dl, 8
        int 10h
        mov ah, 09h
        mov dx, offset var6    ; header - swatch column
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 10
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var7    ; header - value columns
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 11
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var8    ; black values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 12
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var9    ; brown values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 13
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var10   ; red values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 14
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var11   ; orange values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 15
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var12   ; yellow values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 16
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var13   ; green values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 17
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var14   ; blue values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 18
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var15   ; violet values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 19
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var16   ; gray values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 20
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var17   ; white values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 21
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var18   ; gold values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 22
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var19   ; silver values
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 23
        mov dl, 22
        int 10h
        mov ah, 09h
        mov dx, offset var20   ; no 4th band
        int 21h

        mov ah, 02h            ; move the cursor near the bottom so the
        mov bh, 00h            ; DOS prompt will not cover the design
        mov dh, 23
        mov dl, 0
        int 10h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
