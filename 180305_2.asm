TITLE Task2
; 180305_2.asm
; Get user input and print the result as Hex
; Assume that the produce is never larger than 32 bits

INCLUDE Irvine32.inc

.data
	str1 BYTE "Enter a Multiplier : ", 0
	str2 BYTE "Enter a Multiplicand : ", 0
	produce	BYTE "Produce : ", 0
	bye	BYTE "Bye!", 0

.code
main PROC
	iterate:
		mov edx, OFFSET str1
		call WriteString
		call ReadHex ; enter a multiplier
		cmp eax, 0
		je bye_prompt
		mov ecx, eax

		mov edx, OFFSET str2
		call WriteString
		call ReadHex ; enter a multiplication
		mov ebx, eax
		mov eax, ecx

		call Processing
		mov edx, OFFSET produce
		call WriteString ; print 'produce' message
		call WriteHex 
		call Crlf
	jmp iterate
bye_prompt:
	mov edx, OFFSET bye
	call WriteString ; print 'bye' message
exit
main ENDP

Processing PROC
	mov edx, 0
	mov cl, 0
	loop1:
		shr eax, 1
		jc shift_add ; if CF=1, go to shift_add
		inc cl ; if CF=0, increment shift
		jmp next
	shift_add:
		shl ebx, cl ; apply cl to multiplicand
		add edx, ebx ; add multiplicand to produce
		shl ebx, 1 ; shift multiplicand left 1 bit
		mov cl, 0 ; reset shift count to 0
	next:
		cmp eax, 0
		je return
		jmp loop1
	return:
		mov eax, edx ; return the produced result to main
		ret
Processing ENDP
END main