#include "solver.h"

#include <stdlib.h> // Used only for debugging. Not actually supported on the board
#include <stdio.h> // Used only for debugging. Not actually supported on the board
int main(int argc, char *argv[]){

    printf("Hello World\n");

    return 0;
}



float solveEquation(Queue * equation, float x, int * err){
    *err = 0;
    if(isEmpty_Queue(equation)){
        *err = 1;
        return 0;   
    }

    
}