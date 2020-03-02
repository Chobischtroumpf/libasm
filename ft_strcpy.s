; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: adorigo <adorigo@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 10:14:07 by adorigo           #+#    #+#              ;
;    Updated: 2020/02/25 10:15:02 by adorigo          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy

;char *ft_strcpy(char *dst, const char *src)
_ft_strcpy:
	push rbx
	push rcx
	mov rax, rdi ; moving rdi to rax (rdi = dst)
	mov rbx, rsi ; moving rsi to rax (rsi = src)
	mov rcx, -1
FT_STRCPY_LOOP:
	inc rcx ; rcx++, rcx == incrementer
	mov dl, byte [rbx + rcx]; moves rbx[rcx] into dl,a 8bit reg used for char
	mov byte [rax + rcx], dl; copies dl into rax[rcx] which is the destination
	cmp byte [rbx + rcx], 0; compares 0 with rbx[rcx]
	jne FT_STRCPY_LOOP
	pop rcx; removes rcx from the stack
	pop rbx; removes rbx from the stack
	ret
