#include <stdio.h>
#include <stdlib.h>





// mystery3 is a recursion function that recursively counts down to 0, and then multiplies
//the results at each recursion as it returns its way back up the recursive iterations
int mystery3(int first){

	if(first <= 1){
		
		//here and there function simplified to reduce assembly code generated
		first = 0;
		return first;

	}else{
		first = first - 1;
		int answer = mystery3(first);
		answer = answer * first;
		return answer;
	}
}


//main entrance driver for the program. the origina assembly did not include this functionality
int main(){

	mystery3(8);


	return 0;
}