class PrimeNumberSummer {
    public static void main(String[] args) {
        int nPrimesTarget = Integer.parseInt(args[0]);
        int[] primes = new int[nPrimesTarget];
        int limit = 0;
        int nPrimesFound = 0;
        long sum = 0;  
        int numerator = 5;
        int denominator = 2;
        primes[nPrimesFound++] = 2;
        primes[nPrimesFound++] = 3;
        
        while (nPrimesFound < nPrimesTarget) {
            limit = (int) Math.sqrt(numerator);
            for (denominator = 2; denominator <= limit; denominator++) {
                if ((numerator % denominator) == 0) {
                    break;
                }
            }

            /* Got to here by one of two ways:
             * If by break then numerator is not a prime.
             * If denominator is greater than the limit, then numerator is a prime.
            */
            if (denominator > limit) {
                primes[nPrimesFound++] = numerator;
            }

            numerator += 2;
        }
        
        for (int i = 0; i < nPrimesFound; i++) {
            System.out.println(primes[i]);
        }
    }
}