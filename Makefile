# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adorigo <adorigo@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/08 03:06:59 by cacharle          #+#    #+#              #
#    Updated: 2020/04/26 15:38:13 by adorigo          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

S_SRC		=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s \
            ft_strdup.s
SRC         =	$(addprefix srcs/, $(S_SRC))
OBJ         =	$(SRC:.s=.o)

SRC_BONUS	=
SRC_BONUS	=	$(addprefix bonus/, $(BONUS_FILES))
OBJ_BONUS	=	$(SRC_BONUS:.s=.o)

NAME		=	libasm.a
EXE			=    testing/test

ASM			=	nasm
ASFLAGS		=	-f macho64
CC			=	gcc
RM			=	rm -rf
AR			=	ar -rc

all:		$(NAME)

$(NAME):	$(OBJ)
			@$(AR) $(NAME) $(OBJ)

bonus:		$(OBJ) $(OBJ_BONUS)
			@$(AR) $(NAME) $(OBJ) $(OBJ_BONUS)

clean:
			@$(RM) $(OBJ)

fclean:		clean
			@$(RM) $(NAME)
			@$(RM) $(EXE)

re:			fclean all

main:		re bonus
			@$(CC) -o $(EXE) libasm.a testing/*.c && ./$(EXE)

%.o:		%.s
			@$(ASM) $(ASFLAGS) $< -o $@
