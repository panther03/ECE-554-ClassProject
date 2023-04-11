get_output();

int main() {
    float x_lower;
    float x_upper;
    // 320 X 240
    float x_step = (x_upper - x_lower) * .003125f; // * 1/320

    float y_lower;
    float y_upper;

    float x = x_lower;
    float y;



    while (x < x_upper) {
        y = get_output(x, /*equation*/);

	if (y >= y_lower && y <= y_upper) {
            plot_xy(x, y);
        }

	x += x_step;
    }


    return 0;
}
