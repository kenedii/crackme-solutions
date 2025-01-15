include \masm32\include\masm32rt.inc

.data
prompt db "The Valid Registration Key is: ",0
tempbuf1 dd 0
string1 db "                ",0
newline db 13,10,0


.code

start:
 mov ebx, 3ADAFFCFh
 ROR EBX,10h
 XOR BX, 0DEAFh
 neg ebx
 sub bh, 20h 

 mov eax, ebx
 lea edi, string1
 call to_string
 
 Invoke StdOut, offset prompt
 Invoke StdOut, offset string1
 Invoke StdOut, offset newline
 Invoke StdIn, offset tempbuf1, 32


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

