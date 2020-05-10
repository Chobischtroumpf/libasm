# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adorigo <adorigo@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/25 10:14:07 by adorigo           #+#    #+#              #
#    Updated: 2020/04/26 11:45:26 by adorigo          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

extern _ft_strlen
extern _ft_strcpy
extern _malloc

global _ft_strdup

; char *ft_strdup(const char *str);
_ft_strdup:
	push rdi         ; save rdi because it will be overwrite for malloc

	call _ft_strlen  ; rdi is still == str
	inc  rax          ; len++ for '\0'

	mov  rdi, rax     ; size to malloc
	call _malloc
	cmp  rax, 0
	je   FT_STRDUP_ERROR

	pop  rsi          ; original str as src
	mov  rdi, rax     ; allocated as dest
	call _ft_strcpy
	ret
FT_STRDUP_ERROR:
	pop  rdi
	ret
