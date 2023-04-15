const int VGA_GR_BUFF = 0xfffeD400;

/*void plot_x_axis(float lower, float upper) {

}

void plot_y_axis(float lower, float upper) {

}

float get_output(float input, Queue *eq) {

}*/

void plot_xy(int x, int y) {
    int *writeAddr = VGA_GR_BUFF + x + (320 * y);
    *writeAddr = 0x2;
}

__attribute__((section(".text")))
int main() {
    /*float x_lower;
    float x_upper;
    // 320 X 240
    float x_step = (x_upper - x_lower) * .003125f; // * 1/320

    float y_lower;
    float y_upper;

    float x = x_lower;
    float y;

    // parse eqs;
    Queue* parsedEq;
    Queue* eqPolishNot[4];
    char* eq;
    int i;
    for (i = 0; i < 4; i++) {
        parse_equation(eq, parsedEq);
        to_reverse_polish_notation(parsedEq, eqPolishNot[i]);

        eq += 80; // eq offset
    }
    

    // axis
    if (x_lower <= 0 && x_upper >= 0) {
        plot_x_axis(x_lower, x_upper);
    }
    if (y_lower <= 0 && y_upper >= 0) {
        plot_y_axis(y_lower, y_upper);
    }

    // graph lines
    while (x < x_upper) {
        y = get_output(x, eqPolishNot[0]);

	if (y >= y_lower && y <= y_upper) {
            plot_xy(x, y);
        }

	x += x_step;
    }*/
    int x = 0;
    int y = 0;

    int i;
    int j;
    for (i = 0; i < 240; i++) {
        plot_xy(i, i);
    }

    return 0;
}
