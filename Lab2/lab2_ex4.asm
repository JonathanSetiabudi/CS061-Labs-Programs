;=================================================
; Name: Jonathan Setiabudi
; Email:  Jseti007@ucr.edu
; 
; Lab: lab 2, ex 4
; Lab section: 21
; TA: Karan and Cody and Sahar
; 
;=================================================

.ORIG x3000

LD R0, HEX_61 ;  R0 <- HEX_61
LD R1, HEX_1A ;  R1 <- HEX_1A

DO_WHILE    OUT
            ADD R0, R0, #1 ; ADD 1 TO R0
            ADD R1, R1, #-1 ; SUBTRACT R1 BY 1
BRp DO_WHILE

HALT

HEX_61 .FILL x61
HEX_1A .FILL x1A

.END