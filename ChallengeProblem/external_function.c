#include <stdio.h>
#include <stdlib.h>
//#include <klee/klee.h>

int primary_function_1(int values[], int elem);
int primary_function_2(char* input);
int external_function(int values[], int l, int r, int elem);

int main(){
  int values[8] = {2,3,4,5,6,7,8,9};
  int elem;
  char input[4];
  
  klee_make_symbolic(&elem, sizeof(elem), "elem");
  input[3] = '\0';
  klee_make_symbolic(&input, sizeof(input), "input");
  primary_function_1(values, elem);
  primary_function_2(input);
  printf("Input: %d\n", primary_function_2(3290155));
}

int external_function(int values[], int l, int r, int elem){
  // simply search an array of integers for some value
  if (l > r)
    return -1;
  else{
    int mid = l + (l - r) / 2;
    if (elem < values[mid])
      return external_function(values, l, mid - 1, elem);
    else if (elem > values[mid])
      return external_function(values, mid + 1, r, elem);
    else
      return mid;
  }
  
}

int primary_function_1(int values[], int elem){
  int search_result = external_function(values, 0, 8, elem);
  if (search_result == 0){
    klee_assert(0);
    return 0;
  }
  else
    return search_result;
}

int primary_function_2(char* input){
  /*
   I have taken this function from the following tutorial: https://doar-e.github.io/blog/2015/08/18/keygenning-with-klee/

   This tutorial is extremely helpful in understanding the process of using functions outside the standard C library. Speciifically the ```atoi``` function. The differce in invoking this function lies in the way that the KLEE command line tool is used as opposed to any changes in the code. 
   */

  int result;
  result = atoi(input);
  if(result == 42)
    klee_assert(0);
  return result;
}
