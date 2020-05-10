global _ft_write
extern ___error


%define F_GETFD 1

; int ft_write(int rdi, const void *rsi, size_t rdx);
_ft_write:
	cmp  rdx, 0
	je   FT_WRITE_NO_SIZE
	cmp  rdi, 0
	jl   FT_WRITE_ERROR    ; fd < 0
	cmp  rsi, 0
	je   FT_WRITE_ERROR    ; buf == NULL

	push rdx
	push rsi
	mov  esi, F_GETFD
	mov  rax, 0x200005c 
	syscall
	pop  rsi
	pop  rdx
	cmp  eax, 0
	jne  FT_WRITE_ERROR

	mov  rax, 0x2000004
	syscall
	ret
FT_WRITE_ERROR:
	mov  rax, -1
	ret
FT_WRITE_NO_SIZE:
	mov  rax, 0
	ret