#include <stdio.h>
#include <math.h>
#include "armstrong_numbers.h"

bool is_armstrong_number(int candidate)
{
  if (candidate < 10) {
    return true;
  } else if (candidate < 100) {
    return false;
  }

  int len = 0;
  int result = 0;

  for (int temp = candidate; temp > 0; temp /= 10) {
    len++;
  }

  for (int temp = candidate; temp > 0; temp /= 10) {
    int digit = temp % 10;
    result += pow(digit, len);
  }

  return candidate == result ? true : false;
}
