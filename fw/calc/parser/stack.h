#ifndef STACK_H
#define STACK_H


#include "token.h"

#define MAX_SIZE 20



typedef struct Stack {
    Token data[MAX_SIZE];
    int top;
} Stack;

extern int isEmpty_Stack(Stack * stack);
extern void push_Stack(Stack * stack, Token value);
extern Token pop_Stack(Stack * stack);
extern Token peek_Stack(Stack * stack);
extern void structureStack_Stack(Stack * stack);


#endif /* STACK_H */

/*** end of file ***/