;=================================================
; Name: Jonathan Setibudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 3, ex 2
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================
.ORIG x3000
LEA R0, PROMPT
LEA R1, ARRAY1
LD R2, COUNTER
PUTS

DO_WHILE    GETC
            OUT
            STR R0, R1, #0  ;Store the contents of R0 in R1 with offset 0 stored in R3
            ADD R1, R1, #1  ;Increments value stored in R1, in this case the address is incremented by 1
            ADD R2, R2, #-1 ;Decrements the counter
BRp DO_WHILE

HALT

ARRAY1 .BLKW #10
PROMPT .STRINGZ "Please enter 10 characters\n"
COUNTER .FILL #10

.END