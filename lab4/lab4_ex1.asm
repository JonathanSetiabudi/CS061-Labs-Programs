;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 4, ex 1
; Lab section: 21
; TA: Karan and Cody and Sahar
; 
;=================================================
; ================================================
; Main
; ================================================
.ORIG x3000
; Load subroutine address in R5

LEA R1, Array1      ;R1 <- Address of Array1
LD R5, SUB_FILL_ARRAY_3200 ; R5 <- x3200
; Call subroutine (i.e. jump to address in R5)
JSRR R5

; Print out completed message
LEA R0, COMPLETED_MSG
PUTS

HALT 
; Local data
Array1 .BLKW #10
SUB_FILL_ARRAY_3200     .FILL	x3200
COMPLETED_MSG       .STRINGZ "Array has been filled."
.END
;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY_3200
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------

.ORIG x3200
; (1) Backup registers (skipped)
; (2) Subroutine Algorithm
AND R2, R2, #0          ;R0 <- #0
LD R3, Sub_Counter      ;R3 <- #10
Fill_Array  STR R2, R1, #0  ;Mem[(R1)] <- (R2)
            ADD R1, R1, #1
            ADD R2, R2, #1
            ADD R3, R3, #-1
BRp Fill_Array

; (3) Restore registers (skipped)
; (4) Return out of the sub-routine (i.e. go back to the main program).
RET
; Sub-routine Data
Sub_Counter .FILL #10

.END
