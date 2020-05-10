# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adorigo <adorigo@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/26 11:18:50 by adorigo           #+#    #+#              #
#    Updated: 2020/04/26 11:21:42 by adorigo          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strcmp

;int ft_strcmp(rdi, rsi)
_ft_strcmp:
	xor			rcx, rcx
	xor			rdx, rdx
	cmp			rdi, rsi				; If equal pointers, return 0
	jz			equal
	cmp			rdi, 0x0				; If s1 == null, return +1
	jz			higher
	cmp			rsi, 0x0				; If s2 == null, return -1
	jz			lower

check:
	mov		dl, BYTE [rsi + rcx]		; Move S2 to rdx
	cmp		BYTE [rdi + rcx], dl		; Compare S2 to S1
	jne		end							; Not equal, yeet out
	inc		rcx							; Increment pointer
	jmp		check						; Reloop

end:
	mov		dl, BYTE [rdi + rcx]		; Move char on S1 to rdx
	sub		dl, BYTE [rsi + rcx]		; Subtract char on S2 from rdx
	cmp		dl, 0						; If 0, they are equal
	jl		lower
	jg		higher

equal:
	mov			rax, 0
	ret

higher:
	mov			rax, 1
	ret

lower:
	mov			rax, -1
	ret