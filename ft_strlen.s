# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adorigo <adorigo@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/25 10:02:41 by adorigo           #+#    #+#              #
#    Updated: 2020/02/25 10:03:43 by adorigo          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strlen

_ft_strlen:
	mov eax, -1
FT_STRLEN_LOOP:
	inc eax
	cmp byte[rdi + rax], 0
	jne FT_STRLEN_LOOP
	ret