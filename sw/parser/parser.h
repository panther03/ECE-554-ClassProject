#ifndef PARSER_H
#define PARSER_H


/*
    Token structure (An ordered list of tokens forms an equation)

    - isOperator: 1 for operator, 0 for numerical value
    - value: The value of this token
        - If not an operator, value stores numerical value
        - If operator, the value should store one of the following ascii values: '+', '-', '*', '/', '(', ')'
    
*/
typedef struct Token{
    int isOperator;
    int value;
} Token;


void parse_equation(char * userInput, Token * output);
void to_reverse_polish_notation(Token * input, Token * output);
void text_to_array_of_tokens(char * userInput, Token * output);


#include "queue.c"


#endif /* PARSER_H */

/*** end of file ***/