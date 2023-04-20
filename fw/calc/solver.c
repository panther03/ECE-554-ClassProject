#include "solver.h"
/*int main(int argc, char *argv[]){

        

    Queue equation;
    structureQueue_Queue(&equation);

    parse_equation("((3.2 * 7.5) + (2.7 / 4.2) - (8.1)) * (((4.1 / 1.7) + 0.5) / (7.3 - 4.6)) ", &equation);

    int err;
    float output = solveEquation(&equation, 4.9, &err);

    float volatile * const p_reg = (float *) 0x1234;
    *p_reg = output;

    



    return 0;
}
*/



float solveEquation(Queue * equation, float x, int * err){
    *err = 0;
    if(isEmpty_Queue(equation)){
        *err = 1;
        return 0;   
    }

    Stack variableStack;
    structureStack_Stack(&variableStack);

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
                    *err = 2;
                    return 0;   
                }
            }

            push_Stack(&variableStack, newValue);
        }
    }

    if(isEmpty_Stack(&variableStack)){
        *err = 3;
        return 0; 
    }

    float output = pop_Stack(&variableStack).value;
    return output;

}