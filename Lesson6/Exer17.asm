; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

board   DB '               +------------------------------------------------+',13,10
        DB '               |                                                |',13,10
        DB '               |           PAPER, ROCK, SCISSORS GAME           |',13,10
        DB '               |    [P] Paper     [R] Rock     [S] Scissors     |',13,10
        DB '               |                                                |',13,10
        DB '               |    Player 1:             Player 2:             |',13,10
        DB '               |                                                |',13,10
        DB '               |                                                |',13,10
        DB '               |                                                |',13,10
        DB '               |                                                |',13,10
        DB '               +------------------------------------------------+',13,10,'$'

turn1   DB '        Player 1, press P, R or S (hidden)        $'
turn2   DB '        Player 2, press P, R or S (hidden)        $'
again   DB '    Play again? Press Y to continue, N to exit    $'

ready   DB 'READY   $'         ; shown while the move is still hidden
paper   DB 'Paper   $'
rock    DB 'Rock    $'
sciss   DB 'Scissors$'

p1win   DB '                 Player 1 wins!                 $'
p2win   DB '                 Player 2 wins!                 $'
draw    DB '         DRAW! Nobody wins this round.          $'
prmsg   DB '               Paper covers Rock!               $'
rsmsg   DB '             Rock crushes Scissors!             $'
spmsg   DB '              Scissors cut Paper!               $'
same    DB '       Both players picked the same move.       $'

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

        ;** display the game board **
        mov ah, 02h            ; Function 02h - set cursor position
        mov bh, 00h            ; page 0
        mov dx, 0300h          ; row 3, col 0
        int 10h

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset board
        int 21h

        ;** player 1 turn **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0F0Fh          ; row 15, col 15 (status line)
        int 10h

        mov ah, 09h
        mov dx, offset turn1   ; "Player 1, press P, R or S"
        int 21h

        call getmove           ; get a valid move (hidden)
        mov bl, al             ; BL = player 1 move

        mov ah, 02h
        mov bh, 00h
        mov dx, 081Eh          ; row 8, col 30 (after "Player 1:")
        int 10h

        mov ah, 09h
        mov dx, offset ready   ; show READY, not the move
        int 21h

        ;** player 2 turn **
        mov ah, 02h
        mov bh, 00h
        mov dx, 0F0Fh          ; row 15, col 15 (status line)
        int 10h

        mov ah, 09h
        mov dx, offset turn2   ; "Player 2, press P, R or S"
        int 21h

        call getmove           ; get a valid move (hidden)
        mov cl, al             ; CL = player 2 move

        ;** reveal both moves **
        mov ah, 02h
        mov bh, 00h
        mov dx, 081Eh          ; row 8, col 30 (player 1 move)
        int 10h

        mov al, bl             ; AL = player 1 move
        call getname           ; DX = offset of the move name
        mov ah, 09h
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dx, 0834h          ; row 8, col 52 (player 2 move)
        int 10h

        mov al, cl             ; AL = player 2 move
        call getname           ; DX = offset of the move name
        mov ah, 09h
        int 21h

        ;** decide the winner **
        cmp bl, cl             ; same move?
        jne notsame            ; if not, check who wins
        jmp tie                ; same move - it is a draw (too far for je)

notsame:
        cmp bl, 'P'            ; player 1 picked Paper?
        je p1paper
        cmp bl, 'R'            ; player 1 picked Rock?
        je p1rock
        jmp p1sciss            ; otherwise player 1 picked Scissors

p1paper:
        cmp cl, 'R'            ; Paper vs Rock
        je w1pr                ; player 1 wins
        jmp w2sp               ; Paper vs Scissors - player 2 wins

p1rock:
        cmp cl, 'S'            ; Rock vs Scissors
        je w1rs                ; player 1 wins
        jmp w2pr               ; Rock vs Paper - player 2 wins

p1sciss:
        cmp cl, 'P'            ; Scissors vs Paper
        je w1sp                ; player 1 wins
        jmp w2rs               ; Scissors vs Rock - player 2 wins

        ;** display the result **
w1pr:   call line1             ; cursor at the winner line
        mov ah, 09h
        mov dx, offset p1win   ; "Player 1 wins!"
        int 21h
        call line2             ; cursor at the reason line
        mov ah, 09h
        mov dx, offset prmsg   ; "Paper covers Rock!"
        int 21h
        jmp askagain

