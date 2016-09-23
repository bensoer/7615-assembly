#include <stdio.h>
#include <stdlib.h>

extern int asmadder(int first, int second, int third);

int main(void)
{

	int result = asmadder(3, 4, 5);
	printf("%d\n", result);

	return EXIT_SUCCESS;

}