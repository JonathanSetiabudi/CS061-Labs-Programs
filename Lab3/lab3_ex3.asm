;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 3, ex 3
; Lab section: 
; TA: Cody and Karan and Sahar
; 
;=================================================
.ORIG x3000
LEA R0, PROMPT
LEA R1, ARRAY1
LD R2, COUNTER
PUTS

DO_WHILE    GETC
            STR R0, R1, #0  ;Store the contents of R0 in R1 with offset 0 stored in R3
            ADD R1, R1, #1  ;Increments value stored in R1, in this case the address is incremented by 1
            ADD R2, R2, #-1 ;Decrements the counter
BRp DO_WHILE
LEA R1, ARRAY1
LD R2, COUNTER

PRINT_ALL   LDR R0, R1, #0
            OUT
            LD R0, NEWLINE
            OUT
            ADD R1, R1, #1
            ADD R2, R2, #-1
BRp PRINT_ALL
HALT

ARRAY1 .BLKW #10
PROMPT .STRINGZ "Please enter 10 characters\n"
COUNTER .FILL #10
NEWLINE .FILL x0A

.END