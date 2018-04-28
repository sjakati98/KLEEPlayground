#include <stdio.h>
#include <klee/klee.h>

int f(int input, int param);

int main(int argc, char* argv[]){
  int input, param, result;
  klee_make_symbolic(&input, sizeof(input), "input");
  param = 2;
  result = f(input, param);
  return result;
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

