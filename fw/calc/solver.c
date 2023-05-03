#include "solver.h"

// int main(int argc, char *argv[]){
        

//     Queue equation;
//     structureQueue_Queue(&equation);

//     parse_equation("-2^(1)", &equation);

//     int err;
//     float output = solveEquation(&equation, 2, &err);

//     float volatile * const p_reg = (float *) 0x1234;
//     *p_reg = output;

//     return 0;
// }



/*
    Solve an equation in reverse polish notation with a variable
*/
float solveEquation(Queue * equation, float x, int * err){
    // Save initial state of queue so it can be restored after the equation is solved.
    int initialHead = equation->head;
    int initialTail = equation->tail;
    int initialSize = equation->size;


    // Return an error if the queue is empty
    // (this can be caused by an equation that was improperly parsed)
    *err = 0;
    if(isEmpty_Queue(equation)){
        *err = 1;
        return 0;   
    }

    // Create a stack used to parse the reverse polish notation equation
    Stack variableStack;
    structureStack_Stack(&variableStack);

    // Iterate through each element of the equation
    while(!isEmpty_Queue(equation)){

        // If the next item on the stack is a number, put it on the stack
        if(!peek_Queue(equation).isOperator){
            push_Stack(&variableStack, dequeue_Queue(equation));

        // If the next item on the stack is a variable, put the correspoinding number on the stack
        }else if ( (char)peek_Queue(equation).value == 'x'){
            dequeue_Queue(equation);
            Token newToken;
            newToken.value = x;
            newToken.isOperator = 0;
            push_Stack(&variableStack, newToken);

        // Next element is operator preform the operation on the top two values on the stack
        }else{
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
                case '^':{

                    newValue.value = __builtin_powif(operand2, (int)operand1);
                    break;
                }
                // If the operation was not found, restore the queue and return an error code
                default : {
                    *err = 2;
                    // Restore queue
                    equation->head = initialHead;
                    equation->tail = initialTail;
                    equation->size = initialSize;

                    return 0;   
                }
            }

            // Replace the items on the top of the stack with the result
            push_Stack(&variableStack, newValue);
        }
    }

    // If the stack is empty at the end of the algorithm, there is now result available so the equation was invalid
    // Restore the queue and return an error code
    if(isEmpty_Stack(&variableStack)){
        *err = 3;

        // Restore queue
        equation->head = initialHead;
        equation->tail = initialTail;
        equation->size = initialSize;
        return 0; 
    }

    // Restore queue
    // Since the data in the queue is preserved after dequeues, we only need to restore the head, tail, and size 
    // so that at the queue is in the same state as it was at the begining of the function call
    equation->head = initialHead;
    equation->tail = initialTail;
    equation->size = initialSize;

    // Return the output
    float output = pop_Stack(&variableStack).value;
    return output;

}