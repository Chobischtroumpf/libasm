global ft_read
extern __errno_location
%define F_GETFD 1
%define SYSCALL_READ 0
%define SYSCALL_FCNTL 72

; int ft_read(int, void*, size_t);
ft_read:
	cmp rdx, 0
	je  FT_READ_NO_SIZE
	cmp rdi, 0
	jl  FT_READ_ERROR_SYS
	cmp rsi, 0
	je  FT_READ_ERROR_SYS

	push rdx
	push rsi
	mov  esi, F_GETFD
	mov  rax, SYSCALL_FCNTL 
	syscall
	pop  rsi
	pop  rdx
	cmp  eax, 0
	jne  FT_READ_ERROR

	mov rax, SYSCALL_READ
	syscall
	ret

FT_READ_ERROR_SYS:
	mov rax, SYSCALL_READ
	syscall
	mov rbx, rax
	push rbx
	call __errno_location
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret

FT_READ_ERROR:
	mov rbx, rax
	push rbx	
	call __errno_location
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret
FT_READ_NO_SIZE:
	xor rax, rax
	ret
