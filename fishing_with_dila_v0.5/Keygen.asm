; fishing_with_dila_v0.5 by dila
; Keygen by github/kenedii
; Link to crackme: https://crackmes.one/crackme/5ab77f6433c5d40ad448cab4

include \masm32\include\masm32rt.inc

.data
prompt db "The Valid Registration Key is: ",0
tempbuf1 dd 0
string1 db "                ",0
newline db 13,10,0


.code

start:
; Crackme checks that input = 3ADAFFCFh after algorithm, so we start with 3ADAFFCFh.
 MOV ebx, 3ADAFFCFh        
 ROR EBX,10h
 XOR BX, 0DEAFh
 NEG ebx
 SUB bh, 20h 

 mov eax, ebx
 lea edi, string1
 call to_string
 
 Invoke StdOut, offset prompt
 Invoke StdOut, offset string1 ; print the correct registration key
 Invoke StdOut, offset newline
 Invoke StdIn, offset tempbuf1, 32 ; wait for enter key to close program


to_string PROC
 mov ebx, 10d
 xor ecx, ecx

repeated_division:
 xor edx, edx
 div ebx
 push dx
 add cl,1
 or eax,eax
 jnz repeated_division

load_digits:
 pop ax
 or al, 00110000b ; transforms to ascii
 stosb  ; store al into edi. edi = pointer to buffer
 loop load_digits
 mov byte ptr [edi], 0
 ret

to_string ENDP

end start

