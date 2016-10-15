#include <stdio.h>


int main(){

	int first;
	int second = 1;
	int third = 0;

	while(1){

		printf("%d\n", third);

		first = second + third;

		third = second;
		second = first;

		if(third <= 254){
			continue;
		}else{
			break;
		}
	}

	return 0;

}