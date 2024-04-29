;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 4, ex 4
; Lab section: 21
; TA: Karan and Cody and Sahar
; 
;=================================================
; ================================================
; Main
; ================================================
.ORIG x3000
; Load subroutine address in R5

LEA R1, Array1              ;R1 <- Address of Array1
LD R5, SUB_FILL_ARRAY_3200  ; R5 <- x3200
JSRR R5                     ; Call subroutine (i.e. jump to address in R5)
LEA R0, COMPLETED_MSG       ; Print out completed message
PUTS
LD R5, SUB_CONVERT_ARRAY_3400
JSRR R5
LEA R0, CONVERTED_MSG
PUTS
LD R5, SUB_PRETTY_PRINT_ARRAY_3800
JSRR R5
HALT 
; Local data
Array1 .BLKW #10
SUB_FILL_ARRAY_3200     .FILL	x3200
SUB_CONVERT_ARRAY_3400  .FILL   x3400
SUB_PRETTY_PRINT_ARRAY_3800    .FILL   x3800
COMPLETED_MSG       .STRINGZ "Array has been filled.\n"
CONVERTED_MSG       .STRINGZ "Array has been converted.\n"
.END
;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY_3200
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------

.ORIG x3200
;Subroutine Algorithm
AND R2, R2, #0          ;R0 <- #0
LD R3, Sub3200_Counter      ;R3 <- #10
Fill_Array  STR R2, R1, #0  ;Mem[(R1)] <- (R2)
            ADD R1, R1, #1
            ADD R2, R2, #1
            ADD R3, R3, #-1
BRp Fill_Array
ADD R1, R1, #-10
RET                     ;Return out of the sub-routine (i.e. go back to the main program).
; Sub-routine Data
Sub3200_Counter .FILL #10

.END
;------------------------------------------------------------------------
; Subroutine: SUB_CONVERT_ARRAY_3400
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Each element (number) in the array should be represented as a character. E.g. 0 -> ‘0’
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG x3400
LD R3, Sub3400_Counter
Convert     LDR R2, R1, #0
            ADD R2, R2, xF
            ADD R2, R2, xF
            ADD R2, R2, xF
            ADD R2, R2, x3
            STR R2, R1, #0
            ADD R1, R1, #1
            ADD R3, R3, #-1
BRp Convert
ADD R1, R1, #-10
RET                     ;Return out of the sub-routine
;Sub-routine Data
Sub3400_Counter .FILL #10
.END
;------------------------------------------------------------------------
; Subroutine: SUB_PRINT_ARRAY_3600
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Each element (character) in the array is printed out to the console.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG x3600
LD R2, Sub3600_Counter
Print       LDR R0, R1, #0
            OUT
            ADD R1, R1, #1
            ADD R2, R2, #-1
BRp Print
LEA R0, Newline
PUTS
ADD R1, R1,#-10
RET                     ;Return out of the sub-routine
;Sub-routine Data
Sub3600_Counter .FILL #10
Newline         .STRINGZ "\n"
.END
;------------------------------------------------------------------------
; Subroutine: SUB_PRETTY_PRINT_ARRAY_3800
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Prints out “=====” (5 equal signs), prints out the array, and after prints out “=====” again.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG x3800
LEA R0, Sub_Message
PUTS
LD R5, SUB_PRINT_ARRAY_REL
ADD R3, R7, #0
JSRR R5                     ;Over here, the old value of R7(Our return pointer) gets overwritten, meaning we can't get back to memory address in main. 
                            ;JSRR stores the memory address of the next instruction in R7, but if I call JSRR in this Sub-reoutine, the previous value of R7 gets overwritten.
                            ;RET jumps back to the instruction at the Mem[R7]
                            ;Therefore I must back up R7 in a different register.
ADD R7, R3, #0
LEA R0, Sub_Message
PUTS
RET
;Sub-routine Data
Sub_Message .STRINGZ "=====\n"
SUB_PRINT_ARRAY_REL .FILL x3600
.END







