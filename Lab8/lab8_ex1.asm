;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007
; 
; Lab: lab 8, ex 1
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================

.orig x3000

LD R6, top_stack_addr

; Test harness
;-------------------------------------------------
LD R5, LOAD_FILL_VALUE_3000
JSRR R5
ADD R1, R1, #1
LD R5, OUTPUT_AS_DECIMAL_3000
JSRR R5
HALT

; Test harness local data
;-------------------------------------------------
top_stack_addr .fill xFE00
LOAD_FILL_VALUE_3000 .fill x3200
OUTPUT_AS_DECIMAL_3000 .fill x3400

.end

;=================================================
; Subroutine: LOAD_FILL_VALUE_3200
; Parameter:        NONE
; Postcondition:    (LOADS #100 INTO R1)
; Return Value:     (#100 IN R1)
;=================================================

.orig x3200

; Backup registers
ADD R6, R6, #-1
STR R7, R6, #0
; Code
LD R1, hundred
; Restore registers
LDR R7, R6, #0
ADD R6, R6, #1
RET
hundred .fill #12345
.end

;=================================================
; Subroutine: OUTPUT_AS_DECIMAL_3400
; Parameter:        R1(NUMERICAL VALUE)
; Postcondition: PRINT OUT THE NUMERICAL VALUE IN R1
; Return Value:  NONE
;=================================================

;R0(OUTPUT)
;R1(INPUT)
;R2(COUNTER)
;R3(ASCII ADDER)
;R4(FLAG)
;R5(SUBTRACTER)
.orig x3400

; Backup registers
ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R0, R6, #0
; Code
AND R2, R2, #0
LD R3, asciiAdd
AND R4, R4, #0
LD R5, negtenThou
SUB_TENTHOU
    ADD R1, R1, R5
    BRn #3
    ADD R4, R4, #1
    ADD R2, R2, #1
    BR SUB_TENTHOU
    ADD R0, R2, R4
    BRz #3
    ADD R4, R4, #1
    ADD R0, R2, R3
    OUT
    AND R2, R2, #0
    LD R5, tenThou
    ADD R1, R1, R5
SUB_THOU
    LD R5, negthou
    ADD R1, R1, R5
    BRn #3
    ADD R4, R4, #1
    ADD R2, R2, #1
    BR SUB_THOU
    ADD R0, R2, R4
    BRz #3
    ADD R4, R4, #1
    ADD R0, R2, R3
    OUT
    AND R2, R2, #0
    LD R5, Thou
    ADD R1, R1, R5
SUB_HUN
    LD R5, neghund
    ADD R1, R1, R5
    BRn #3
    ADD R4, R4, #1
    ADD R2, R2, #1
    BR SUB_HUN
    ADD R0, R2, R4
    BRz #3
    ADD R0, R2, R3
    OUT
    AND R2, R2, #0
    LD R5, hund
    ADD R1, R1, R5
SUB_TEN 
    LD R5, negten
    ADD R1, R1, R5
    BRn #3
    ADD R4, R4, #1
    ADD R2, R2, #1
    BR SUB_TEN
    ADD R0, R2, R4
    BRz #3
    ADD R0, R2, R3
    OUT
    AND R2, R2, #0
    LD R5, ten
    ADD R1, R1, R5
SUB_ONE
    LD R5, negone
    ADD R1, R1, R5
    BRn #3
    ADD R4, R4, #1
    ADD R2, R2, #1
    BR SUB_ONE
    ADD R0, R2, R4
    BRz #3
    ADD R4, R4, #1
    ADD R0, R2, R3
    OUT
; Restore registers
LDR R0, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1
RET
printNeg    .stringz "-"
asciiAdd    .fill #48
negtenThou     .fill #-10000
negthou        .fill #-1000
neghund        .fill #-100
negten         .fill #-10
negone         .fill #-1
tenThou     .fill #10000
thou        .fill #1000
hund        .fill #100
ten         .fill #10
one         .fill #1
.end