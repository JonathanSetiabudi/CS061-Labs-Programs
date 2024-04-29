;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Jonathan Setiabudi
; Email: Jseti007@ucr.edu
; 
; Assignment name: Assignment 2
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

;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here
;--------------------------------
GETC                ; R0 <-- ConsoleInput
OUT                 ; Print Mem[R0]
ADD R1, R0, #0      ; R1 <-- R0
LD R0, newline      ; Load R0 with newline
OUT                 ; Print new line
GETC                ; R0 <-- ConsoleInput
OUT                 ; Print Mem[R0]
ADD R2, R0, #0    ; R2 <-- R0
LD R0, newline      ; Load R0 with newline
OUT                 ; Print new line
ADD R0, R1, #0
OUT
LEA R0, subtraction
PUTS
ADD R0, R2, #0
OUT
LEA R0, equals
PUTS
ADD R1, R1, x-10    ;Subtract x30(We have to do 3 decrements of 16 because it doesn't allow numbers larger than 5-bit 2's complement)
ADD R1, R1, x-10
ADD R1, R1, x-10
ADD R2, R2, x-10
ADD R2, R2, x-10
ADD R2, R2, x-10
NOT R2, R2          ;Take the 2's complelement of the number at R2
ADD R2, R2, #1
ADD R0, R1, R2      ;Subtraction input1 from input2             1000 1100 -> 0111 0011 -> 0111 0100
BRn DoNegative      ;If last register was negative, go to DoNegative
Positive:
    BR Finished     ;If we get here, go to Finished
DoNegative  ADD R4, R0, #0
        NOT R4, R4
        LEA R0, negativesign
        PUTS
        ADD R0, R4, #1

Finished:          ;Finishing touches
    ADD R0, R0, xF
    ADD R0, R0, xF
    ADD R0, R0, xF
    ADD R0, R0, x3
    OUT
    LD R0, newline
    OUT
HALT				; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.
newline .FILL x0A	                                            ; newline character - use with LD followed by OUT.
subtraction .STRINGZ " - "                                      ; For between the 2 numbers.
equals .STRINGZ " = "                                           ; For between the operation and difference.
negativesign .STRINGZ "-"                                       ; Negative sign
.FILL #-3
;---------------	
;END of PROGRAM
;---------------	
.END

