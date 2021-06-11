INCLUDE Irvine32.inc
; 180305_3.asm
; Search word in string
; string and word is given by user-input
; input <ent> to finish the program
; string length does not exceed 40 chars.

string_max = 40
search_max = 40

.data
	type_a_string BYTE "TYPE_A_STRING: ", 0
	a_word_for_search BYTE "A_WORD_FOR_SEARCH: ", 0
	found BYTE "Found", 0
	changed BYTE "Changed:", 0
	not_found BYTE "Not found", 0
	bye	BYTE "Bye!", 0

	string BYTE string_max+1 DUP(0)
	search BYTE search_max+1 DUP(0)
	string_len DWORD ?
	search_len DWORD ?

.code
main PROC
	iterate:
		mov edx, OFFSET type_a_string
		call WriteString ; type_a_string
		call Input_string ; input a string
 		mov edx, OFFSET a_word_for_search 
		call WriteString ; a_word_for_search
		call Word_for_search ; input a word for search
		call Processing ; matching string and word then, print found or not found
		call DumpRegs
	jmp iterate
exit
main ENDP

Input_string PROC
	pushad
	mov ecx, string_max
	mov edx, OFFSET string
	call ReadString
	cmp ax, 0
	je bye_prompt
	mov string_len, eax
	popad
	ret
Input_string ENDP

Word_for_search PROC
	pushad
	mov ecx, search_max
	mov edx, OFFSET search
	call ReadString
	mov search_len, eax
	popad
	ret
Word_for_search ENDP

Processing PROC
	pushad
	mov esi, 0 ; string index
	mov edi, 0 ; search index
	mov ecx, string_len
	sub ecx, search_len ; string_len - search_len
	add ecx, search_len

	loop1:
		mov al, search[edi]
		cmp string[esi], al
		je equal ; jump to equal if search[edi] equal to string[esi]
		inc esi ; if not, increment only strig index
		jmp not_equal
		equal:
			inc esi ; increment string index
			inc edi ; increment search index
			jmp finish
		not_equal:
			mov edi, 0 ; search index is 0
			jmp finish
		finish:
		cmp edi, search_len ; compare search index with length of search
		je check_last_char ; jump to check_last_char if equal
	loop loop1
	jmp not_success

	check_last_char:
		cmp string[esi], ' '
		je success
		cmp string[esi], '.'
		je success
		cmp string[esi], 0
		je success
		jmp not_success

	success:
		mov edx, OFFSET found
		call WriteString ; print 'found' message
		call Crlf
		mov edx, OFFSET changed
		call WriteString ; print 'changed' message
		call Crlf
		jmp main
		ret
		jmp main
		jmp ending

	not_success:
		mov edx, OFFSET not_found 
		call WriteString ; print 'not found' message
		call Crlf
		mov edx, OFFSET changed
		call WriteString ; print 'changed' message
		call Crlf
		jmp main

	ending:
ret
jmp main
exit
Processing ENDP

bye_prompt:
	mov edx, OFFSET bye
	call WriteString ; print 'bye!' message
exit
END main