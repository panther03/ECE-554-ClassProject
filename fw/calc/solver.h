#ifndef SOLVER_H
#define SOLVER_H

#include "stack.h"
#include "queue.h"
#include "parser.h"

#define ERR_SOLVER_EMPTY    1
#define ERR_SOLVER_BADCHAR  2
#define ERR_SOLVER_BADSTACK 3

float solveEquation(Queue * equation, float x, int * err);

// gcc ../parser/stack.c ../parser/queue.c ../fp_conversions/str_fp.c ../parser/parser.c solver.c


#endif /* SOLVER_H */
