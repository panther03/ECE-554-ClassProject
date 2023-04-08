#include "parser.h"

#define MAX_SIZE 20

typedef struct Queue {
    Token data[MAX_SIZE];
    int head;
    int tail;
    int size;
} Queue;

void structureQueue(Queue * queue) {
    queue->head = -1;
    queue->size = 0;
}

int isEmpty(Queue * queue){
    return (queue->size == 0);
}

void enqueue(Queue * queue, Token value){
    if(isEmpty(queue)) {
        queue->head = 0;
        queue->tail = 0;
    } else {
        queue->tail = (queue->tail + 1) % MAX_SIZE;
    }

    queue->data[queue->tail] = value;
    queue->size += 1;
}

Token dequeue(Queue * queue) {
    Token value = queue->data[queue->head];

    if(queue->size = 1){
        queue->head = -1;
        queue->tail = 0;
    } else {
        queue->head = (queue->head + 1) % MAX_SIZE;
    }

    queue->size -= 1;

    return value;
}


Token peek(Queue * queue) {
    return queue->data[queue->head];
}