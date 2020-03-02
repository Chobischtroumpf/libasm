; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: adorigo <adorigo@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 10:14:07 by adorigo           #+#    #+#              ;
;    Updated: 2020/03/02 10:15:02 by adorigo          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

extern _malloc
extern _ft_strcpy
extern _ft_strlen

global _ft_strdup

_ft_strdup:
	push rdi ; saves rdi on the stack because it will be overwritten for malloc

	call _ft_strlen 
	inc rax ; rax is where strlen value is saved, and len++ for '\0'

	mov rdi, rax ; size to malloc
	call _malloc
	cmp rax, 0
	je FT_STRDUP_ERR

	pop rsi	; src
	mov rdi, rax ; allocated memory for dest
	call _ft_strcpy ; copies src as dest
	ret
FT_STRDUP_ERR:
	pop rdi
	ret