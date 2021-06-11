TITLE Task1) Summing the Gaps between Array Values
;insert the sum in eax register
;at the end of code, check the value using dumpregs
;20180305 hyejung ko

INCLUDE Irvine32.inc

.data
	include hw1.inc

.code
main PROC
	mov esi, OFFSET array1    ;store address of array1 in esi
	mov ecx, LENGTHOF array1  ;store the length of array1 in ecx
	mov ebx, 0				;start sum at 0
	cld						;clear direction bit
	lodsd					;start with first element
	mov edx, eax			;previous element in edx
	dec ecx					;decrease loop counter

	L1:
		lodsd
		sub ebx, edx		;present element - previous element			
		add ebx, eax
		mov edx, eax
		Loop L1

		mov eax, ebx				;put result in eax
		call DumpRegs
		exit
main ENDP
END main