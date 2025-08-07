package rotationalcipher

import (
	"strings"
	"unicode"
)

var alphaLower = "abcdefghijklmnopqrstuvwxyz"
var alphaUpper = strings.ToUpper(alphaLower)

func RotationalCipher(plain string, shiftKey int) string {
	var alpha string
	var result string

	for _, char := range plain {
		if !unicode.IsLetter(char) {
			result += string(char)
			continue
		}
		if unicode.IsLower(char) {
			alpha = alphaLower
		} else {
			alpha = alphaUpper
		}

		index := strings.Index(alpha, string(char))
		index += shiftKey
		index %= len(alpha) // Wrap index if longer than alpha
		result += string(alpha[index])
	}
	return result
}
