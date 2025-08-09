#include <stdlib.h>
#include "allergies.h"

// This implementation excludes bit-shifting due to a lack of
// knowledge on my part.

bool is_allergic_to(allergen_t allergen, int score) {
  allergen_list_t list = get_allergens(score);
  return list.allergens[allergen];
}

allergen_list_t get_allergens(int score) {
  int len = 0;
  int *arr;

  if (score == 0) {
    arr = calloc(len, sizeof(int));
  } else {
    int temp = 1;

    while (temp <= score) {
      temp *= 2;
      len += 1;
    }

    arr = calloc(len+1, sizeof(int));
    for (int i = len-1; i >= 0; i--) {
      temp /= 2;
      if (temp <= score) {
        arr[i] = 1;
        score -= temp;
      } else {
        arr[i] = 0;
      }

      if (score == 0) break;
    }
  }

  allergen_list_t list;
  list.count = 0;
  if (len > ALLERGEN_COUNT) len = ALLERGEN_COUNT;
  for (int i = 0; i < len; i++) {
    if (i > ALLERGEN_COUNT) break;
    if (arr[i] == 1) list.count++;
    list.allergens[i] = arr[i];
  }
  free(arr);

  return list;
}
