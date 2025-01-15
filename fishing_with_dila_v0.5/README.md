# fishing_with_dila_v0.5 by dila

My Keygen for fishing_with_dila_v0.5 by dila

Algorithm:
```
 MOV ebx, 3ADAFFCFh  ; Start with 3ADAFFCFh
 ROR EBX,10h         ; Rotate right 10h
 XOR BX, 0DEAFh      
 NEG ebx
 SUB bh, 20h 
```

The crackme checks the reverse, making sure the input is equal to **3ADAFFCFh** after the checking algorithm is complete.

Link to crackme: https://crackmes.one/crackme/5ab77f6433c5d40ad448cab4

The cracked executable was made by changing the hex bytes "E8 48 00 00 00" to "EB 1E 00 00 00" in the executable.

This makes it so the instruction to call the procedure to execute the key checker, "E8 48" does not execute, and it is replaced with a JMP instruction to the success screen "EB 1E". 

Instructions for running keygen:

1. Navigate to directory in cmd

2. Type 'Keygen.exe'
