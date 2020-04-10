; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: adorigo <adorigo@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 10:14:07 by adorigo           #+#    #+#              ;
;    Updated: 2020/02/25 10:50:00 by adorigo          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_read

%define F_GETFD 1
%define SYSCALL_READ 0x2000003
%define SYSCALL_FCNTL 0x200005c

; int ft_read(int, void*, size_t);
_ft_read:
	cmp rdx, 0
	je  FT_READ_NO_SIZE
	cmp rdi, 0
	jl  FT_READ_ERROR
	cmp rsi, 0
	je  FT_READ_ERROR

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
FT_READ_ERROR:
	mov rax, -1
	ret
FT_READ_NO_SIZE:
	xor rax, rax
	ret