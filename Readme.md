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
  klee_assert(FALSE); //This line indicates that some input is outside of the "boundaries" within the conditionals
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


Finally, here is a function that takes in randomized input and synthesized params:
```
int main(){
  int input, param;
  klee_make_symbolic(&input, sizeof(input), "input");
  klee_make_symbolic(&param, sizeof(param), "param");
  return funky_math(input, param);
}


int funky_math(int input, int param){
  int result = 0;
  for (int i = 0; i < param / 2; ++i)
    result = result + input + (i << 2);
  if (result == 73)
    klee_assert(0); // We get the right answer                                                       
  return result;
}

```

An interesting note about this example is that KLEE seems to find a working example within the first two runs of execution. However, an enormous number of runs are made following that; I halted the process after the 421st test. The output from the KTest-Tool for the correct run is shown below:
```
num objects: 2
object    0: name: b'input'
object    0: size: 4
object    0: data: 73
object    1: name: b'param'
object    1: size: 4
object    1: data: 2
```

Now we may try making external function calls:
```
int primary_function_2(char* input){
  /*                                                                                                 
   I have taken this function from the following tutorial: https://doar-e.github.io/blog/2015/08/18/\
keygenning-with-klee/                                                                                
                                                                                                     
   This tutorial is extremely helpful in understanding the process of using functions outside the standard C library. Speciifically the ```atoi``` function. The differce in invoking this function lies in the way that the KLEE command line tool is used as opposed to any changes in the code.           
   */

  int result;
  result = atoi(input);
  if(result == 42)
    klee_assert(0);
  return result;
}
```

---
## Floats

Blindly substituting ```float``` for ```int``` when using KLEE will result in the following warning:
```
KLEE: WARNING ONCE: silently concretizing (reason: floating point) expression (ReadLSB w32 0 input) to value 0 (/home/klee/KLEEPlayground/ChallengeProblem/right_answer.c:9)
```

The reasoning behind this is, as stated in the paper [*"Floating-Point Symbolic Execution: A Case Study in N-Version Programming"*](https://srg.doc.ic.ac.uk/files/papers/klee-n-version-fp-ase-17.pdf), that no suitable solver was available during time of development. Instead, KLEE will concretize arguments, rendering them a different datatype than was initially intended. This, depending on the application, may negate any benefits of using KLEE. The [KLEE-Float](https://srg.doc.ic.ac.uk/projects/klee-float/) project is an effort to use floating point numbers within KLEE. (I am still trying to get this to build on my machine, I will update when I do.)

---
## Constraints

### Basic Definitions:
- Hard constraints are those which must be satisfied, regardless of extraneous circumstances
- Soft constraints are those which should be satisfied, but it is not required for them to be so

In KLEE, these concepts come to fruition through the intrinsic functions: ```klee_assume(condition)``` representing hard constraints and ```klee_prefer_cex(object, condition)``` representing soft constraints. This means that KLEE does support soft constraints; according to the documentation provided when ["KLEE finds paths that conflict with the ```klee_prefer_cex``` condition, it will ignore the preference."](http://klee.github.io/docs/intrinsics/)

The question of encoding soft constraints with hard constraints can be answered using the ```klee_assume``` condition. 
