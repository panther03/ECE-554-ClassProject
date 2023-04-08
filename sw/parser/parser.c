#include "parser.h"
#include <stdlib.h> // Used only for debugging. Not actually supported on the board
int main(int argc, char *argv[]){




    return 0;
}

// Input: User input string
// Output: Array of Tokens in reverse polish notation
void parse_equation(char * userInput, Token * output){
    // Convert input to array of tokens
    Token userInputTokens[100];
    text_to_array_of_tokens(userInput, userInputTokens);

    // Convert array of tokens to reverse polish notation
    to_reverse_polish_notation(userInputTokens, output);
}


// Parsed using the Shunting yard algorithm
// https://en.wikipedia.org/wiki/Shunting_yard_algorithm
// Input array is the user input parsed into an array of tokens
// Output array is array of tokens in reverse polish notation
void to_reverse_polish_notation(Token * input, Token * output){
    Token a;
    Token b;
    Token c;

    output[0] = a;
    output[1] = b;
    output[2] = c;


}


void text_to_array_of_tokens(char * userInput, Token * output){

}