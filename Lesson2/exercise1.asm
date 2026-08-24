; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.code

start:
    mov ah,02h      

    mov dl, 41h     
    int 21h         
    mov dl, 61h      
    int 21h
    mov dl, 72h
    int 21h
    mov dl, 6fh 
    int 21h
    mov dl, 6eh
    int 21h
    mov dl, 20h
    int 21h
    mov dl, 4ch
    int 21h
    mov dl, 75h
    int 21h
    mov dl, 64h
    int 21h
    mov dl, 77h
    int 21h
    mov dl, 69h
    int 21h
    mov dl, 67h
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov dl, 41h
    int 21h
    mov dl, 2eh
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov dl, 41h
    int 21h
    mov dl, 6ch
    int 21h
    mov dl, 74h
    int 21h
    mov dl, 61h
    int 21h
    mov dl, 72h
    int 21h

    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov ah,4ch      
    int 21h

end start

    





    

