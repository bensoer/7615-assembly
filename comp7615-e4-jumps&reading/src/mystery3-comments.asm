segment .text
	global mystery3 

mystery3: 
	enter 0,0				; start a new function / context
	
	mov eax, [ebp+8]		; mov 1st param to eax
	cmp eax, 1				; compare eax and 1
	jbe there				; if eax is below or equal to 1 go to there
	dec eax					; decrement eax by 1
	push eax				; push eax onto the stack
	call mystery3			; call mystery3
	pop ecx					; decrement counter ?
	mul dword [ebp+8]		; multiply 1st param by eax
	jmp here				; jump to here
there:
	mov eax, 1				; mov 1 to eax
here:
	leave					; leave - reset pointers and base
	ret 					; terminate program
