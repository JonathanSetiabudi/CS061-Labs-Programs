;=================================================
; Name: Jonathan Setiabudi
; Email:  Jseti007@ucr.edu
; 
; Lab: lab 2, ex 3
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================
.ORIG x3000

LD R5, DEC_65_PTR ; R5 <-DEC_65_PTR
LD R6, HEX_41_PTR ; R6 <-HEX_41_PTR
LDR R3, R5, #0 ; R3 <-Mem[R5]
LDR R4, R6, #0 ; R4 <-Mem[R6]


ADD R3, R3, #1
ADD R4, R4, #1

STR R3, R5, #0 ; Stores value in R3 inside the Mem[R5]
STR R4, R6, #0 ; Stores value in R4 inside the Mem[R6]

HALT

DEC_65_PTR .FILL x4000 ; Initialize label DEC_65 w #65
HEX_41_PTR .FILL x4001 ; Initialize label HEX_41 w x41

.END

;; Remote data
.ORIG x4000
NEW_DEC_65	.FILL #65
NEW_HEX_41	.FILL x41
.END
