.model small				
.stack
.code

start:
       
        mov ah, 02h
        mov cx, 26
        mov bl, 61h     ; ASCII character for letter a stored at register bl
        mov dl, 41h	      ; display  letter A  
        mov dh, dl	      ; store letter A to register dh 
        back:    int 21h
        mov dl, bl	      ; display letter a 	
        int 21h	      
        inc dh	     ; increment dh from A to J as the loop progresses 
        inc bl	     ; decrement from  9 to 0 as the loop progresses
        mov dl, dh
        loop back

mov ah, 4ch
int 21h

end start