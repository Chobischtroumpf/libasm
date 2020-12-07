global ft_write
extern __errno_location


%define F_GETFD 1

; int ft_write(int rdi, const void *rsi, size_t rdx);
ft_write:
	mov  rax, 1
	syscall
	jc FT_CHECK_SIGN
	ret

FT_CHECK_SIGN:
	cmp rax, 0
	jl INVERT_RAX

FT_WRITE_ERROR:
	mov rbx, rax
	push rbx	
	call __errno_location
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret

INVERT_RAX:
	neg rax
	jmp FT_WRITE_ERROR