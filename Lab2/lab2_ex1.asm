;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 2, ex 2
; Lab section: 21
; TA: Cody and Karan and Sahar
;=================================================

.ORIG x3000

LD R3,DEC_65 ; R3 <-Dec_65
LD R4,HEX_41 ; R4 <-Hex_41

HALT

DEC_65 .FILL #65 ; Initialize label DEC_65 w #65
HEX_41 .FILL x41 ; Initialize label HEX_41 w x41

.END