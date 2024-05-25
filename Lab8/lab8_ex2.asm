;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 8, ex 2
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================

.orig x3000

LD R6, top_stack_addr

; Test harness
;-------------------------------------------------
LEA R0, prompt
PUTS
GETC
OUT
LD R5, PARITY_CHECK_3000
JSRR R5
ADD R2, R0, #0
LEA R0, newline
PUTS
ADD R0, R2, #0
OUT
LEA R0, answerpt1
PUTS
ADD R0, R3, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
OUT
LEA R0, answerpt2
PUTS
HALT

; Test harness local data
;-------------------------------------------------
top_stack_addr      .fill xFE00
PARITY_CHECK_3000   .fill x3600
prompt              .stringz "Please enter a character.\n"
answerpt1           .stringz " has "
answerpt2           .stringz " 1's"
newline             .stringz "\n"
.end

;=================================================
; Subroutine: PARITY_CHECK_3600
; Parameter: R0
; Postcondition: Print the number of 1's in the binary version of the ascii character
; Return Value: (R3)
;=================================================

.orig x3600
;R4 IS FORLOOP COUNTER
;R2 IS COUNTER
;R1 IS WHERE MANIPULATION OF THE NUMBER IS GONNA BE

; Backup registers
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0
; Code
LD R4, counter
ADD R1, R0, #0
AND R2, R2, #0
ADD R1, R1, #0
BRzp #1
ADD R2, R2, #1
FOR16
    ADD R1, R1, R1
    BRzp #1
    ADD R2, R2, #1
    ADD R4, R4, #-1
    BRp FOR16
ADD R3, R2, #0
; Restore registers
LDR R4, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
RET
counter .fill #15
.end



;algorithm
;for(number of bits the value is - 1){
;   shift value left and rotate MSB to be new LSB
;   by doing a BRn and if negative, add a 1 to the end after left shifting
;}
}