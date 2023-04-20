#include "str_fp.h"

int check_end(char c) {
    if (c == '\0')
        return 1;
    if (c == ' ')
        return 1; 
    if (c == '+')
        return 1;
    if (c == '-')
        return 1;
    if (c == '*')
        return 1;
    if (c == '/')
        return 1;
    if (c == '(')
        return 1;
    if (c == ')')
        return 1;
    return 0;
}

float pow_10(int pow) {
    float mult = 1.0f;

    if (pow > 0) {
        while (pow > 0) {
            mult *= 10.0f;
            pow -= 1; 
        }
    }
    if (pow < 0) {
        while (pow < 0) {
            mult /= 10.0f;
            pow += 1; 
        }
    }

    return mult;
}

void decode_str(char* str, int* length, int* decimalIndx, int* sign, int* exponent, int* exponentLength, int* err) {

    if (*str == '-') {
        *sign = -1;
	str++;
    }
    
    while (!check_end(*str)) {
        if (*str == '.') {
            *decimalIndx = *length;
        }
	else if (*str == 'e') {
            int expLength = -1;
	    int expSign = 1;
	    char *exp;

	    str++;

            if (*str == '-') {
                expSign = -1;
                str++;
            }

	    exp = str;

            while (!check_end(*str)) {
                expLength++;
		str++;
            }
	    *exponentLength = expLength;

            while (!check_end(*exp)) {
                if (*exp < '0' || *exp > '9') {
                    *err = 1;
                }

                *exponent += (int)(*exp - '0') * pow_10(expLength);
		expLength--;
                exp++;
            }
	    *exponent *= expSign;
	    return;
	}
        else if (*str < '0' || *str > '9') {
            *err = 1;
        }

	(*length)++;
	str++;
    }
}

float str_to_fp(char* str, int* err) {
    float fp = 0;
    int pow = 0;
    int decimalIndx = -1; //for default
    int length = 0;
    int sign = 1;
    int exponent = 0;
    int exponentLength = 0;

    decode_str(str, &length, &decimalIndx, &sign, &exponent, &exponentLength, err);
    length -= exponentLength;

    if (decimalIndx == -1) {
        pow = length - 1;
    }
    else {
        pow = decimalIndx - 1;
    }

    int i;
    int digit;
    float mult;
    char curr;
    
    if (sign < 0) {
        str++;
    }
    for (i = 0; i <= length + 1 && !check_end(*(str + i)); i++) {
        curr = *(str + i);

        if (curr == '.') {
            continue;
        }
        else if (curr == 'e') {
            fp *= pow_10(exponent);
            break;
        }

	digit = (int)(curr - '0');
	mult = pow_10(pow);
	fp += digit * mult;
	pow--;
    }

    return fp * sign;
}
