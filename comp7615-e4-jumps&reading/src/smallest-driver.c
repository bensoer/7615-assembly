#include <stdio.h>

extern int smallest(int first,int second,int third);

int main(){


	int small = smallest(8,15,12);

	printf("Smallest Returned: %d\n", small);

	return 0;

}