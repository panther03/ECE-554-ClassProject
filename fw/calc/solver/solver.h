#ifndef SOLVER_H
#define SOLVER_H

#include "../parser/stack.h"
#include "../parser/queue.h"
#include "../parser/parser.h"


float solveEquation(Queue * equation, float x, int * err);

// gcc ../parser/stack.c ../parser/queue.c ../fp_conversions/str_fp.c ../parser/parser.c solver.c


#endif /* SOLVER_H */
