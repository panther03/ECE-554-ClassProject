#ifndef PARSER_H
#define PARSER_H



#include "queue.h"
#include "stack.h"
#include "token.h"
#include "../fp_conversions/str_fp.h"

void parse_equation(char * userInput, Queue * output);
void to_reverse_polish_notation(Queue * input, Queue * output);
void text_to_array_of_tokens(char * userInput, Queue * output);


// gcc ../fp_conversions/fp_str.c ../fp_conversions/str_fp.c queue.c stack.c parser.c


#endif /* PARSER_H */

/*** end of file ***/