;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 3, ex 4
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================
.ORIG x3000
LEA R0, PROMPT
LD R1, ARRAY1_PTR
LD R4, COUNTER
LD R3, q_CHECK
PUTS

DO_WHILE    GETC
            STR R0, R1, #0  ;Store the contents of R0 in R1 with offset 0 in Address R1 points to
            ADD R1, R1, #1  ;Increments value stored in R1, in this case the address is incremented by 1
            ADD R2, R2, #1
            ADD R4, R4, #1
            ADD R2, R0, R3  ;Adds the ascii values of the input and NEWLINE_CHECK to see if they are the same
BRnp DO_WHILE               ;Does the loop until someone enters a newline
LD R1, ARRAY1_PTR

PRINT_ALL   LDR R0, R1, #0
            OUT
            LD R0, NEWLINE
            OUT
            ADD R1, R1, #1
            ADD R4, R4, #-1
BRp PRINT_ALL
HALT
;Local Data
PROMPT .STRINGZ "Please enter characters and hit 'q' to end\n"
ARRAY1_PTR .FILL x4000
COUNTER .FILL #0
NEWLINE .FILL x0A
q_CHECK .FILL x-71
.END
;Remote data
.ORIG x4000
ARRAY1 .BLKW #100
.END
