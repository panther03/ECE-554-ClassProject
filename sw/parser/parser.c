#include "parser.h"
#include <stdlib.h> // Used only for debugging. Not actually supported on the board
int main(int argc, char *argv[]){




    return 0;
}

// Input: User input string
// Output: Array of Tokens in reverse polish notation
void parse_equation(char * userInput, Queue * output){
    // Convert input to array of tokens
    Queue userInputQueue;
    text_to_array_of_tokens(userInput, &userInputQueue);

    // Convert array of tokens to reverse polish notation
    to_reverse_polish_notation(&userInputQueue, output);
}


// Parsed using the Shunting yard algorithm
// https://en.wikipedia.org/wiki/Shunting_yard_algorithm
// Input array is the user input parsed into an array of tokens
// Output array is array of tokens in reverse polish notation
void to_reverse_polish_notation(Queue * input, Queue * output){

    // Define operatorStack
    Stack operatorStack;
    structureStack_Stack(&operatorStack);


    // while there are tokens to be read:
    while(!isEmpty_Queue(input)){
        //read a token
        Token nextToken = dequeue_Queue(input);
        //if the token is:
        // - a number:
        if(!nextToken.isOperator){
            // put it into the output queue
        }
        // an operator o1:
        else if(1) {
            // while ( there is an operator o2 at the top of the operator stack which is not a left parenthesis, and (o2 has greater precedence than o1 or (o1 and o2 have the same precedence and o1 is left-associative))):
            while (1) {
                // pop o2 from the operator stack into the output queue
            }
            // push o1 onto the operator stack
        }
        // - a left parenthesis (i.e. "("):
         else if (1) {
            //  push it onto the operator stack
         }
        // - a right parenthesis (i.e. ")"):
        else if (1) {
            // while the operator at the top of the operator stack is not a left parenthesis:
            while (1) {
                /* If the stack runs out without finding a left parenthesis, then there are mismatched parentheses. */
                // pop the operator from the operator stack into the output queue
            }
            // pop the left parenthesis from the operator stack and discard it
            //  if there is a function token at the top of the operator stack, then:
            if (1){
                // pop the function from the operator stack into the output queue
            }
        }
    }
    /* After the while loop, pop the remaining items from the operator stack into the output queue. */
    // while there are tokens on the operator stack:
    while(1) {
        /* If the operator token on the top of the stack is a parenthesis, then there are mismatched parentheses. */
        // pop the operator from the operator stack onto the output queue
    }

}


void text_to_array_of_tokens(char * userInput, Queue * output){

}