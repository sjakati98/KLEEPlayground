#include <stdio.h>
#include <klee/klee.h>

#define MAX 25
#define MIN 1
#define RIGHT_DIRECTION 101

int f(int input, int param);

int main(int argc, char* argv[]){
  int input, param;
  int result[32];
  //klee_make_symbolic(&input, sizeof(input), "input");
  klee_make_symbolic(&param, sizeof(int), "param");
  for(int i = 0; i < 32; i++){
    input = rand() % (MAX + 1 - MIN) + MIN;
    f2(input, param);
  }
  return 0;
}


int f(int input, int param){
  // the PReLU activation function
  if(input < 0)
    return param * input;
  else if(input > 0)
    return input;
  klee_assert(param * input);
  return param * input;
}

int f2(int input, int param){
    // simple direction simulator                                                                                                                                                                              
    // input is current heading, and param is some external sensor
    int direction = input;
    if (param == 0)
      return direction;
    else if (param > 0){
      direction = direction * (param / 2);
      return direction;
    }
    else{ // param < 0
        direction = 0;
	return direction;
    }
}
