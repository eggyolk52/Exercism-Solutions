package pangram

import (
	"strings"
)

func IsPangram(input string) bool {
	charMap := map[rune]bool{}
	alph := "abcdefghijklmnopqrstuvwxyz"

	for _, char := range strings.ToLower(input) {
		if char >= 'a' && char <= 'z' {
			charMap[char] = true
		}
	}

	for _, char := range alph {
		if !charMap[char] {
			return false
		}
	}

	return true
}
