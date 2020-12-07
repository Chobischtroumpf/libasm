global ft_read
extern __errno_location
%define SYSCALL_READ 0

; int ft_read(int, void*, size_t);
ft_read:
	mov  rax, SYSCALL_READ
	syscall
	jc FT_CHECK_SIGN
	ret

FT_CHECK_SIGN:
	cmp rax, 0
	jl INVERT_RAX

FT_READ_ERROR:
	mov rbx, rax
	push rbx	
	call __errno_location
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret

INVERT_RAX:
	neg rax
	jmp FT_READ_ERROR