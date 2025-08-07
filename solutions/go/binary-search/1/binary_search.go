package binarysearch

func SearchInts(list []int, key int) int {
	left := 0
	right := len(list) - 1
	var middle, guess int

	for left <= right {
		middle = int((left + right) / 2)
		guess = list[middle]

		if guess == key {
			return middle
		} else if guess < key {
			left = middle + 1
		} else if guess > key {
			right = middle - 1
		}
	}

	return -1
}
