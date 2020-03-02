/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adorigo <adorigo@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/27 09:39:39 by adorigo           #+#    #+#             */
/*   Updated: 2020/02/28 09:55:00 by adorigo          ###   ########.fr       */
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

	printf("\n%zd\n", ft_write(1,"hey la miff" , 9));
	// close(fd);
	// fd = open("./main.c", O_RDONLY);
	// printf("%zd\n", read(fd, d, 100000 ));


}
