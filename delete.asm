.ORIG x2700


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

 ;   LDR R6, R3, #0 ; While mem[current address] != x0000
  ;  BRz DONE
    LD R5, STUDID
    LDR R5, R5, #0 ; Read Student ID

    LDR R4, R3, #0 
    ADD R4, R4, #2 ; Next Address
    
    LDR R1, R1, #0
    NOT R5, R5
    ADD R5, R5, #1
    ADD R5, R5, R1 ; Compare Student IDs
    BRz COMPRSCORES
    BRnp ELSE
    
COMPRSCORES
    
    LD R5, STUDSCR
    LDR R5, R5, #0
    NOT R5, R5
    ADD R5, R5, #1
    ADD R5, R5, R2  ; compare student scores
    BRz THEN
    BRnp ELSE
    
THEN
        ; When a match is found, the current node is skipped in the
        ; linked list, effectively deleting it  
     LDR R2, R0, #0 ; temp = contents of previous address
   
    LDR R6, R3, #0 ; 
    STR R6, R0, #0 ; mem[previous address]=mem[next address]

    BR DONE 
   
ELSE 
    
    ST R3, HEAD     ; current and next nodes are in correct order
    BR HEADER 
    
DONE

    LD R6, TOPOFSTACK ; Reset the stack pointer (R6 for LC-3) so the program will HALT.
    HALT

HEAD .FILL x3200
HEADSTK .FILL x3200
TOPOFSTACK .FILL x3000

STUDID .FILL x4000
STUDSCR .FILL x4001
.END

.ORIG x3200
	.FILL x5111
.END

.ORIG x2010
	.FILL x6476
	.FILL #99
	.FILL x0000
.END

.ORIG x2013
    .FILL x7A7A
	.FILL #67
	.FILL x2003
.END

.ORIG x5111
    .FILL x7470
	.FILL #50
	.FILL x2013
.END

.ORIG x2003
    .FILL x6361
	.FILL #82
	.FILL x2010
.END

; Node to be deleted

.ORIG x4000
.FILL x6476
.END

.ORIG x4001
.FILL #99
.END

