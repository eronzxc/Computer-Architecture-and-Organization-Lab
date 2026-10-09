; AARON LUDWIG A. ALTAR
; CPE4B
; Exer11.asm - Resistor Color Code

.model small
.stack
.data

var1    DB 'RESISTOR COLOR CODE',13,10,'$'
var2    DB 'COLOR         DIGIT         MULTIPLIER',13,10,'$'
var3    DB 'Black         0             x1',13,10,'$'
var4    DB 'Brown         1             x10',13,10,'$'
var5    DB 'Red           2             x100',13,10,'$'
var6    DB 'Orange        3             x1K',13,10,'$'
var7    DB 'Yellow        4             x10K',13,10,'$'
var8    DB 'Green         5             x100K',13,10,'$'
var9    DB 'Blue          6             x1M',13,10,'$'
var10   DB 'Violet        7             x10M',13,10,'$'
var11   DB 'Gray          8             x100M',13,10,'$'
var12   DB 'White         9             x1G',13,10,'$'

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

        ; ---- background of the whole screen (Cyan) ----
        mov ah, 06h            ; full screen cyan background
        mov bh, 30h
        mov ch, 0
        mov cl, 0
        mov dh, 24
        mov dl, 79
        int 10h

        ; ---- title and column headings ----
        mov ah, 02h            ; cursor position: row 0, column 30
        mov bh, 00h
        mov dh, 0
        mov dl, 30
        int 10h
        mov ah, 09h            ; title
        mov dx, offset var1
        int 21h

        mov ah, 02h            ; cursor position: row 2, column 12
        mov bh, 00h
        mov dh, 2
        mov dl, 12
        int 10h
        mov ah, 09h            ; headings
        mov dx, offset var2
        int 21h

        ; ---- band 1: Black ----
        mov ah, 06h            ; Black band
        mov bh, 0Fh
        mov ch, 3
        mov cl, 10
        mov dh, 4
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 3, column 12
        mov bh, 00h
        mov dh, 3
        mov dl, 12
        int 10h
        mov ah, 09h            ; Black - digit 0, multiplier x1
        mov dx, offset var3
        int 21h

        ; ---- band 2: Brown ----
        mov ah, 06h            ; Brown band
        mov bh, 6Fh
        mov ch, 5
        mov cl, 10
        mov dh, 6
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 5, column 12
        mov bh, 00h
        mov dh, 5
        mov dl, 12
        int 10h
        mov ah, 09h            ; Brown - digit 1, multiplier x10
        mov dx, offset var4
        int 21h

        ; ---- band 3: Red ----
        mov ah, 06h            ; Red band
        mov bh, 4Fh
        mov ch, 7
        mov cl, 10
        mov dh, 8
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 7, column 12
        mov bh, 00h
        mov dh, 7
        mov dl, 12
        int 10h
        mov ah, 09h            ; Red - digit 2, multiplier x100
        mov dx, offset var5
        int 21h

        ; ---- band 4: Orange ----
        mov ah, 06h            ; Orange band
        mov bh, 0C0h
        mov ch, 9
        mov cl, 10
        mov dh, 10
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 9, column 12
        mov bh, 00h
        mov dh, 9
        mov dl, 12
        int 10h
        mov ah, 09h            ; Orange - digit 3, multiplier x1K
        mov dx, offset var6
        int 21h

        ; ---- band 5: Yellow ----
        mov ah, 06h            ; Yellow band
        mov bh, 0E0h
        mov ch, 11
        mov cl, 10
        mov dh, 12
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 11, column 12
        mov bh, 00h
        mov dh, 11
        mov dl, 12
        int 10h
        mov ah, 09h            ; Yellow - digit 4, multiplier x10K
        mov dx, offset var7
        int 21h

        ; ---- band 6: Green ----
        mov ah, 06h            ; Green band
        mov bh, 2Fh
        mov ch, 13
        mov cl, 10
        mov dh, 14
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 13, column 12
        mov bh, 00h
        mov dh, 13
        mov dl, 12
        int 10h
        mov ah, 09h            ; Green - digit 5, multiplier x100K
        mov dx, offset var8
        int 21h

        ; ---- band 7: Blue ----
        mov ah, 06h            ; Blue band
        mov bh, 1Fh
        mov ch, 15
        mov cl, 10
        mov dh, 16
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 15, column 12
        mov bh, 00h
        mov dh, 15
        mov dl, 12
        int 10h
        mov ah, 09h            ; Blue - digit 6, multiplier x1M
        mov dx, offset var9
        int 21h

        ; ---- band 8: Violet ----
        mov ah, 06h            ; Violet band
        mov bh, 5Fh
        mov ch, 17
        mov cl, 10
        mov dh, 18
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 17, column 12
        mov bh, 00h
        mov dh, 17
        mov dl, 12
        int 10h
        mov ah, 09h            ; Violet - digit 7, multiplier x10M
        mov dx, offset var10
        int 21h

        ; ---- band 9: Gray ----
        mov ah, 06h            ; Gray band
        mov bh, 8Fh
        mov ch, 19
        mov cl, 10
        mov dh, 20
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 19, column 12
        mov bh, 00h
        mov dh, 19
        mov dl, 12
        int 10h
        mov ah, 09h            ; Gray - digit 8, multiplier x100M
        mov dx, offset var11
        int 21h

        ; ---- band 10: White ----
        mov ah, 06h            ; White band
        mov bh, 0F0h
        mov ch, 21
        mov cl, 10
        mov dh, 22
        mov dl, 69
        int 10h

        mov ah, 02h            ; cursor position: row 21, column 12
        mov bh, 00h
        mov dh, 21
        mov dl, 12
        int 10h
        mov ah, 09h            ; White - digit 9, multiplier x1G
        mov dx, offset var12
        int 21h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
