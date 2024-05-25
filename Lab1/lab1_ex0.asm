;=================================================
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Lab: lab 1, ex 0
; Lab section: 021
; TA: Karan, Cody, Sahar
; 
;=================================================

.ORIG x3000

    LEA R0 MSG_TO_PRINT
    PUTS
    
    HALT

MSG_TO_PRINT .STRINGZ "Hello World!!!\n"

.END
