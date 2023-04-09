#include "stack.h"

void structureStack_Stack(Stack * stack){
    stack->top = -1;
}

int isEmpty_Stack(Stack * stack) {
    return (stack->top == -1);
}

void push_Stack(Stack * stack, Token value) {
    stack->top += 1;
    stack->data[stack->top] = value;
}

Token pop_Stack(Stack * stack) {
    Token value = stack->data[stack->top];
    stack->top -= 1;
    return value;
}

Token peek_Stack(Stack * stack){
    Token value = stack->data[stack->top];
}
