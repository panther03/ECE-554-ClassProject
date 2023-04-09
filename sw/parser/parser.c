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
    
    while(!isEmpty_Queue(input)){
        Token nextToken = dequeue_Queue(input);

        if(!nextToken.isOperator){
            enqueue_Queue(output, nextToken);
        }else {

        }
    }

}


void text_to_array_of_tokens(char * userInput, Queue * output){

}