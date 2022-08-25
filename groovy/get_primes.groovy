def primes = [2, 3]
def n_primes_target = Integer.parseInt(args[0])
def n_primes_found = primes.size()

def numerator = 5
def denominator = 2
def limit = 0

while (n_primes_found < n_primes_target) {
    limit = (int) Math.sqrt(numerator)
    for (denominator = 2; denominator <= limit; denominator++) {
        if ((numerator % denominator == 0)) {
            break
        }
    }

    if (denominator > limit) {
        primes.add(numerator)
        n_primes_found = primes.size()
    }
    numerator += 2
}  

print primes
