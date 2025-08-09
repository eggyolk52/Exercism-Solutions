#include "collatz_conjecture.h"
#include <complex.h>
#include <stdio.h>

// void main() {
//     steps(1000000);
// }

int steps(int n) {
    int steps = 0;

    if (n < 1) {
        return -1;
    };
    while (n > 1) {
        if (n % 2 == 0) {
            n /= 2;
        } else {
            n *= 3;
            n++;
        }
        steps++;
    }
    return steps;
}
