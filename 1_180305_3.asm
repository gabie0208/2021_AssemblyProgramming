TITLE Task3 Expotential Power
;calculate the value of X^Y(X TO THE POWER OF Y) and y^x(Y TO THE POWER OF X)
;store the result into eax and ebx respectively
;print contents of the registers using dumpregs
;20180305 hyejung ko

INCLUDE Irvine32.inc

.data
	include hw3.inc

.code
    main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, Y
	L1:
		add eax, X
		loop L1
	mov ecx, X
	L2:
		add ebx, Y
		loop L2
	call DumpRegs
	mov eax, eax		
	mov ebx, ebx
	exit
main ENDP
END main
