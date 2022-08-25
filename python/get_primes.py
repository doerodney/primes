import math
import sys
import time

start = time.time()
primes = []
n_primes_target = int(sys.argv[1])
n_primes_found = len(primes)

numerator = 2
denominator = 2
limit = 0

print(f'primes_target = {n_primes_target}')

while n_primes_found < n_primes_target:
    limit = int(math.sqrt(numerator))
    for denominator in range(2, (limit + 2)):
        if (numerator % denominator) == 0:
            break

    # Got to here by one of two ways.
    # If here by break, then numerator is not a prime.
    # If denominator exceeds square root of numerator, 
    # then numerator is a prime.
    if denominator > limit:
        primes.append(numerator)
        n_primes_found = len(primes)

    numerator += 1

end = time.time()
sum = 0
for prime in primes:
    sum += prime
    # print(prime)

duration = int(1000 * (end - start))
print(f'Sum = {sum} of first {n_primes_found} prime numbers.')
print(f'Duration: {duration} [ms] (in Python)') 
