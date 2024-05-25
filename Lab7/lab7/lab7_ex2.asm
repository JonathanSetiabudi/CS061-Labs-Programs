;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 7, ex 2
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
LD R1, ARRAY_PTR
LD R0, SUB_IS_PALIN_3000
JSRR R0
LEA R0, THESTRING
PUTS
LD R1 ARRAY_PTR
PRINT_ALL
    LDR R0, R1, #0
    OUT
    ADD R1, R1, #1
    ADD R5, R5, #-1
    BRp PRINT_ALL
ADD R4, R4, #0
BRp IS_PALINDROME
BR  ISNT_PALINDROME
IS_PALINDROME
    LEA R0, TRUE
    BR PRINT
ISNT_PALINDROME
    LEA R0, FALSE
PRINT PUTS

HALT
; your local data goes here

TOP_STACK_ADDR      .FILL xFE00 ; DO NOT MODIFY THIS LINE OF CODE
ARRAY_PTR           .FILL x4000
SUB_GET_STRING_3000 .FILL x3200
SUB_IS_PALIN_3000   .FILL x3400
NEWLINE             .STRINGZ "\n"
THESTRING           .STRINGZ "The string "
TRUE                .STRINGZ " IS a palindrome"
FALSE               .STRINGZ " ISN'T a palindrome"
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
STR R4, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0

LEA R0, PROMPT      ;R0 <- PROMPT
LD R2, ENTER_CHECK  ;R2 <- ENTER_CHECK
LD R4, BS_CHECK     ;R3 <- BS_CHECK
AND R5, R5, #0      
PUTS                ;PRINTS IT OUT
BR INPUT_LOOP
BACKSPACE   ADD R5, R5, #-1
            ADD R1, R1, #-1
            AND R0, R0, #0
            STR R0, R1,#0   ;MEM[R1] <- (R0)
INPUT_LOOP          ;LOOP STARTS HERE
    GETC
    OUT
    ADD R3, R0, R2  ;R3 <- (R0) + (R2)
    BRz FINISHED
    ADD R3, R0, R4  ;R3 <- (R0) + (R4)
    BRz BACKSPACE
    ADD R5, R5, #1
    STR R0, R1, #0 ;MEM[R1] <- (R0)
    ADD R1, R1, #1
    BR INPUT_LOOP
FINISHED
LDR R7, R6, #0
ADD R6, R6, #1
LDR R4, R6, #0 ; rn is the modified register r0 - r7
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
BS_CHECK        .FILL #-8
.END

;-------------------------------------------------------------------------
; Subroutine: SUB_IS_PALINDROME
; Parameter (R1): The starting address of a null-terminated string
; Parameter (R5): The number of characters in the array.
; Postcondition: The subroutine has determined whether the string at (R1)
;		 is a palindrome or not, and returned a flag to that effect.
; Return Value: R4 {1 if the string is a palindrome, 0 otherwise}
;-------------------------------------------------------------------------
.ORIG x3400
ADD R6, R6, #-1
STR R0, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0
LD  R4, SUB_TO_UPPER_3400
JSRR R4
                    ;R1 holds the address of the first element in the string
ADD R2, R1, R5      ;R2 holds the address of the last element in the string
ADD R2, R2, #-1
AND R4, R4, #0
ADD R4, R4, #1      ;R4 <- 1
PALINDROME_LOOP
    LDR R3, R1, #0      ;R3 <- (R1) Holds the chaacter of the first element
    LDR R5, R2, #0      ;R5 <- (R2) Holds the character of the last element
    NOT R5, R5
    ADD R5, R5, #1
    ADD R0, R3, R5
    BRnp NOT_PALINDROME
    ADD R1, R1, #1
    ADD R2, R2, #-1
    NOT R0, R1
    ADD R0, R0, #1  ;R0 <- -(R1)
    ADD R0, R0, R2  ;R0 < (R0) + (R2)
    BRnz END_IS_PALIN   ;Executes if R0 is negative or 0, which means the address of r2 is smaller than r1 now
    BR PALINDROME_LOOP  ;Else goes back to the top of the loop
NOT_PALINDROME
    ADD R4, R4, #-1 ;R4 <- R4 + 1
    BR END_IS_PALIN
END_IS_PALIN 
LDR R7, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R5, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R3, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R2, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R0, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
RET
SUB_TO_UPPER_3400   .FILL x3600
.END
;-------------------------------------------------------------------------
; Subroutine: SUB_TO_UPPER
; Parameter (R1): Starting address of a null-terminated string
;           (R5): Number of characters in the string
; Postcondition: The subroutine has converted the string to upper-case
;     in-place i.e. the upper-case string has replaced the original string
; No return value, no output, but R1 still contains the array address, unchanged
;-------------------------------------------------------------------------
.ORIG x3600
ADD R6, R6, #-1
STR R0, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0

LD R0, CONVERSION   ;R0 <- #95
CONVERSION_LOOP
    LDR R2, R1, #0
    AND R3, R0, R2
    STR R3, R1, #0
    ADD R1, R1, #1
    ADD R5, R5, #-1
    BRp CONVERSION_LOOP

LDR R7, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R5, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R3, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R2, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R1, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1
LDR R0, R6, #0 ; rn is the modified register r0 - r7
ADD R6, R6, #1

RET
CONVERSION  .FILL x005F
.END




