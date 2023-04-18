#include "solver.h"

#include <stdlib.h> // Used only for debugging. Not actually supported on the board
#include <stdio.h> // Used only for debugging. Not actually supported on the board
int main(int argc, char *argv[]){

        
    Queue equation;
    structureQueue_Queue(&equation);

    parse_equation("1 + 1.2 * 2", &equation);

    int err;
    float output = solveEquation(&equation, 4.9, &err);

    printf("%f\n", output);


    return 0;
}



float solveEquation(Queue * equation, float x, int * err){
    *err = 0;
    if(isEmpty_Queue(equation)){
        *err = 1;
        return 0;   
    }

    Stack variableStack;

    while(!isEmpty_Queue(equation)){
        if(!peek_Queue(equation).isOperator){
            push_Stack(&variableStack, dequeue_Queue(equation));
        }else if ( (char)peek_Queue(equation).value == 'x'){
            dequeue_Queue(equation);
            Token newToken;
            newToken.value = x;
            newToken.isOperator = 0;
            push_Stack(&variableStack, newToken);
        }else{ // Next element is operator
            float operand1 = pop_Stack(&variableStack).value;
            float operand2 = pop_Stack(&variableStack).value;

            Token newValue;
            newValue.isOperator = 0;
            switch ((char)dequeue_Queue(equation).value){
                case '-':{
                    newValue.value = operand2 - operand1;
                    break;
                }
                case '+':{
                    newValue.value = operand2 + operand1;
                    break;
                }
                case '*':{
                    newValue.value = operand2 * operand1;
                    break;
                }
                case '/':{
                    newValue.value = operand2 / operand1;
                    break;
                }
                default : {
                    *err = 1;
                    return 0;   
                }
            }

            push_Stack(&variableStack, newValue);
        }
    }

    if(isEmpty_Stack(&variableStack)){
        *err = 1;
        return 0; 
    }

    float output = pop_Stack(&variableStack).value;
    
    if(pop_Stack(&variableStack).value && !isEmpty_Stack(&variableStack)){
        *err = 1;
        return 0; 
    }

    return output;


}