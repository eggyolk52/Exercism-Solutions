#include <stdbool.h>
#include <ctype.h>
#include <string.h>
#include "bob.h"

bool is_question(char *str)
{
  int len = strlen(str);
  for (size_t i = len - 1; i > 0; i--) {
    if (str[i] == '?') {
      return true;
    } else if (isspace(str[i])) {
      continue;
    }
    return false;
  }
  return false;
}

bool all_upper(char *str)
{
  bool has_letters = false;

  for (size_t i = 0; i < strlen(str); i++) {
    if (islower(str[i])) {
      return false;
    } else if (isalpha(str[i])) {
      has_letters = true;
    }
  }
  if (has_letters) {
    return true;
  } else {
    return false;
  }
}

bool all_whitespace(char *str)
{
  for (size_t i = 0; i < strlen(str); i++) {
    if (!isspace(str[i])) {
      return false;
    }
  }
  return true;
}

char *hey_bob(char *greeting)
{
  if (all_whitespace(greeting)) {
    return "Fine. Be that way!";
  } else if (is_question(greeting) && all_upper(greeting)) {
    return "Calm down, I know what I'm doing!";
  } else if (is_question(greeting)) {
    return "Sure.";
  } else if (all_upper(greeting)) {
    return "Whoa, chill out!";
  } else {
    return "Whatever.";
  }
  return greeting;
}
