;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
LD R2, Counter1
LD R3, Counter2
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
Start ADD R2, R2, #0
BRp Loop1
Loop1
    Loop2
        Loop3
            ADD R1, R1, #0      ;Read the value of R1
            BRp Positive
            BRn Negative
            Positive
                LEA R0, ZeroString  ;R0 <- "0"
                ADD R1, R1, R1      ;R1 <- R1*2
                PUTS                ;Print
                ADD R2, R2, #-1     ;R2 <- (R2-1)
                ADD R3, R3, #-1     ;R3 <- (R3-1)
                BRz Addspace        ;R0 <- " "
                BR Start            ;R
            Negative
                LEA R0, OneString   ;R0 <- "1"
                ADD R1, R1, R1      ;R1 <- R1*2
                PUTS                ;Print
                ADD R2, R2, #-1
                ADD R3, R3, #-1
                BRz Addspace
                BR Start
    Addspace
        ADD R2, R2, #0
        BRz PrintNewLine
        LEA R0, Space
        PUTS
        ADD R3, R3, #4
        BR Start

PrintNewLine
    LEA R0, Newline
    PUTS
HALT
;---------------	
;Data
;---------------
Value_ptr	.FILL xCA01	; The address where value to be displayed is stored
ZeroString  .STRINGZ "0"; string of 0 so I can print it
OneString   .STRINGZ "1"; string of 1 so I can print it
Space       .STRINGZ " "
Newline     .STRINGZ "\n"
Counter1    .FILL #16   ; Counter for number of bits to print
Counter2    .FILL #4    ; Counter for loop
.END

.ORIG xCA01					; Remote data
Value .FILL xABCD			; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END
