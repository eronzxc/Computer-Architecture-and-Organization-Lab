; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

form    DB '              +--------------------------------------------------+',13,10
        DB '              |       University of Batangas - Lipa Campus       |',13,10
        DB '              |               Lipa City, Batangas                |',13,10
        DB '              |                                                  |',13,10
        DB '              |         Computer Engineering Department          |',13,10
        DB '              |                  Student Record                  |',13,10
        DB '              |                                                  |',13,10
        DB '              |     Student Name       :                         |',13,10
        DB '              |     Student Number     :                         |',13,10
        DB '              |     Year Level         :                         |',13,10
        DB '              |     Gender             :                         |',13,10
        DB '              |     Birthdate          :                         |',13,10
        DB '              |     Age                :                         |',13,10
        DB '              |                                                  |',13,10
        DB '              |                                                  |',13,10
        DB '              |       Programmed by: Aaron Ludwig A. Altar       |',13,10
        DB '              +--------------------------------------------------+',13,10,'$'

again   DB 'Input another record? [Y/N]: $'

snpar   label byte             ; parameter list for student name
snlen   DB 24                  ; maximum number of characters
actsnlen DB ?                  ; actual length entered
snfld   DB 24 dup(' ')         ; characters entered

nopar   label byte             ; parameter list for student number
nolen   DB 24
actnolen DB ?
nofld   DB 24 dup(' ')

ylpar   label byte             ; parameter list for year level
yllen   DB 24
actyllen DB ?
ylfld   DB 24 dup(' ')

gdpar   label byte             ; parameter list for gender
gdlen   DB 24
actgdlen DB ?
gdfld   DB 24 dup(' ')

bdpar   label byte             ; parameter list for birthdate
bdlen   DB 24
actbdlen DB ?
bdfld   DB 24 dup(' ')

agpar   label byte             ; parameter list for age
aglen   DB 4                   ; up to 3 digits + Enter
actaglen DB ?
agfld   DB 4 dup(' ')

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

restart:
        ;** clear the screen **
        mov ah, 06h            ; Function 06h - scroll up / clear window
        mov al, 00h            ; AL = 0 - clear the whole window
        mov bh, 07h            ; attribute - white on black
        mov cx, 0000h          ; upper left corner (row 0, col 0)
        mov dx, 184Fh          ; lower right corner (row 24, col 79)
        int 10h

        ;** display the student record form **
        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dx, 0200h          ; row 2, col 0
        int 10h

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset form    ; whole bordered form
        int 21h

        ;** student name **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0929h          ; row 9, col 41 (after the colon)
        int 10h

        mov ah, 0Ah            ; Function 0Ah - buffered string input
        mov dx, offset snpar
        int 21h

        ;** student number **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0A29h          ; row 10, col 41
        int 10h

        mov ah, 0Ah
        mov dx, offset nopar
        int 21h

        ;** year level **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0B29h          ; row 11, col 41
        int 10h

        mov ah, 0Ah
        mov dx, offset ylpar
        int 21h

        ;** gender **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0C29h          ; row 12, col 41
        int 10h

        mov ah, 0Ah
        mov dx, offset gdpar
        int 21h

        ;** birthdate **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0D29h          ; row 13, col 41
        int 10h

        mov ah, 0Ah
        mov dx, offset bdpar
        int 21h

        ;** age **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0E29h          ; row 14, col 41
        int 10h

        mov ah, 0Ah
        mov dx, offset agpar
        int 21h

        ;** ask to input another record **
        mov ah, 02h
        mov bh, 00h
        mov dx, 1419h          ; row 20, col 25
        int 10h

        mov ah, 09h
        mov dx, offset again   ; "Input another record? [Y/N]:"
        int 21h

getkey: mov ah, 07h            ; Function 07h - read a key without echo
        int 21h                ; AL = key pressed

        cmp al, 'Y'            ; is it Y?
        je yes                 ; if so, new record
        cmp al, 'y'            ; also accept lowercase y
        je yes
        cmp al, 'N'            ; is it N?
        je finish              ; if so, end the program
        cmp al, 'n'            ; also accept lowercase n
        je finish
        jmp getkey             ; any other key - wait for Y or N

yes:    jmp restart            ; restart is too far for je, so use jmp

finish:
        mov ah, 02h            ; move the cursor below the form
        mov bh, 00h            ; so the DOS prompt will not overlap
        mov dx, 1600h          ; row 22, col 0
        int 10h

        mov ah, 4Ch            ; terminate program
        int 21h

end start
