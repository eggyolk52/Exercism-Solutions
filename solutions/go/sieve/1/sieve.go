package sieve

func Sieve(limit int) []int {
	primes := []int{}
	nonPrimes := map[int]bool{}

	for i := 2; i <= limit; i++ {
		if !nonPrimes[i] {
			primes = append(primes, i)
		}
		for j := 2; j*i <= limit; j++ {
			nonPrimes[j*i] = true
		}
	}

	return primes
}
