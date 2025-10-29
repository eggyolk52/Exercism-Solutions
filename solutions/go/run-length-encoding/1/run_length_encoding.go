package encode

import (
	"strconv"
	"strings"
	"unicode"
)

func RunLengthEncode(input string) string {
	if input == "" {
		return ""
	}

	var result strings.Builder
	runes := []rune(input) // Convert to rune slice once
	current := runes[0]
	count := 1
	writeResult := func(count int, current rune) {
		if count > 1 {
			result.WriteString(strconv.Itoa(count))
		}
		result.WriteRune(current)
	}

	for _, r := range runes[1:] {
		if r == current {
			count++
		} else {
			writeResult(count, current)
			current = r
			count = 1
		}
	}
	writeResult(count, current)
	return result.String()
}

func RunLengthDecode(input string) string {
	var result strings.Builder
	var digits strings.Builder

	for _, r := range input {
		if unicode.IsDigit(r) {
			digits.WriteRune(r)
			continue
		}

		count := 1
		if digits.Len() > 0 {
			count, _ = strconv.Atoi(digits.String())
		}
		for i := 0; i < count; i++ {
			result.WriteRune(r)
		}
		digits.Reset()
	}
	return result.String()
}
