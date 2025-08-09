package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n < 1 {
		return -1, errors.New("Number is smaller than 1")
	}

	steps := 0
	for n != 1 {
		if n%2 == 0 {
			n /= 2
		} else {
			n *= 3
			n += 1
		}
		steps++
	}
	return steps, nil
}
