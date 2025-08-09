#include "difference_of_squares.h"
#include <math.h>

unsigned int square_of_sum(unsigned int number) {
    int result = 0;
    while (number > 0) {
        result += number;
        number--;
    }
    return pow(result, 2);
}

unsigned int sum_of_squares(unsigned int number) {
    int result = 0;
    while (number > 0) {
        result += pow(number, 2);
        number--;
    }
    return result;
}

unsigned int difference_of_squares(unsigned int number) {
    return square_of_sum(number) - sum_of_squares(number);
}
