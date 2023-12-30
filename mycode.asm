.MODEL SMALL
.STACK 100H
.DATA
MAIN_MENU DB ,0DH,0AH,"Calculater",0DH,0AH
          DB "Press 'A' For ADDITION",0DH,0AH
          DB "Press 'S' For SUBTRACTION",0DH,0AH
          DB "Press 'M' For MULTIPLICATION",0DH,0AH
          DB "Press 'D' For DIVISION",0DH,0AH
          DB "Press 'E' For EXIT",0DH,0AH
          DB "Press 'R' For RETURN to Main Menu",0DH,0AH
          DB "*******************************",0DH,0AH
          DB "*******************************",0DH,0AH
          DB "Enter Your CHOICE",0DH,0AH,'$'     
     NUM1 DB "Enter First Number",0DH,0AH,'$'
     NUM2 DB ,0DH,0AH,"Enter Second Number",0DH,0AH,'$'
    ADD1 DB ,0DH,0AH,"FOR ADDITION",0DH,0AH,'$'
    SUB1 DB ,0DH,0AH,"FOR SUBTRACTION",0DH,0AH,'$'
    MUL1 DB ,0DH,0AH,"FOR MULTIPLICATION",0DH,0AH,'$' 
    DIV1 DB ,0DH,0AH,"FOR DIVISION",0DH,0AH,'$'
    EX DB ,0DH,0AH,"GOOD BYE AND HAVE A NICE TIME :)",0DH,0AH,'$'  
       ANS DB ,0DH,0AH,"ANSWER ",0DH,0AH,'$' 
       CONTINUE DB ,0DH,0AH,"DO YOU WANT TO CONTINUE",0DH,0AH,'$'       
          OP1 DB ?
          OP2 DB ?
          Operand DB ?
          CON DB ?
.CODE
MAIN PROC FAR
    .STARTUP
        START:
            MOV AH,09H
            MOV DX, OFFSET MAIN_MENU
            INT 21H
            MOV AH,01H
            INT 21H
            MOV Operand,AL
            MOV AL,Operand
            CMP AL,'A'
            JE ADD
            CMP AL,'S'
            JE SUB   
            CMP AL,'M'
            JE MUL
            CMP AL,'D'
            JE DIV
            CMP AL,'R'
            JE START
            CMP AL,'E'
            JE EXIT
            ADD: ; PERFORMING ADDITION
            MOV AH,09H
            MOV DX,OFFSET ADD1
            INT 21H
            ;FIRST OPERAND
            MOV AH,09H
            MOV DX,OFFSET NUM1
            INT 21H
            MOV AH,01H
            INT 21H
            MOV OP1,AL
            ;SECOND OPERAND
            MOV AH,09H
            MOV DX,OFFSET NUM2
            INT 21H
            MOV AH,01H
            INT 21H
            MOV OP2,AL
            MOV AH,09H
            MOV DX, OFFSET ANS
            INT 21H
            MOV AL,OP1
            MOV BL,OP2
            ADD AL,BL
            AAS
            OR AX, 3030H
            ; PRINT RESULT
            MOV AH,0EH
            INT 10H
            ;FOR CONTINUE
            MOV AH,09H
            MOV DX,OFFSET CONTINUE
            INT 21H
            MOV AH,01H
            INT 21H
            MOV CON,AL
            MOV AL,CON
            CMP AL,'Y'
            JE START
            CMP AL,'N'
            JE EXIT
SUB: ; PERFORMING SUBTRACTION
MOV AH,09H
MOV DX,OFFSET SUB1
INT 21H 
;FIRST OPERAND
MOV AH,09H
MOV DX,OFFSET NUM1
INT 21H
MOV AH,01H
INT 21H
MOV OP1,AL
;SECOND OPERAND
MOV AH,09H
MOV DX,OFFSET NUM2
INT 21H
MOV AH,01H
INT 21H
MOV OP2,AL
MOV AH,09H
MOV DX, OFFSET ANS
INT 21H
MOV AL,OP1
MOV BL,OP2
SUB AL,BL
AAS
OR AX, 3030H
; PRINT RESULT
MOV AH,0EH
INT 10H
;FOR CONTINUE
MOV AH,09H
MOV DX,OFFSET CONTINUE
INT 21H
MOV AH,01H
INT 21H
MOV CON,AL
MOV AL,CON
CMP AL,'Y'
JE START
CMP AL,'N'
JE EXIT
MUL: ; PERFORMING MULTIPLICATION
MOV AH,09H
MOV DX,OFFSET MUL1
INT 21H
;FIRST OPERAND
MOV AH,09H
MOV DX,OFFSET NUM1
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV OP1,AL 
;SECOND OPERAND
MOV AH,09H
MOV DX,OFFSET NUM2
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV OP2,AL
MOV AH,09H
MOV DX, OFFSET ANS
INT 21H
MOV AL,OP1
MOV BL,OP2
MUL BL
ADD AL,30H
; PRINT RESULT
MOV AH,0EH
INT 10H
;FOR CONTINUE
MOV AH,09H
MOV DX,OFFSET CONTINUE
INT 21H
MOV AH,01H
INT 21H
MOV CON,AL
MOV AL,CON
CMP AL,'Y'
JE START
CMP AL,'N'
JE EXIT
DIV: ; PERFORMING DIVISION
MOV AH,09H
MOV DX,OFFSET DIV1
INT 21H
;FIRST OPERAND
MOV AH,09H
MOV DX,OFFSET NUM1
INT 21H
MOV AH,01H
INT 21H 
SUB AL,30H
MOV OP1,AL
;SECOND OPERAND
MOV AH,09H
MOV DX,OFFSET NUM2
INT 21H
MOV AH,01H
INT 21H 
SUB AL,30H
MOV OP2,AL
MOV AH,09H
MOV DX, OFFSET ANS
INT 21H
MOV AX,0000H
MOV AL,OP1
MOV BL,OP2
DIV BL
ADD AL,30H
; PRINT RESULT
MOV AH,0EH
INT 10H
;FOR CONTINUE
MOV AH,09H
MOV DX,OFFSET CONTINUE
INT 21H
MOV AH,01H
INT 21H
MOV CON,AL
MOV AL,CON
CMP AL,'Y'
JE START
CMP AL,'N'
JE EXIT     
EXIT:  ; SAY GOOD BYE AND THEN EXIT
MOV AH,09H
MOV DX,OFFSET EX
INT 21H
.EXIT
MAIN ENDP
END MAIN






