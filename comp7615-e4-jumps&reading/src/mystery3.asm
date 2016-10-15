segment .text
	global mystery3 

mystery3: 
	enter 0,0
	
	mov eax, [ebp+8]
	cmp eax, 1
	jbe there
	dec eax
	push eax
	call mystery3
	pop ecx
	mul dword [ebp+8]
	jmp here
there:
	mov eax, 1
here:
	leave
	ret
