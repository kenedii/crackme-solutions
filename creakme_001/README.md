# creakme_001 by disip

My keygen built in MASM32 x86 Assembly for creakme_001 by disip.

Note: Username must be (3 >= letters <=5)

The GetDlgItemTextA call reads in up to 256 bytes, but there is only space in memory for 10 password characters, so only 5 username characters. (shoutout to [coffeemike's solution](https://crackmes.one/static/solution/5ab950c333c5d422feed8a81.zip) for this detail)

To make the cracked EXE I edited the instruction '33 C0' at 004010FE which is the beginning of the algorithm to check the decode key. The instruction was changed to 'EB 5E' which is a JMP instruction to 0040115E, the beginning of the 'registration complete' screen.

Link to crackme: https://crackmes.one/crackme/5ab77f6633c5d40ad448cc32

Instructions for running keygen:

1. Navigate to directory in cmd

2. Type 'keygen.exe'

3. Follow the instruction prompts.
