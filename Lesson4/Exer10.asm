; AARON LUDWIG A. ALTAR
; CPE4B

.model small
.stack
.data

var1    DB 'My Favorite TV Shows',13,10
        DB '----------------------------------',13,10,'$'

var2    DB ' 1. Agent Kim Reactivated',13,10
        DB ' 2. Alice in Borderland',13,10
        DB ' 3. All of Us Are Dead',13,10
        DB ' 4. Black Clover',13,10
        DB ' 5. Can This Love Be Translated?',13,10
        DB ' 6. Crash Landing on You',13,10
        DB ' 7. Demon Slayer',13,10
        DB ' 8. Descendants of the Sun',13,10
        DB ' 9. Fairy Tail',13,10
        DB '10. Haikyu!!',13,10
        DB '11. Hunter X Hunter',13,10
        DB '12. Kuroko',39,'s Basketball',13,10
        DB '13. Love Next Door',13,10
        DB '14. Money Heist',13,10
        DB '15. Naruto',13,10
        DB '16. Our Sticky Love',13,10
        DB '17. Peaky Blinders',13,10
        DB '18. Prison Break',13,10
        DB '19. Squid Game',13,10
        DB '20. Teach You a Lesson',13,10
        DB '21. Vincenzo',13,10,'$'

.code
start:
        mov ax, @data          ; initialize the data segment
        mov ds, ax

        mov ah, 09h            ; Function 09h - display string
        mov dx, offset var1    ; title
        int 21h

        mov ah, 09h
        mov dx, offset var2    ; list of favorite TV shows
        int 21h

        mov ah, 4Ch            ; terminate program
        int 21h

end start