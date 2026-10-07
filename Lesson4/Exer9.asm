; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

var1    DB '+--------------------------------------------------------------------+',13,10,'$'
var2    DB '|                                                                    |',13,10,'$'
var3    DB '|   +-------+              Engr. Aaron Ludwig A. Altar               |',13,10,'$'
var4    DB '|   |   G   |              Full Stack Developer                      |',13,10,'$'
var5    DB '|   +-------+                                                        |',13,10,'$'
var6    DB '|   Google                 Office No.  : (02) 8123-4567              |',13,10,'$'
var7    DB '|                          Fax No.     : (02) 8123-4568              |',13,10,'$'
var8    DB '|   www.google.com         Res. No.    : (046) 123-4567              |',13,10,'$'
var9    DB '|                          Mobile No.  : 0932-943-4271               |',13,10,'$'
var10   DB '|                          Email       : aaronaltar@gmail.com        |',13,10,'$'

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1    ; top border
        int 21h

        mov ah, 09h
        mov dx, offset var2    ; blank line
        int 21h

        mov ah, 09h
        mov dx, offset var3    ; logo top + title and name
        int 21h

        mov ah, 09h
        mov dx, offset var4    ; logo + position
        int 21h

        mov ah, 09h
        mov dx, offset var5    ; logo bottom
        int 21h

        mov ah, 09h
        mov dx, offset var6    ; company name + office no.
        int 21h

        mov ah, 09h
        mov dx, offset var7    ; fax no.
        int 21h

        mov ah, 09h
        mov dx, offset var8    ; company website + res. no.
        int 21h

        mov ah, 09h
        mov dx, offset var9    ; mobile no.
        int 21h

        mov ah, 09h
        mov dx, offset var10   ; email address
        int 21h

        mov ah, 09h
        mov dx, offset var2    ; blank line
        int 21h

        mov ah, 09h
        mov dx, offset var1    ; bottom border (same as top)
        int 21h

        mov ah, 4Ch            ; terminate program
        int 21h

end start