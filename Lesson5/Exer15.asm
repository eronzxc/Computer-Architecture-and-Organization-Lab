; AARON LUDWIG A. ALTAR
; CPE4B
; Exer15 - Chess Board (Interrupt 10h)
; each square = 2 rows x 4 columns, board = rows 4-19, columns 24-55

.model small
.stack
.data

var1    DB 'CHESS BOARD','$'
var2    DB '8','$'
var3    DB '7','$'
var4    DB '6','$'
var5    DB '5','$'
var6    DB '4','$'
var7    DB '3','$'
var8    DB '2','$'
var9    DB '1','$'
var10   DB 'a   b   c   d   e   f   g   h','$'
var11   DB 'Light squares: WHITE      Dark squares: GREEN','$'

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

        ; board frame (3,22 - 20,57)
        mov ah, 06h
        mov bh, 6Eh            ; yellow background, light yellow text
        mov ch, 3
        mov cl, 22
        mov dh, 20
        mov dl, 57
        int 10h

        ; whole board - light squares (4,24 - 19,55)
        mov ah, 06h
        mov bh, 70h            ; white
        mov ch, 4
        mov cl, 24
        mov dh, 19
        mov dl, 55
        int 10h

        ; <---- dark squares (green) ---->
        ; <---- rank 8 ---->
        ; b8 (4,28 - 5,31)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 4
        mov cl, 28
        mov dh, 5
        mov dl, 31
        int 10h

        ; d8 (4,36 - 5,39)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 4
        mov cl, 36
        mov dh, 5
        mov dl, 39
        int 10h

        ; f8 (4,44 - 5,47)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 4
        mov cl, 44
        mov dh, 5
        mov dl, 47
        int 10h

        ; h8 (4,52 - 5,55)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 4
        mov cl, 52
        mov dh, 5
        mov dl, 55
        int 10h

        ; <---- rank 7 ---->
        ; a7 (6,24 - 7,27)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 6
        mov cl, 24
        mov dh, 7
        mov dl, 27
        int 10h

        ; c7 (6,32 - 7,35)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 6
        mov cl, 32
        mov dh, 7
        mov dl, 35
        int 10h

        ; e7 (6,40 - 7,43)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 6
        mov cl, 40
        mov dh, 7
        mov dl, 43
        int 10h

        ; g7 (6,48 - 7,51)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 6
        mov cl, 48
        mov dh, 7
        mov dl, 51
        int 10h

        ; <---- rank 6 ---->
        ; b6 (8,28 - 9,31)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 8
        mov cl, 28
        mov dh, 9
        mov dl, 31
        int 10h

        ; d6 (8,36 - 9,39)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 8
        mov cl, 36
        mov dh, 9
        mov dl, 39
        int 10h

        ; f6 (8,44 - 9,47)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 8
        mov cl, 44
        mov dh, 9
        mov dl, 47
        int 10h

        ; h6 (8,52 - 9,55)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 8
        mov cl, 52
        mov dh, 9
        mov dl, 55
        int 10h

        ; <---- rank 5 ---->
        ; a5 (10,24 - 11,27)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 10
        mov cl, 24
        mov dh, 11
        mov dl, 27
        int 10h

        ; c5 (10,32 - 11,35)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 10
        mov cl, 32
        mov dh, 11
        mov dl, 35
        int 10h

        ; e5 (10,40 - 11,43)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 10
        mov cl, 40
        mov dh, 11
        mov dl, 43
        int 10h

        ; g5 (10,48 - 11,51)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 10
        mov cl, 48
        mov dh, 11
        mov dl, 51
        int 10h

        ; <---- rank 4 ---->
        ; b4 (12,28 - 13,31)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 12
        mov cl, 28
        mov dh, 13
        mov dl, 31
        int 10h

        ; d4 (12,36 - 13,39)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 12
        mov cl, 36
        mov dh, 13
        mov dl, 39
        int 10h

        ; f4 (12,44 - 13,47)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 12
        mov cl, 44
        mov dh, 13
        mov dl, 47
        int 10h

        ; h4 (12,52 - 13,55)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 12
        mov cl, 52
        mov dh, 13
        mov dl, 55
        int 10h

        ; <---- rank 3 ---->
        ; a3 (14,24 - 15,27)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 14
        mov cl, 24
        mov dh, 15
        mov dl, 27
        int 10h

        ; c3 (14,32 - 15,35)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 14
        mov cl, 32
        mov dh, 15
        mov dl, 35
        int 10h

        ; e3 (14,40 - 15,43)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 14
        mov cl, 40
        mov dh, 15
        mov dl, 43
        int 10h

        ; g3 (14,48 - 15,51)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 14
        mov cl, 48
        mov dh, 15
        mov dl, 51
        int 10h

        ; <---- rank 2 ---->
        ; b2 (16,28 - 17,31)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 16
        mov cl, 28
        mov dh, 17
        mov dl, 31
        int 10h

        ; d2 (16,36 - 17,39)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 16
        mov cl, 36
        mov dh, 17
        mov dl, 39
        int 10h

        ; f2 (16,44 - 17,47)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 16
        mov cl, 44
        mov dh, 17
        mov dl, 47
        int 10h

        ; h2 (16,52 - 17,55)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 16
        mov cl, 52
        mov dh, 17
        mov dl, 55
        int 10h

        ; <---- rank 1 ---->
        ; a1 (18,24 - 19,27)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 18
        mov cl, 24
        mov dh, 19
        mov dl, 27
        int 10h

        ; c1 (18,32 - 19,35)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 18
        mov cl, 32
        mov dh, 19
        mov dl, 35
        int 10h

        ; e1 (18,40 - 19,43)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 18
        mov cl, 40
        mov dh, 19
        mov dl, 43
        int 10h

        ; g1 (18,48 - 19,51)
        mov ah, 06h
        mov bh, 20h            ; green
        mov ch, 18
        mov cl, 48
        mov dh, 19
        mov dl, 51
        int 10h

        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dh, 1              ; row
        mov dl, 34             ; column
        int 10h
        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1    ; title
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 4
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var2    ; rank 8
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 6
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var3    ; rank 7
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 8
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var4    ; rank 6
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 10
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var5    ; rank 5
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 12
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var6    ; rank 4
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 14
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var7    ; rank 3
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 16
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var8    ; rank 2
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 18
        mov dl, 23
        int 10h
        mov ah, 09h
        mov dx, offset var9    ; rank 1
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 20
        mov dl, 25
        int 10h
        mov ah, 09h
        mov dx, offset var10   ; file letters a-h
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 22
        mov dl, 17
        int 10h
        mov ah, 09h
        mov dx, offset var11   ; color legend
        int 21h

        mov ah, 02h            ; move the cursor near the bottom so the
        mov bh, 00h            ; DOS prompt will not cover the design
        mov dh, 23
        mov dl, 0
        int 10h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
