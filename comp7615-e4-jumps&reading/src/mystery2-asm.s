	.file	"mystery2.c"
	.globl	prompt
	.data
	.align 32
	.type	prompt, @object
	.size	prompt, 38
prompt:
	.string	") Enter integer number (0 to quit): "
	.string	""
	.globl	result
	.align 16
	.type	result, @object
	.size	result, 17
result:
	.string	"The result is: "
	.string	""
	.globl	num
	.bss
	.align 4
	.type	num, @object
	.size	num, 4
num:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"%d"
	.text
	.globl	print_result
	.type	print_result, @function
print_result:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$result, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	num(%rip), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_result, .-print_result
	.globl	get_int
	.type	get_int, @function
get_int:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$prompt, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	get_int, .-get_int
	.globl	end_while
	.type	end_while, @function
end_while:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	print_result
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE4:
	.size	end_while, .-end_while
	.globl	while_loop
	.type	while_loop, @function
while_loop:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
.L7:
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	get_int
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L6
	movl	$0, %eax
	call	end_while
.L6:
	movl	num(%rip), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, num(%rip)
	jmp	.L7
	.cfi_endproc
.LFE5:
	.size	while_loop, .-while_loop
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	while_loop
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.2.1 20160916 (Red Hat 6.2.1-2)"
	.section	.note.GNU-stack,"",@progbits
