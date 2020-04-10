; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: adorigo <adorigo@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/02 10:14:07 by adorigo           #+#    #+#              ;
;    Updated: 2020/03/02 14:15:02 by adorigo          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcmp

_ft_strcmp:
	mov rax, rdi
	mov rbx, rsi
	mov rcx, -1
FT_STRCMP_LOOP:
	inc rcx
	cmp byte [rax + rcx], 0
	je FT_STRCMP_LOOP_END
	mov dl, byte[rax + rcx]
	