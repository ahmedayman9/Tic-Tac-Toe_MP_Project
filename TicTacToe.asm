.MODEL SMALL
.STACK 100H
.DATA

;printing msgs from variables of size byte (char)
welcome db " Welcome to `Tic-Tac-Toe' Game !!$"
ttt1 db " | 1 + 2 + 3 |$"
ttt2 db " | 4 + 5 + 6 |$"
ttt3 db " | 7 + 8 + 9 |$"
enterLoc db " Rule: You Can MOVe within Locations 1 to 9 .$"
turnMessageX db " Player 1's (X) turn, Which Position You Want to Choose?$"
turnMessageO db " Player 2's (O) turn, Which Position You Want to Choose?$"

; --------------------- CODE Segment START-------------------------
.CODE 

printString proc ;print a string procedure

MOV ah, 09  ;interrupt vector for printing a string
int 21h
ret 

newLine proc    ;print a newline
MOV DL,0DH      ;display cariage return
MOV AH,2        ;display the char stored in DL
INT 21H         ;print the string
MOV DL,0AH      ;display the cursor
MOV AH,2
INT 21H
ret

;//////////////////////////////////////////////////////////////////
MAIN PROC
start:
MOV ax, @data      ;to initialize ds
MOV ds, ax         
MOV es, ax

MOV CX,9

;copy what is in the variables  and put it in dx (for IN/OUT)
LEA dx, welcome
call printString
CALL newLine

LEA dx, enterLoc
call printString
CALL newLine
call newLine

LEA dx, ttt1
call printString
CALL newLine
LEA dx, ttt2
call printString
CALL newLine
LEA dx, ttt3
call printString
CALL newLine
CALL newLine

LEA dx, turnMessageX
call printString
CALL newLine

 
 ;COLORLASTDIGIT
 
 
 printCharCOLOR PROC 
 	MOV BP, BX
 	;MOV DI,
 	mov di, cx 
 	    
	MOV AL,DL
	
	CMP AL,'X'
	JE L1 
	CMP AL,'O'
	JE L2     
	jmp L3
	
	
	L1:
	
    MOV AH, 9  	
	MOV BL, 10
	MOV CX,1
	INT 10H  
	mov dl,al   
	mov ah,2   
	int 21h
	JMP EXIT2
	
	L2:
	
	MOV AH, 9 
	MOV BL, 12
	MOV CX,1
	INT 10H  
	mov dl,al   
	mov ah,2   
	int 21h
	JMP EXIT2
	
	L3:
	
	MOV AH, 9 
	MOV BL, 14
	MOV CX,1
	INT 10H 
	mov dl,al   
	mov ah,2   
	int 21h
	JMP EXIT2

;	
	
	EXIT2:
 	MOV BX, BP
 	mov cx, di
 	
 	
 	RET

EXIT:

MAIN ENDP   ;end of main procedure
END MAIN
