#ifndef FT_PRINTF_H
# define FT_PRINTF_H
# include <stdio.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include <stdlib.h>
# include <errno.h>
# include "tester.h"

int			test_write(void);
int			test_read(void);

int			test_strlen(void);
int			test_strcpy(void);
int			test_strcmp(void);
int			test_strdup(void);

#endif
