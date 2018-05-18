#include <stdio.h>
#include <klee/klee.h>


int main(){
  float input, param;
  klee_make_symbolic(&input, sizeof(input), "input");
  klee_make_symbolic(&param, sizeof(param), "param");
  return funky_math(input, param);
}


int funky_math(int input, int param){
  float result = 0;
  for (int i = 0; i < param / 2; ++i)
    result = result + input + (i << 2);
  if (result == 73.1)
    klee_assert(0); // We get the right answer
  return result;
}
