package hamming

import "fmt"

func Distance(a, b string) (int, error) {
	differences := 0

	if len(a) != len(b) {
		return 0, fmt.Errorf("Strands are not the same length.")
	}

	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			differences++
		}
	}

	return differences, nil
}
