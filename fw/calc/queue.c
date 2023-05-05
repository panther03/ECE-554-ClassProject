
#include "queue.h"



void structureQueue_Queue(Queue * queue) {
    queue->head = -1;
    queue->tail = -1;
    queue->size = 0;
}

int isEmpty_Queue(Queue * queue){
    return (queue->size == 0);
}

void enqueue_Queue(Queue * queue, Token value){
    if(isEmpty_Queue(queue)) {
        queue->head = 0;
        queue->tail = 0;
    } else {
        queue->tail = (queue->tail + 1) % MAX_SIZE;
    }

    queue->data[queue->tail] = value;
    queue->size += 1;
}

Token dequeue_Queue(Queue * queue) {
    Token value = queue->data[queue->head];

    if(queue->size == 1){
        queue->head = -1;
        queue->tail = -1;
    } else {
        queue->head = (queue->head + 1) % MAX_SIZE;
    }

    queue->size -= 1;

    return value;
}


Token peek_Queue(Queue * queue) {
    return queue->data[queue->head];
}