#include <stdlib.h>
#include <string.h>
#include "reverse_string.h"

char *reverse(const char *value)
{
  size_t len = strlen(value);
  char *result = malloc(sizeof(char) * len);

  for (size_t i = 0; i < len; i++) {
    result[i] = value[len-i-1];
  }
  return result;
}
