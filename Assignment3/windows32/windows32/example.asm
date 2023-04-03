; I have abided by the UNCG Academic Integrity Policy
; Author: Jaylon Norris
; Date: 9/13/2021
; This program will prompt the user for four numbers, calculate average, and display the result 
; Then report how far away each input value is from the average 

INCLUDE io.h            ; header file for input/output
.586
.MODEL FLAT
.STACK 4096

.DATA
number1		DWORD	?
number2		DWORD   ?
number3     DWORD	?
number4     DWORD	?
prompt1		BYTE    "Enter first number", 0
prompt2		BYTE    "Enter second number", 0
prompt3		BYTE    "Enter third number", 0
prompt4		BYTE    "Enter fourth number", 0
string		BYTE    40 DUP (?)
resultLbl	BYTE	"AVERAGE", 0
resultLbl2	BYTE	"DIFFERENCE", 0






;Message window for Average
message     BYTE    "The Average of ", 0ah, 0dh
num1Val     BYTE    11 DUP (?)
num2Val     BYTE    11 DUP (?)
num3Val     BYTE    11 DUP (?)
num4Val     BYTE    11 DUP (?), 0ah, 0dh
            BYTE    "is", 0ah, 0dh
eaxVal      BYTE    11 DUP (?), 0


;Message2 window for Difference
message2     BYTE    "Average = "
average      BYTE    11 DUP (?), 0ah, 0dh
             BYTE    "Distance from average ", 0dh,0dh
num1Value    BYTE    11 DUP (?) 
num1Diff     BYTE    11 DUP (?), 0ah, 0dh
num2Value    BYTE    11 DUP (?)
num2Diff     BYTE    11 DUP (?), 0dh, 0ah
num3Value    BYTE    11 DUP (?)
num3Diff     BYTE    11 DUP (?), 0ah, 0dh
num4Value    BYTE    11 DUP (?)
num4Diff     BYTE    11 DUP (?), 0ah, 0dh


.CODE
_MainProc PROC

        input   prompt1, string, 40     ; repeat for second number
        atod    string
        mov     number1, eax

        input   prompt2, string, 40     ; repeat for second number
        atod    string
        mov     number2, eax

        
        input   prompt3, string, 40     ; repeat for second number
        atod    string
        mov     number3, eax

        
        input   prompt4, string, 40     ; repeat for second number
        atod    string
        mov     number4, eax
        
        mov     eax, number1			; first number to EAX
        add     eax, number2			; add second number
        add     eax, number3            ; add third number
        add     eax, number4            ; add fourth number
        
        mov     edx, 0                  ;Divide for average
        mov     ebx, 4
        idiv    ebx
    
        
        dtoa num1Val, number1            ;convert to ASCII characters
        dtoa num1Value,number1
        dtoa num2Val, number2
        dtoa num2Value,number2
        dtoa num3Val, number3
        dtoa num3Value,number3
        dtoa num4Val, number4 
        dtoa num4Value,number4
        dtoa eaxVal, eax
        dtoa average, eax
                                           
               
        output resultLbl, message         ;Show average

        sub     number1, eax              ;Get differences
        sub     number2, eax
        sub     number3, eax
        sub     number4, eax
        dtoa    num1Diff, number1
        dtoa    num2Diff, number2
        dtoa    num3Diff, number3
        dtoa    num4Diff, number4
        output  resultLbl2, message2        ;Show difference
        mov     eax, 0					  ; exit with return code 0
        ret
_MainProc ENDP
END										; end of source code

