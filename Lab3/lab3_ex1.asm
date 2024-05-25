;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 3, ex 1
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================

.ORIG x3000

LD R5, DATA_PTR ; R5 <-DATA_PTR
LDR R3, R5, #0 ; R3 <-Mem[R5]
LDR R4, R5, #1 ; R4 <-Mem[R5 + 1]


ADD R3, R3, #1
ADD R4, R4, #1

STR R3, R5, #0 ; Stores value in R3 inside the Mem[R5]
STR R4, R5, #1 ; Stores value in R4 inside the Mem[R6]

HALT

DATA_PTR .FILL x4000 ; Initialize label DEC_65 w #65

.END

;; Remote data
.ORIG x4000
NEW_DEC_65	.FILL #65
NEW_HEX_41	.FILL x41
.END
