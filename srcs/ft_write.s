global ft_write
extern __errno_location


%define F_GETFD 1

; int ft_write(int rdi, const void *rsi, size_t rdx);
ft_write:
	cmp  rdx, 0
	je   FT_WRITE_NO_SIZE
	cmp  rdi, 0
	jl   FT_WRITE_ERROR_SYS    ; fd < 0
	cmp  rsi, 0
	je   FT_WRITE_ERROR_SYS    ; buf == NULL

	push rdx
	push rsi
	mov  esi, F_GETFD
	mov  rax, 72 
	syscall
	pop  rsi
	pop  rdx
	cmp  eax, 0
	jne  FT_WRITE_ERROR

	mov  rax, 1
	syscall
	ret

FT_WRITE_ERROR_SYS:
	mov rax, 1
	syscall
	mov rbx, rax
	push rbx
	call __errno_location
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret

FT_WRITE_ERROR:
	mov rbx, rax
	push rbx	
	call __errno_location
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret

FT_WRITE_NO_SIZE:
	mov  rax, 0
	ret
