/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tester.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adorigo <adorigo@student.s19.be>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/26 11:22:48 by adorigo           #+#    #+#             */
/*   Updated: 2020/04/26 11:22:49 by adorigo          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef TESTER_H
# define TESTER_H

# include <sys/types.h>

extern ssize_t		ft_write(int fildes, const void *buf, size_t nbyte);
extern ssize_t		ft_read(int fildes, void *buf, size_t nbyte);
extern size_t		ft_strlen(const char *s);
extern char			*ft_strcpy(char *dst, const char *src);
extern int			ft_strcmp(const char *s1, const char *s2);
extern char			*ft_strdup(const char *s1);

#endif