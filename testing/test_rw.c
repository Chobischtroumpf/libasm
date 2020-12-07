#include "test.h"
#include <errno.h>

int test_write(void)
{
	printf("\n--- test write VS ft_write ---\n\n");
	printf("errno at the beginning [%d]\n", errno);
	write(-1, "chocolat", 9);
	printf("errno [%d]\n", errno);
	ft_write(-1, "chocolat", 9);
	printf("errno [%d]\n", errno);
	printf("write :\n");
	printf("\nvalue = %zd\n", write(1, "Hello World!", 12));
	printf("\nvalue = %zd\n", write(1, "Hello World!", 5));
	printf("ft_write :\n");
	printf("\nvalue = %zd\n", ft_write(1, "Hello World!", 12));
	printf("\nvalue = %zd\n", ft_write(1, "Hello World!", 5));

	return (1);
}

int	test_read(void)
{
	int		ret;
	char	buf[1024];
	printf("\n--- test read VS ft_read ---\n\n");
	printf("errno at the beginning [%d]\n", errno);
	ret = read(-1, buf, sizeof(buf)-1);
	buf[1023] = 0;
	printf("errno [%d]\n", errno);
	ret = ft_read(-1, buf, sizeof(buf)-1);
	buf[1023] = 0;
	printf("errno [%d]\n", errno);
	printf("WRITE SOMETHING\n");
	ret = read(1, buf, sizeof(buf)-1);
	buf[ret] = 0;
	printf("READ RESULT: %s", buf);
	printf("WRITE SOMETHING AGAIN\n");
	ret = ft_read(1, buf, sizeof(buf)-1);
	buf[ret] = 0;
	printf("FT_READ RESULT: %s", buf);
	return (1);
}
