;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 6, ex 1
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================
;=================================================
;                   MAIN
;=================================================
.ORIG x3000
; Initialize the stack. Don't worry about what that means for now.
LD R6, TOP_STACK_ADDR ; DO NOT MODIFY, AND DON'T USE R6, OTHER THAN FOR BACKUP/RESTORE
LD R1, ARRAY_PTR
LD R4, SUB_GET_STRING_3000
LEA R0, NEWLINE
; your code goes here
JSRR R4
PUTS
HALT
; your local data goes here

TOP_STACK_ADDR      .FILL xFE00 ; DO NOT MODIFY THIS LINE OF CODE
ARRAY_PTR           .FILL x4000
SUB_GET_STRING_3000 .FILL x3200
NEWLINE             .STRINGZ "\n"
.END
;ARRAY LOCATION
.ORIG x4000
ARRAY           .BLKW #100
.END
; your subroutines go below here
;------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING
; Parameter (R1): The starting address of the character array
; Postcondition: The subroutine has prompted the user to input a string,
;	terminated by the [ENTER] key (the "sentinel"), and has stored 
;	the received characters in an array of characters starting at (R1).
;	the array is NULL-terminated; the sentinel character is NOT stored.
; Return Value (R5): The number of non-sentinel chars read from the user.
;	R1 contains the starting address of the array unchanged.
;-------------------------------------------------------------------------
.ORIG x3200
ADD R6, R6, #-1
STR R0, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0
LEA R0, PROMPT      ;R0 <- PROMPT
LD R2, ENTER_CHECK  ;R2 <- ENTER_CHECK
AND R5, R5, #0      ;R4 <- 0
PUTS                ;PRINTS IT OUT
INPUT_LOOP          ;LOOP STARTS HERE
    GETC
    OUT
    ADD R3, R0, R2  ;R3 <- (R0) + (R2)
    BRz FINISHED
    ADD R5, R5, #1
    STR R0, R1, #0 ;MEM[R1] <- (R0)
    ADD R1, R1, #1
    BR INPUT_LOOP
FINISHED
LDR R7, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R1, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R0, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
RET
PROMPT          .STRINGZ "Please enter a string then hit 'Enter'\n"
ENTER_CHECK     .FILL #-10
.END




