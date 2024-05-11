;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Assignment name: Assignment 4
; Lab section: 21
; TA: Karan and Cody and Sahar
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R4
;=================================================================================

.ORIG x3000		
;-------------
;Instructions
;-------------
;R0 will be print/getc register
;R1 will be where comparisons are made
;R2 will hold the checkers
;R3 will the positive/negative flag
;R4 is where it will be stored
;R5 will be the multiplying by 10 counter
;R6 will be the digit counter
;R7 will be the accumulator
START
LD R0, introPromptPtr
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
LD  R6, digitcounter
AND R7, R7, #0
; output intro prompt
PUTS
; Get first character, test for '\n', '+', '-', digit/non-digit
GETC
OUT
; is very first character = '\n'? if so, just quit (no message)!
LD R2, nlchecker
ADD R1, R0, R2
BRz END
; is it = '+'? if so, ignore it, go get digits
LD R2, +checker
ADD R1, R0, R2
BRz RemainingDigits
; is it = '-'? if so, set neg flag, go get digits
LD R2, -checker
ADD R1, R0, R2
BRz SetNegativeFlag
BR Digitcheck
SetNegativeFlag
ADD R3, R3, #1
BR RemainingDigits
Digitcheck      ;Convert to decimal
ADD R0, R0, #-16
ADD R0, R0, #-16
ADD R0, R0, #-16
; is it < '0'? if so, it is not a digit	- o/p error message, start over
BRn Error
; is it > '9'? if so, it is not a digit	- o/p error message, start over
LD R2, ninechecker
ADD R1, R0,	R2
BRp Error
; if none of the above, first character is first numeric digit - convert it to number & store in target register!
LD R5, tenCounter
AccumulatorLoop
    ADD R4, R4, R0
    ADD R5, R5, #-1
    BRp AccumulatorLoop
    ADD R6, R6, #-1 ;Decrement the number of digitcounter which lets us know when we reach 5 digits
RemainingDigits     ; Now get remaining digits from user in a loop (max 5), testing each to see if it is a digit, and build up number in accumulator
    GETC
    OUT
    LD R2, nlchecker        ;Is it a newline? if so end program
    ADD R1, R0, R2
    BRz END
    ADD R0, R0, #-16
    ADD R0, R0, #-16
    ADD R0, R0, #-16
    BRn Error               ; is it < '0'? if so, it is not a digit	- o/p error message, start over
    LD R2, ninechecker      ; is it > '9'? if so, it is not a digit	- o/p error message, start over
    ADD R1, R0,	R2
    BRp Error
    ADD R7, R4, R0
    AND R4, R4, #0
    ADD R6, R6, #-1
    BRz END
    LD R5, tenCounter
    OtherLoop
        ADD R4, R7, R4
        ADD R5, R5, #-1
        BRp OtherLoop
    ADD R6, R6, #0
    BRp RemainingDigits
; remember to end with a newline!
LEA R0, newline
PUTS
BR END
Error
    LD R0, errorMessagePtr
    PUTS
    BR Start
END
ADD R3, R3, #0
BRz DONE
NOT R7, R7
ADD R7, R7, #1
DONE
    ADD R4, R7, #0
    HALT
;---------------	
; Program Data
;---------------

tenCounter      .FILL #10
digitCounter    .FILL #5
-checker        .FILL #-45
+checker        .FILL #-43
nlchecker       .FILL #-10
ninechecker        .FILL #-9
introPromptPtr  .FILL xB000
errorMessagePtr .FILL xB200
newline         .STRINGZ "\n"

.END

;------------
; Remote data
;------------
.ORIG xB000	 ; intro prompt
.STRINGZ	 "Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"

.END					
					
.ORIG xB200	 ; error message
.STRINGZ	 "ERROR: invalid input\n"

;---------------
; END of PROGRAM
;---------------
.END

;-------------------
; PURPOSE of PROGRAM
;-------------------
; Convert a sequence of up to 5 user-entered ascii numeric digits into a 16-bit two's complement binary representation of the number.
; if the input sequence is less than 5 digits, it will be user-terminated with a newline (ENTER).
; Otherwise, the program will emit its own newline after 5 input digits.
; The program must end with a *single* newline, entered either by the user (< 5 digits), or by the program (5 digits)
; Input validation is performed on the individual characters as they are input, but not on the magnitude of the number.
