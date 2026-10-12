; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

wn      DB 'What is your name?',20h,'$'
ag      DB 'how old are you?',20h,'$'
bd      DB 'When is  your birthday?',20h,'$'
gd      DB 'What is your gender?',20h,'$'
rpt     DB 'Repeat? Press N to Exit. ',20h,20h,'$'

wnpar   label byte             ; parameter list for name
wnlen   DB 20                  ; maximum number of characters
actwnlen DB ?                  ; actual length entered
wnfld   DB 20 dup(' ')         ; characters entered

agpar   label byte             ; parameter list for age
aglen   DB 10
actaglen DB ?
agfld   DB 10 dup(' ')

bdpar   label byte             ; parameter list for birthday
bdlen   DB 20
actbdlen DB ?
bdfld   DB 20 dup(' ')

gdpar   label byte             ; parameter list for gender
gdlen   DB 10
actgdlen DB ?
gdfld   DB 10 dup(' ')

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

ulit:
        ;** clear the screen **
        mov ah, 06h            ; Function 06h - scroll up / clear window
        mov al, 00h            ; AL = 0 - clear the whole window
        mov bh, 07h            ; attribute - white on black
        mov cx, 0000h          ; upper left corner (row 0, col 0)
        mov dx, 184Fh          ; lower right corner (row 24, col 79)
        int 10h

        ;** first prompt **
        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dx, 0820h          ; row 8, col 32
        int 10h

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset wn      ; "What is your name?"
        int 21h

        ;** response to first prompt **
        mov ah, 0Ah            ; Function 0Ah - buffered string input
        mov dx, offset wnpar
        int 21h

        ;** second prompt **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0920h          ; row 9, col 32
        int 10h

        mov ah, 09h
        mov dx, offset ag      ; "how old are you?"
        int 21h

        ;** response to second prompt **
        mov ah, 0Ah
        mov dx, offset agpar
        int 21h

        ;** third prompt **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0A20h          ; row 10, col 32
        int 10h

        mov ah, 09h
        mov dx, offset bd      ; "When is your birthday?"
        int 21h

        ;** response to third prompt **
        mov ah, 0Ah
        mov dx, offset bdpar
        int 21h

        ;** fourth prompt **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0B20h          ; row 11, col 32
        int 10h

        mov ah, 09h
        mov dx, offset gd      ; "What is your gender?"
        int 21h

        ;** response to fourth prompt **
        mov ah, 0Ah
        mov dx, offset gdpar
        int 21h

        ;** repeat prompt **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0E24h          ; row 14, col 36
        int 10h

        mov ah, 09h
        mov dx, offset rpt     ; "Repeat? Press N to Exit."
        int 21h

        mov ah, 01h            ; Function 01h - read a key with echo
        int 21h

        cmp al, 'N'            ; is it N?
        je tapos               ; if so, end the program
        cmp al, 'n'            ; also accept lowercase n
        je tapos
        jmp ulit               ; any other key - repeat

tapos:  mov ah, 4Ch            ; terminate program
        int 21h

end start
