.ORIG x2800

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

    LD R5, INSRTID
    LDR R5, R5, #0 ; Read Student ID

    LDR R4, R3, #0 
    ADD R4, R4, #2 ; Next Address
    
    LD R5, INSRTSCR
    LDR R5, R5, #0
    NOT R5, R5
    ADD R5, R5, #1
    ADD R5, R5, R2  ; compare student scores
    BRzp THEN
    BRn ELSE
    
THEN
        ; When a score is found that is greater than the insert score, the current node points to x4100
        ; in memory, effectively inserting the new node
    LD R5, INSRTID
    LDR R5, R5, #0 ; Read Student ID
    LD R7, NEWNODE
    STR R5, R7, #0 ; Write new student ID at x4100
    LD R5, INSRTSCR
    LDR R5, R5, #0
    STR R5, R7, #1 ; Write new student exam score to x4101
   
    LDR R5, R4, #0 ; 
    STR R1, R7, #2 ; mem[current address]=mem[next address]
    STR R7, R0, #0

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


INSRTID .FILL x4002
INSRTSCR .FILL x4003
NEWNODE .FILL x4100
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

; Insert Values below
.ORIG x4002
.FILL x7a61
.END

.ORIG x4003
.FILL #13
.END
