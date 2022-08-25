package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
	"time"
)

func main() {
	start := time.Now()
	var targetCount int64
	var primes = make([]int, 0, targetCount)
	primes = append(primes, 2, 3)
	var denominator int
	var limit int
	var numerator int
	var remainder int
	var sum int

	targetCount, _ = strconv.ParseInt(os.Args[1], 10, 32)

	for numerator = 5; int64(len(primes)) < targetCount; numerator += 2 {
		limit = int(math.Sqrt(float64(numerator)))

		for denominator = 2; denominator <= limit; denominator++ {
			remainder = numerator % denominator
			if remainder == 0 {
				break
			}
		}

		if denominator > limit {
			primes = append(primes, numerator)
		}
	}

	end := time.Now()
	elapsed := end.Sub(start)
	for _, value := range primes {
		sum += value
	}
	// fmt.Println(primes)
	fmt.Println("sum = ", sum)
	fmt.Println("Duration:", elapsed, "(in Go)")
}