w1rs:   call line1
        mov ah, 09h
        mov dx, offset p1win   ; "Player 1 wins!"
        int 21h
        call line2
        mov ah, 09h
        mov dx, offset rsmsg   ; "Rock crushes Scissors!"
        int 21h
        jmp askagain

w1sp:   call line1
        mov ah, 09h
        mov dx, offset p1win   ; "Player 1 wins!"
        int 21h
        call line2
        mov ah, 09h
        mov dx, offset spmsg   ; "Scissors cut Paper!"
        int 21h
        jmp askagain

w2pr:   call line1
        mov ah, 09h
        mov dx, offset p2win   ; "Player 2 wins!"
        int 21h
        call line2
        mov ah, 09h
        mov dx, offset prmsg   ; "Paper covers Rock!"
        int 21h
        jmp askagain

w2rs:   call line1
        mov ah, 09h
        mov dx, offset p2win   ; "Player 2 wins!"
        int 21h
        call line2
        mov ah, 09h
        mov dx, offset rsmsg   ; "Rock crushes Scissors!"
        int 21h
        jmp askagain

w2sp:   call line1
        mov ah, 09h
        mov dx, offset p2win   ; "Player 2 wins!"
        int 21h
        call line2
        mov ah, 09h
        mov dx, offset spmsg   ; "Scissors cut Paper!"
        int 21h
        jmp askagain

tie:    call line1
        mov ah, 09h
        mov dx, offset draw    ; "DRAW! Nobody wins this round."
        int 21h
        call line2
        mov ah, 09h
        mov dx, offset same    ; "Both players picked the same move."
        int 21h

        ;** play again? **
askagain:
        mov ah, 02h
        mov bh, 00h
        mov dx, 0F0Fh          ; row 15, col 15 (status line)
        int 10h

        mov ah, 09h
        mov dx, offset again   ; "Play again? Y / N"
        int 21h

getkey: mov ah, 07h            ; Function 07h - read a key without echo
        int 21h

        cmp al, 'Y'            ; is it Y?
        je yes                 ; if so, play again
        cmp al, 'y'            ; also accept lowercase y
        je yes
        cmp al, 'N'            ; is it N?
        je finish              ; if so, end the game
        cmp al, 'n'            ; also accept lowercase n
        je finish
        jmp getkey             ; any other key - wait for Y or N

yes:    jmp restart            ; restart is too far for je, so use jmp

finish:
        mov ah, 02h            ; move the cursor below the board
        mov bh, 00h            ; so the DOS prompt will not overlap
        mov dx, 1100h          ; row 17, col 0
        int 10h

        mov ah, 4Ch            ; terminate program
        int 21h

;** getmove - wait for a valid move, returns AL = 'P', 'R' or 'S' **
getmove:
        mov ah, 07h            ; Function 07h - read a key without echo
        int 21h                ; AL = key pressed (not shown on screen)

        cmp al, 'P'            ; Paper?
        je valid
        cmp al, 'p'            ; lowercase p?
        je topaper
        cmp al, 'R'            ; Rock?
        je valid
        cmp al, 'r'            ; lowercase r?
        je torock
        cmp al, 'S'            ; Scissors?
        je valid
        cmp al, 's'            ; lowercase s?
        je toscissors
        jmp getmove            ; any other key - wait again

topaper:
        mov al, 'P'            ; store as uppercase P
        ret
torock: mov al, 'R'            ; store as uppercase R
        ret
toscissors:
        mov al, 'S'            ; store as uppercase S
        ret
valid:  ret                    ; valid move in AL

;** getname - AL = move, returns DX = offset of its name **
getname:
        mov dx, offset paper
        cmp al, 'P'            ; Paper?
        je done
        mov dx, offset rock
        cmp al, 'R'            ; Rock?
        je done
        mov dx, offset sciss   ; otherwise Scissors
done:   ret

;** line1 - cursor at the winner line **
line1:  mov ah, 02h
        mov bh, 00h
        mov dx, 0A10h          ; row 10, col 16
        int 10h
        ret

;** line2 - cursor at the reason line **
line2:  mov ah, 02h
        mov bh, 00h
        mov dx, 0B10h          ; row 11, col 16
        int 10h
        ret

end start
