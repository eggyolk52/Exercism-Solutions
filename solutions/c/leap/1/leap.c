#include "leap.h"

bool leap_year(int n) {
    if (n % 400 == 0) {
        return true;
    } else if (n % 100 == 0) {
        return false;
    } else if (n % 4 == 0) {
        return true;
    } else {
        return false;
    }
}
