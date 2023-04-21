#ifndef SOLVER_H
#define SOLVER_H

#include "stack.h"
#include "queue.h"
#include "parser.h"


float solveEquation(Queue * equation, float x, int * err);

// gcc ../parser/stack.c ../parser/queue.c ../fp_conversions/str_fp.c ../parser/parser.c solver.c


#endif /* SOLVER_H */
