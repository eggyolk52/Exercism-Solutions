package wordy

import (
	"strconv"
)

const (
	NUMBER = 1
	WORD   = 2
)

func Answer(question string) (int, bool) {
	var numbers, operators []string
	lastElem, currentElem := 0, 0
	noCurrentElem := false
	cursorPos, peekPos := 0, 1
	question = question[7 : len(question)-1]

	for cursorPos < len(question) {
		if isLetter(question[cursorPos]) {
			for peekPos < len(question) && isLetter(question[peekPos]) {
				peekPos++
			}

			if peekPos+3 < len(question) && question[peekPos:peekPos+3] == " by" {
				peekPos += 3
			}

			operators = append(operators, question[cursorPos:peekPos])
			lastElem, currentElem = currentElem, WORD
			noCurrentElem = false

		} else if isDigit(question[cursorPos]) || question[cursorPos] == '-' {
			for peekPos < len(question) && isDigit(question[peekPos]) {
				peekPos++
			}

			numbers = append(numbers, question[cursorPos:peekPos])
			lastElem, currentElem = currentElem, NUMBER
			noCurrentElem = false

		} else {
			noCurrentElem = true
		}

		if !noCurrentElem && lastElem == currentElem {
			return 0, false
		}

		cursorPos = peekPos
		peekPos++
	}

	if len(numbers)-1 != len(operators) {
		return 0, false
	}

	sum, _ := strconv.Atoi(numbers[0])
	num := 0
	for i, v := range operators {
		num, _ = strconv.Atoi(numbers[i+1])

		switch v {
		case "plus":
			sum += num
		case "minus":
			sum -= num
		case "multiplied by":
			sum *= num
		case "divided by":
			sum /= num
		default:
			return 0, false
		}
	}

	return sum, true
}

func isLetter(char byte) bool {
	return char >= 'a' && char <= 'z' || char >= 'A' && char <= 'Z'
}

func isDigit(char byte) bool {
	return char >= '0' && char <= '9'
}
