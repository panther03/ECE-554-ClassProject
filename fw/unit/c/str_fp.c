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
    
    while (*str != '\0') {
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

            while (*str != '\0') {
                expLength++;
		str++;
            }
	    *exponentLength = expLength;

            while (*exp != '\0') {
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
    for (i = 0; i <= length + 1 && *(str + i) != '\0'; i++) {
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

int main() {
    float x;
    int err;

    char *fp = "-2.4534e-12";
    x = str_to_fp(fp, &err);
    

    fp = "2.4534e12";
    x = str_to_fp(fp, &err);
       
    fp = "7463.82201";
    x = str_to_fp(fp, &err);
    
    fp = ".004534794";
    x = str_to_fp(fp, &err);
    
    fp = ".004c34794";
    x = str_to_fp(fp, &err);
        
    fp = "-x.0034794";
    x = str_to_fp(fp, &err);
        
    fp = "05794e";
    x = str_to_fp(fp, &err);
    
    fp = "4.794e-7c8";
    x = str_to_fp(fp, &err);
    
    fp = "453-4794";
    x = str_to_fp(fp, &err);
    return 0;
}
