; creakme_001 by disip
; Keygen by github/kenedii
; Link to crackme: https://crackmes.one/crackme/5ab77f6633c5d40ad448cc32

; Note: Username must be (3 >= letters <=5)
; The GetDlgItemTextA call reads in up to 256 bytes, but there is only space in memory for 10 password characters, so only 5 username characters.

include \masm32\include\masm32rt.inc
.data
instruction1 db "Enter a username (3 >= letters <=5) : ",13,10,0
instruction2 db "Generating Password . . .",13,10,0
instruction3 db "Use the below password to unlock your program: ",13,10,0

username db 256 dup(0)  
index db 0          
nameLength dd 0        
buf1 db 256 dup(0)
bufferIndex dd 0

.code

start:

; Accept username as input from user
invoke StdOut, offset instruction1
invoke StdIn, offset username, 32

invoke StdOut, offset instruction2

; Calculate nameLength of username and store in nameLength buffer
push offset username
call StrLen
mov nameLength, eax  ; Corrected to store eax into nameLength

jmp gen_key

finish:
invoke StdOut, offset instruction3
invoke StdOut, offset buf1
jmp endpoint

gen_key:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    mov index, al  ; Corrected to use al for byte assignment

loc_401109:
    xor ebx, ebx
    mov bl, [username + eax]  ; Correct syntax for accessing byte array
    cmp bl, 'Z'
    jnz short loc_401118

    dec bl

loc_401118:
    cmp bl, 'z'
    jnz short loc_40111F

    dec bl

loc_40111F:
    cmp bl, '9'
    jnz short loc_401126

    dec bl

loc_401126:
    push eax
    add eax, 'a'  ; Use 'a' directly for clarity
    add bh, al
    pop eax
    inc bl
    inc eax
    push eax
    inc index  ; Use inc for byte index

    ; letters are stored in bx. need to append them to buf1
    mov edx, bufferIndex               ; Load bufferIndex into DI
    mov byte ptr[buf1 + edx], bl       ; Store the lower byte of BX in buf1
    inc edx                           ; Increment DI (bufferIndex)
    mov byte ptr[buf1 + edx], bh       ; Store the higher byte of BX in buf1
    inc edx                            ; Increment DI (bufferIndex)

    mov bufferIndex, edx               ; Store updated DI back into bufferIndex
    ;inc bufferIndex  ; Increment bufferIndex again to skip to next position

    pop eax
    cmp eax, nameLength
    jnz short loc_401109
    jmp finish

endpoint:
	invoke StdIn, offset buf1, 32 ; Closes the window when Enter is pressed

end start