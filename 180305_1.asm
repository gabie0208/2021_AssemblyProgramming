TITLE Task1
; 180305_1.asm
; Transform given positive integer (septenary number) 
; into a decimal number
; Assume that input values will be represented as 
; 32-bit unsigned integers when converted to dec

INCLUDE Irvine32.inc

.data
str1 BYTE "Type the number of digits: ", 0
str2 BYTE "Type the septenary number : ", 0
str3 BYTE "Convert septenary to decimal : ", 0
num BYTE 13 DUP (?)

.code
main PROC
	mov edx, OFFSET str1
	call writeString ; type the number of digits
	call ReadInt ; input number of digits
	push eax 
	mov edx, OFFSET str2
	call writeString ; type the septenary number
	mov edx, OFFSET num  ; address for string
	mov ecx, 13 ; length of string
	call readString
	pop ecx
	sub eax, eax ; initialize eax
	loop1:
		mov ebx, eax
		add eax, eax
		add eax, ebx
		add eax, eax
		add eax, ebx ; get 7 times of eax
		add al, [edx] ; add address of 1st char of num to al
		sub al, 30h ; sub ascii values to from al
		inc edx
		loop loop1
		mov edx, OFFSET str3
		call writeString ; Convert septenary to decimal
		call writedec ; print eax into decimal
		call DumpRegs
exit
main ENDP
END main