;=================================================
; Name: Jonathan Setiabudi
; Email:  Jseti007@ucr.edu
; 
; Lab: lab 2, ex 2
; Lab section: 21
; TA: Cody and Karan and Sahar
; 
;=================================================
.ORIG x3000

LDI R3,DEC_65_PTR ; R3 <-Dec_65
LDI R4,HEX_41_PTR ; R4 <-Hex_41

ADD R3, R3, #1
ADD R4, R4, #1

STI R3, DEC_65_PTR ; Stores value in R3 inside the address DEC_65_PTR is pointing to
STI R4, HEX_41_PTR ; Stores value in R4 inside the address HEX_41_PTR is pointing to

HALT

DEC_65_PTR .FILL x4000 ; Initialize label DEC_65 w #65
HEX_41_PTR .FILL x4001 ; Initialize label HEX_41 w x41

.END

;; Remote data
.ORIG x4000
NEW_DEC_65	.FILL #65
NEW_HEX_41	.FILL x41
.END
