#include <../solver/solver.h>

/*volatile int VGA_GR_BUFF = 0xfffeD400;

void plot_x_axis(float lower, float upper) {
    float span = upper - lower;
    float y_offset = (upper / span) * 240;
    
    int* writeAddr = VGA_GR_BUFF + (int)(y_offset * 320);

    int i;
    for (i = 0; i < 320; i++) {
        *(writeAddr + i) = 0xe;
    }
}

void plot_y_axis(float lower, float upper) {
    float span = upper - lower;
    float x_offset = (-lower / span) * 320;
    
    int* writeAddr = VGA_GR_BUFF + (int)(x_offset);

    int i;
    int y_offset = 0;
    for (i = 0; i < 240; i++) {
        *(writeAddr + y_offset) = 0xe;
	y_offset += 320;
    }
}

void plot_xy(int x, int y) {
    int *writeAddr = VGA_GR_BUFF + x + (320 * y);
    *writeAddr = 0x2;
}*/

//__attribute__((section(".text")))
int main() {
    float x_lower = -10.0f;
    float x_upper = 10.0f;
    // 320 X 240
    float x_step = (x_upper - x_lower) * .003125f; // * 1/320

    float y_lower = -10.0f;
    float y_upper = 10.0f;

    float x = x_lower;
    float y;

    float span = upper - lower;

    // parse eqs;
    Queue* parsedEq;
    Queue* eqPolishNot;
    char* eq = "-1 * x";
    int i;
    //for (i = 0; i < 4; i++) {
        parse_equation(eq, parsedEq);
        to_reverse_polish_notation(parsedEq, eqPolishNot[i]);

        eq += 80; // eq offset
    //}
    

    // axis
   /* if (x_lower <= 0 && x_upper >= 0) {
        plot_y_axis(x_lower, x_upper);
    }
    if (y_lower <= 0 && y_upper >= 0) {
        plot_x_axis(y_lower, y_upper);
    }*/

    // graph lines
    int err;
    int x_coord = 0;
    int y_coord
    while (x < x_upper) {
        y = solveEquation(eqPolishNot[0], x, &err);

	if (err != 0 && y >= y_lower && y <= y_upper) {
            y_coord = (int)((y / span) * 240.0f);
            // plot_xy(x_coord, y_coord);

	    printf("%d, %d\n", x_coord, y_coord);
        }

	x += x_step;
	x_coord += 1;
    }
    

    return 0;
}
