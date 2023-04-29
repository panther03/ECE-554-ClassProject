#include "solver.h"

//#include <stdio.h>

volatile unsigned char* VGA_GR_BUFF = 0xfffeD400;

void plot_x_axis(float lower, float upper) {
    float span = upper - lower;
    int y_offset = (int)((upper / span) * 239.0f);
    
    if (((int)upper) != 0 && ((int)lower) != 0) {
        y_offset += 1;
    }

    volatile char* writeAddr = VGA_GR_BUFF + (y_offset * 320);

    int i;
    for (i = 0; i < 320; i++) {
        *(writeAddr + i) = 0xe;
    }
}

void plot_y_axis(float lower, float upper) {
    float span = upper - lower;
    int x_offset = (int)((-lower / span) * 319.0f);

    if (((int)upper) != 0 && ((int)lower) != 0) {
        x_offset += 1;
    }

    volatile char* writeAddr = VGA_GR_BUFF + x_offset;

    int i;
    int y_offset = 0;
    for (i = 0; i < 240; i++) {
        *(writeAddr + y_offset) = 0xe;
	y_offset += 320;
    }
}

void plot_xy(int x, int y) {
    if (x >= 320 || y >= 240)
        return;

    volatile char *writeAddr = VGA_GR_BUFF + x + (y << 6) + (y << 8);
    *writeAddr = 0x2;
}

void plotLineLow(int x0, int y0, int x1, int y1) {
    int dx = x1 - x0;
    int dy = y1 - y0;
    int yi = 1;
    if (dy < 0) {
        yi = -1;
	dy = -dy;
    }

    int D = (dy << 1) - dx;
    int y = y0;

    int x;
    for (x = x0; x <= x1; x++) {
        plot_xy(x, y);

	if (D > 0) {
            y = y + yi;
            D += (dy - dx) << 1;
        }
	else {
            D += dy << 1;
        }
    }
}

void plotLineHigh(int x0, int y0, int x1, int y1) {
    int dx = x1 - x0;
    int dy = y1 - y0;
    int xi = 1;
    if (dx < 0) {
        xi = -1;
	dx = -dx;
    }

    int D = (dx << 1) - dy;
    int x = x0;

    int y;
    for (y = y0; y <= y1; y++) {
        plot_xy(x, y);

	if (D > 0) {
            x = x + xi;
            D += (dx - dy) << 1;
        }
	else {
            D += dx << 1;
        }
    }
}

void plotLine(int x0, int y0, int x1, int y1) {
    int yDiff = y1 - y0;
    int xDiff = x1 - x0;

    if (yDiff < 0) {
        yDiff = 0 - yDiff;
    }

    if (yDiff < xDiff) {
        plotLineLow(x0, y0, x1, y1);
    }
    else {
        if (y0 > y1) {
            plotLineHigh(x1, y1, x0, y0);
        }
	else {
            plotLineHigh(x0, y0, x1, y1);
        }
    }
}

__attribute__((section(".text")))
int main() {
    float x_lower = -2.0f;
    float x_upper = 4.0f;
    // 320 X 240
    float x_step = (x_upper - x_lower) * .003125f; // * 1/320
    int x_coord_step = 1;

    float y_lower = -10.0f;
    float y_upper = 25.0f;

    float x = x_lower;
    float y;
    float last_y;

    float span_inv = 1 / (y_upper - y_lower);
    float y_multiplier = span_inv * 239.0f;

    // parse eqs;
    Queue parsedEq;
    structureQueue_Queue(&parsedEq);
    Queue eqPolishNot;
    structureQueue_Queue(&eqPolishNot);
    //char* eq = "x-x*x*x/6+x*x*x*x*x/120";
    char* eq = "x-x*x*x/6+x*x*x*x*x/120-x*x*x*x*x*x*x/5040+x*x*x*x*x*x*x*x*x/362880";
    //int i;
    //for (i = 0; i < 4; i++) {
        parse_equation(eq, &parsedEq);
        //to_reverse_polish_notation(&parsedEq, &eqPolishNot);

        //eq += 80; // eq offset
    //}

    // axis
    if (x_lower <= 0 && x_upper >= 0) {
        plot_y_axis(x_lower, x_upper);
    }
    if (y_lower <= 0 && y_upper >= 0) {
        plot_x_axis(y_lower, y_upper);
    }

    // graph lines
    int err = 0;
    int last_x_coord = 0;
    y = solveEquation(&parsedEq, x, &err);
    last_y = y;
    int last_y_coord = 239 - (int)((y - y_lower) * y_multiplier);
    int x_coord = x_coord_step;
    int y_coord = last_y_coord;
    x += x_step;

    while (last_x_coord < 319) {
        y = solveEquation(&parsedEq, x, &err);
        y_coord = 239 - (int)((y - y_lower) * y_multiplier);

        if (err == 0 && ((last_y >= y_lower && last_y <= y_upper) || (y >= y_lower && y <= y_upper))) {
            plotLine(last_x_coord, last_y_coord, x_coord, y_coord);
        }


        last_x_coord = x_coord;
        last_y_coord = y_coord;
        last_y = y;
        x += x_step;
        x_coord += x_coord_step;
    }

    return 0;
}
