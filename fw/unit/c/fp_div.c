__attribute__((section(".text")))
int main() {
    float x;
    float y;
    float out;

    x = 1.0f;
    y = 2.0f;
    out = x/y;

    x = 2.0f;
    y = 3.0f;
    out = x/y;

    x = 435.56f;
    y = -10.0f;
    out = x/y;

    x = 1e10f;
    y = 32.45f;
    out = x/y;

    x = 32.45f;
    y = 1e-4f;
    out = x/y;

    x = 32.45f;
    y = 1e11f;
    out = x/y;

    x = -3.5279e10f;
    y = 3.5621e10f;
    out = x/y;

    x = 2.41678e-10;
    y = 1e10;
    out = x/y;

    x = 32.5e14f;
    y = 1e-8f;
    out = x/y;

    x = 1e-20f;
    y = 3.141e20f;
    out = x/y;

    x = 2.54334e34f;
    y = 1e32f;
    out = x/y;

    x = 2.54334e34f;
    y = 1e16f;
    out = x/y;

    x = 2.54334e34f;
    y = 1e8f;
    out = x/y;
 
    x = 2.54334e34f;
    y = 1e4f;
    out = x/y;   

    x = 2.54334e34f;
    y = 1e2f;
    out = x/y;
}

