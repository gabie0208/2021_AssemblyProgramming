TITLE Copy a String in Reverse Order
;write a program with a loop that copies a string from source to target
;reversing the character order in the process
;print the target string to the console
;20180305 hyejung ko

INCLUDE Irvine32.inc
.data
	include hw4.inc
.code
main PROC
	mov esi, OFFSET source+LENGTHOF source-2	;point to last char in source str
	mov edi, OFFSET target						;point to first target str
	mov ecx, SIZEOF source-1		;loop counter
	L1:
		mov al, [esi]				;get a char from source
		mov [edi], al				;store in target
		dec esi						;move to next char
		inc edi						
		loop L1	
		mov BYTE PTR [edi], 0	;add a null to target		
	mov edx, OFFSET target		;give offset of string to edx register
	call WriteString			;write null-terminated string to the console	
	exit
main ENDP
END main