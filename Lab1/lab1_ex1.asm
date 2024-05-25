;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 1, ex 1
; Lab section: 021
; TA: Karan, Cody, Sahar
; 
;=================================================

.ORIG x3000

    AND r1,r1 #0
    LD R2, DEC_12
    LD R3,DEC_6
    
    do_while_loop
        ADD R1, R1, R2
        ADD R3, R3, #-1
        BRp do_while_loop
    end_do_while_loop
    
    HALT
    
    DEC_12 .FILL #12
    DEC_6 .FILL #6
    
.END