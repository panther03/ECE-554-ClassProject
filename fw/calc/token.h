#ifndef TOKEN_H
#define TOKEN_H

#define MAX_SIZE 80

/*
    Token structure (An ordered list of tokens forms an equation)

    - isOperator: 1 for operator, 0 for numerical value
    - value: The value of this token
        - If not an operator, value stores numerical value
        - If operator, the value should store one of the following ascii values: '+', '-', '*', '/', '(', ')', 'x'
    
*/
typedef struct Token{
    int isOperator;
    float value;
    int precedence;
} Token;


#endif /* TOKEN_H */
