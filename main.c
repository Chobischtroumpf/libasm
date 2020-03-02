/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adorigo <adorigo@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/27 09:39:39 by adorigo           #+#    #+#             */
/*   Updated: 2020/03/02 10:12:54 by adorigo          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <fcntl.h>
#include <unistd.h>
char *ft_strcpy(char *dst, const char *src);
ssize_t ft_read(int fd, void *buf, size_t nbyte);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

#include <stdio.h>

int	main()
{
	char c[100000] = "bloop";
	char *d = "b";
	int fd;

	// fd = open("./main.c", O_RDONLY);

	printf("ft_write :\n%zd\n", ft_write(888,"hey la miff" , 9));
	printf("write :\n%zd\n", write(888,"hey la miff" , 9));
	// close(fd);
	// fd = open("./main.c", O_RDONLY);
	printf("ft_read : \n%zd\n", ft_read(0, d, 10 ));
	printf("read : \n%zd\n", read(0, d, 10 ));
	// close(fd);

}
