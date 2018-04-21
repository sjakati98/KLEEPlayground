#include <stdio.h>

int get_sign(int x);

int main(){
  int a;
  klee_make_symbolic(&a, sizeof(a), "a");
  return get_sign(a);
}

int get_sign(int x){
  if(x == 0)
    return 0;
  else if (x < 0)
    return -1;
  else
    return 1;
}
