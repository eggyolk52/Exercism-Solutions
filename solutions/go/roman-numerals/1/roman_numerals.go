package romannumerals

import (
	"errors"
	"strings"
)

func ToRomanNumeral(input int) (string, error) {
	var result string

	if input < 1 || input > 3999 {
		return "", errors.New("Number is out of range")
	}
	for input > 0 {
		switch {
		case input >= 1000:
			result += "M"
			input -= 1000
		case input >= 500:
			result += "D"
			input -= 500
		case input >= 100:
			result += "C"
			input -= 100
		case input >= 50:
			result += "L"
			input -= 50
		case input >= 10:
			result += "X"
			input -= 10
		case input >= 5:
			result += "V"
			input -= 5
		case input >= 1:
			result += "I"
			input -= 1
		}
	}
	result = strings.Replace(result, "DCCCC", "CM", 1)
	result = strings.Replace(result, "CCCC", "CD", 1)
	result = strings.Replace(result, "LXXXX", "XC", 1)
	result = strings.Replace(result, "XXXX", "XL", 1)
	result = strings.Replace(result, "VIIII", "IX", 1)
	result = strings.Replace(result, "IIII", "IV", 1)
	return result, nil
}
