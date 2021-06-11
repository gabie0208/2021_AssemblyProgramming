TITLE Fibonacci Numbers (180305_2.asm)
;insert the nth fibonacci number in the eax register
;end of the code, check the value using dumpregs
;20180305 hyejung ko

INCLUDE Irvine32.inc

.data
	include hw2.inc
.code
main PROC
	mov eax, 1
	call DumpRegs
	mov ebx, 0
	mov edx, 1
	mov ecx, fib
	dec ecx

	L1:
		mov eax, ebx
		add eax, edx
		call DumpRegs		;display eax register
		mov ebx, edx
		mov edx, eax
		loop L1
		exit
main ENDP
END main