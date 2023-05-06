#include "parser.h"

// Input: User input string
// Output: Array of Tokens in reverse polish notation
void parse_equation(char * userInput, Queue * output){
    // Convert input to array of tokens
    Queue userInputQueue;
    structureQueue_Queue(&userInputQueue);
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
        if(!nextToken.isOperator || (char)nextToken.value == 'x'){
            // put it into the output queue
            enqueue_Queue(output, nextToken);
        }
        // an operator o1:
        else if(nextToken.isOperator) {

            // - a left parenthesis (i.e. "("):
            if (nextToken.value == '(') {
                //  push it onto the operator stack
                push_Stack(&operatorStack, nextToken);
            }
            // - a right parenthesis (i.e. ")"):
            else if (nextToken.value == ')') {
                // while the operator at the top of the operator stack is not a left parenthesis:
                while (peek_Stack(&operatorStack).value != '(') {
                    /* If the stack runs out without finding a left parenthesis, then there are mismatched parentheses. */
                    // pop the operator from the operator stack into the output queue
                    enqueue_Queue(output, pop_Stack(&operatorStack));
                }
                // pop the left parenthesis from the operator stack and discard it
                pop_Stack(&operatorStack);
            // If just a regular operator
            }else {
                // while ( there is an operator o2 at the top of the operator stack which is not a left parenthesis, and (o2 has greater precedence than o1 or (o1 and o2 have the same precedence and o1 is left-associative))):
                while (!isEmpty_Stack(&operatorStack) && (peek_Stack(&operatorStack).isOperator && peek_Stack(&operatorStack).value != '(') && peek_Stack(&operatorStack).precedence >= nextToken.precedence) {
                    
                    // pop o2 from the operator stack into the output queue
                    enqueue_Queue(output, pop_Stack(&operatorStack));
                }
                // push o1 onto the operator stack
                push_Stack(&operatorStack, nextToken);
            }
        }
        
    }
    /* After the while loop, pop the remaining items from the operator stack into the output queue. */
    // while there are tokens on the operator stack:
    while(!isEmpty_Stack(&operatorStack)) {
        /* If the operator token on the top of the stack is a parenthesis, then there are mismatched parentheses. */
        // pop the operator from the operator stack onto the output queue
        enqueue_Queue(output, pop_Stack(&operatorStack));
    }

}


/*
    Convert an equation as a string to an array of tokens
*/
void text_to_array_of_tokens(char * userInput, Queue * output){
    // Used to determine whether negative sign should be treated as negative number or subtraction
    int lastTokenWasOperator = 0;

    while (*userInput) {
        switch (*userInput){
            // Ignore spaces
            case ' ':{
                break;
            }
            // Parse character as addition
            case '+':{
                Token token;
                token.value = '+';
                token.isOperator = 1;
                token.precedence = 1;
                lastTokenWasOperator = 1;
                enqueue_Queue(output, token);
                break;
            }
            // Parse character as subtraction
            case '*':{
                Token token;
                token.value = '*';
                token.precedence = 2;
                token.isOperator = 1;
                lastTokenWasOperator = 1;
                enqueue_Queue(output, token);
                break;
            }
            // Parse character as division
            case '/':{
                Token token;
                token.value = '/';
                token.precedence = 2;
                token.isOperator = 1;
                lastTokenWasOperator = 1;
                enqueue_Queue(output, token);
                break;
            }
            // Parse character as exponent
            case '^':{
                Token token;
                token.value = '^';
                token.precedence = 3;
                token.isOperator = 1;
                lastTokenWasOperator = 1;
                enqueue_Queue(output, token);
                break;
            }
            // Parse character as open parentheses
            case '(':{
                Token token;
                token.value = '(';
                token.isOperator = 1;
                lastTokenWasOperator = 1;
                enqueue_Queue(output, token);
                break;
            }
            // Parse character as close parentheses
            case ')':{
                Token token;
                token.value = ')';
                token.isOperator = 1;
                lastTokenWasOperator = 0;
                enqueue_Queue(output, token);
                break;
            }
            // Parse character as variable
            case 'x':
            case 'X': {
                Token token;
                token.value = 'x';
                token.isOperator = 1;
                lastTokenWasOperator = 0;
                enqueue_Queue(output, token);
                break;
            }

            // Parse character as either number or subtraction
            case '-':
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9': {

                // If the char is a digit or if the char is a negative sign coming before an operator, parse the value as a number
                // Negative numbers will always come at the beginng of the equation or before an operator.
                if(isEmpty_Queue(output) || lastTokenWasOperator || *userInput != '-'){
                    int err = 0;
                    Token token;
                    token.value = str_to_fp(userInput, &err);
                    token.isOperator = 0;
                    lastTokenWasOperator = 0;
                    enqueue_Queue(output, token);

                    // If str_to_fp returned an error code, return an empty queue
                    if (err){
                        while(!isEmpty_Queue(output)){
                            dequeue_Queue(output);
                        }
                        return;
                    }

                    
                    // Move the pointer to the end of the number
                    userInput++;
                    while ((*userInput >= '0' && *userInput <= '9') || *userInput == '.' || *userInput == 'e' || *userInput == 'E' || (*userInput == '-' && (*(userInput-1) == 'e' || *(userInput-1) == 'E'))){
                        userInput++;
                    }

                    // Decrement once because the pointer will be incremented at the end of the loop
                    userInput--;

                // Otherwise, parse this as a subtraction operator
                }else {
                    Token token;
                    token.value = '-';
                    token.precedence = 1;
                    token.isOperator = 1;
                    lastTokenWasOperator = 1;
                    enqueue_Queue(output, token);
                }

                break;

            }
            // If the character was not found, return an empty queue
            default:
            {
                // Clear queue and return
                while(!isEmpty_Queue(output)){
                    dequeue_Queue(output);
                }
                return;
            }
        }

        // Increment to the next character
        userInput++;
    }

}
