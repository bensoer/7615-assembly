#include <stdio.h>
#include <stdlib.h>

char prompt[] = ") Enter integer number (0 to quit): \0";
char result[] = "The result is: \0";
int num = 0 ;

void print_result(){

	printf("%s", result);
	printf("%d", num);
	printf("\n");
}

int get_int(int index){

	printf("%d", index);
	printf("%s", prompt);

	int input;
	scanf("%d", &input);
	return input;

}

void end_while(){

	print_result();
	exit(0);
}

void while_loop(int index){

	while(1){
		int input = get_int(index);

		if(input == 0){
			end_while();
		}

		num += input;
	}

	
}


int main(){

	int start = 1;

	while_loop(start);


	return 0;
}