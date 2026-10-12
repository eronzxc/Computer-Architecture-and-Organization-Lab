; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

don1    DB 'HELLO    ',13,10,'$'
don2    DB 'JUAN DELA CRUZ  ',13,10,'$'
don3    DB 'YES how about you? ',13,10,'$'
don4    DB ' PHILIPPINES',13,10,'$'
don5    DB 'BSCpE',13,10,'$'
don6    DB 'Amazing! ',13,10,'$'

chatpar label byte             ; parameter list for the user's chat line
chatlen DB 50                  ; maximum number of characters
actlen  DB ?                   ; actual number of characters typed
chatfld DB 50 dup(' ')         ; characters typed by the user

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov cx, 2              ; counter - first 2 characters
        mov ah, 01h            ; Function 01h - read a key with echo
back:   mov dl, al
        int 21h
        loop back              ; repeat until CX = 0

        call hi                ; BOT: HELLO

        mov cx, 3              ; counter - next 3 characters
        mov ah, 01h
go:     mov dl, al
        int 21h
        loop go

        call huu               ; BOT: JUAN DELA CRUZ

        mov cx, 3
        mov ah, 01h
lipat:  mov dl, al
        int 21h
        loop lipat

        call study             ; BOT: YES how about you?

        mov cx, 3
        mov ah, 01h
alin:   mov dl, al
        int 21h
        loop alin

        call skul              ; BOT: PHILIPPINES

        mov cx, 3
        mov ah, 01h
ganda:  mov dl, al
        int 21h
        loop ganda

        call course            ; BOT: BSCpE

        mov cx, 3
        mov ah, 01h
owss:   mov dl, al
        int 21h
        loop owss

        call dscryb            ; BOT: Amazing!

        call exit              ; end the chat

hi:     call agwat             ; let the user finish the line
        mov ah, 09h            ; Function 09h - display string
        mov dx, offset don1
        int 21h
        mov ah, 07h            ; wait for a key without echo
        int 21h
        ret

huu:    call agwat
        mov ah, 09h
        mov dx, offset don2
        int 21h
        ret

study:  call agwat
        mov ah, 09h
        mov dx, offset don3
        int 21h
        ret

skul:   call agwat
        mov ah, 09h
        mov dx, offset don4
        int 21h
        ret

course: call agwat
        mov ah, 09h
        mov dx, offset don5
        int 21h
        ret

dscryb: call agwat
        mov ah, 09h
        mov dx, offset don6
        int 21h
        ret

agwat:  mov ah, 0Ah            ; Function 0Ah - buffered string input
        mov dx, offset chatpar ; store the rest of the user's line
        int 21h                ; wait until Enter is pressed
        mov ah, 02h            ; Function 02h - display character
        mov dl, 0Ah            ; line feed - BOT reply goes to the next line
        int 21h
        ret

exit:   mov ah, 4Ch            ; terminate program
        int 21h

end start
