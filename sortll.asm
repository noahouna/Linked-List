.ORIG x2500

AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0 ; Initialize registers

HEADER

    LD R0, HEAD ; start of linked list
    LDR R1, R0, #0 ; Header
    LDR R2, R1, #1 ; Current Score = mem[header+1]
    ADD R3, R1, #2 ; Current Address = header+2

WHILE

    LDR R6, R3, #0 ; While mem[current address] != x0000
    BRz ENDWHILE
    LDR R5, R3, #0
    LDR R5, R5, #1 ; Next Score
    LDR R4, R3, #0 
    ADD R4, R4, #2 ; Next Address
    
    NOT R5, R5
    ADD R5, R5, #1
    ADD R5, R5, R2
    BRp THEN
    BRnz ELSE
    
THEN

    LDR R2, R0, #0 ; temp = contents of previous address
   
    STR R6, R0, #0 ; mem[previous address]=mem[current address]
    LDR R5, R4, #0 ; 
    STR R5, R2, #2 ; mem[current address]=mem[next address]
    STR R2, R6, #2 ; mem[next address]=temp

    ST R4, HEAD ; previous address = next address
    ADD R7, R7, #1 ; indicate swap occurance
    BR HEADER 
   
ELSE 
    
    ST R3, HEAD     ; current and next nodes are in correct order
    BR HEADER 
    
ENDWHILE

    ADD R7, R7, #0 ; End if swap did not occur
    BRz DONE 
    AND R7, R7, #0 
    LD R0, HEADSTK
    ST R0, HEAD
    BR HEADER
    
DONE
    LD R6, TOPOFSTACK ; Reset the stack pointer (R6 for LC-3) so the program will HALT.
    HALT

HEAD .FILL x3200
HEADSTK .FILL x3200
TOPOFSTACK .FILL x3000

.END

; Below is a test case

.ORIG x3200
	.FILL x2010
.END

.ORIG x2010
	.FILL x6476
	.FILL #99
	.FILL x2013
.END

.ORIG x2013
    .FILL x7A7A
	.FILL #67
	.FILL x5111
.END

.ORIG x5111
    .FILL x7470
	.FILL #50
	.FILL x2003
.END

.ORIG x2003
    .FILL x6361
	.FILL #82
	.FILL x0000
.END