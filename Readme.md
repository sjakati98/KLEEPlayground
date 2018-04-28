## Challenge Problem
```                                                                                                                                                              
#define FALSE 0
#define TRUE 1

typedef int BOOL;

int main(){
  int input;
  klee_make_symbolic(&input, sizeof(input), "input");
  return check_arg(input);
}

BOOL check_arg(int x){
  if (x > 10)
    return TRUE;
  else if (x < 10)
    return FALSE;
  klee_assert(FALSE);
  return FALSE;
}
```

What we see here is an extremely simple example that is helpful in understanding what KLEE is great for. In this case, KLEE is being used to debug the program, and ultimately find the assertion error for the input ```x = 10; ```.  Upon running this code we receive the error:
```
KLEE: Using STP solver backend
KLEE: ERROR: /home/klee/KLEEPlayground/KeyGenningTutorial/code_snip_one.c:23: ASSERTION FAIL: FALSE
KLEE: NOTE: now ignoring this error at this location

KLEE: done: total instructions = 27
KLEE: done: completed paths = 3
KLEE: done: generated tests = 3
```
Upon further inspection using the KTest-Tool, we see the trace of this run:
```
num objects: 1
object    0: name: b'input'
object    0: size: 4
object    0: data: 10
```
Here's a more relevant example:

```
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
```
One problem that can arise is having a zero input from a convolutional layer. Here, KLEE has again found the breaking case:
```
KLEE: ERROR: /home/klee/KLEEPlayground/ChallengeProblem/function.c:21: ASSERTION FAIL: param * input
KLEE: NOTE: now ignoring this error at this location

KLEE: done: total instructions = 50
KLEE: done: completed paths = 3
KLEE: done: generated tests = 3
 ---
object    0: name: b'input'
object    0: size: 4
object    0: data: 0
```
---
## Floats
---
## Constraints

### Basic Definitions:
- Hard constraints are those which must be satisfied, regardless of extraneous circumstances
- Soft constraints are those which should be satisfied, but it is not required for them to be so

 
