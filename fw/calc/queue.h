#ifndef QUEUE_H
#define QUEUE_H


#include "token.h"



typedef struct Queue {
    Token data[MAX_SIZE];
    int head;
    int tail;
    int size;
} Queue;

extern int isEmpty_Queue(Queue * queue);
extern void enqueue_Queue(Queue * queue, Token value);
extern Token dequeue_Queue(Queue * queue);
extern Token peek_Queue(Queue * queue);
extern void structureQueue_Queue(Queue * queue);


#endif /* QUEUE_H */

/*** end of file ***/