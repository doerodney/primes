#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

/*
Compile with gcc -Wall -O3 get_primes.c -o get_primes.exe
*/

int main(int argc, char *argv[]) {
    struct timeval start, end;
    int *pMem = NULL;
    int limit = 0;
    int nPrimesFound = 0;
    unsigned long sum = 0; 
    int microSecs = 0; 
    int numerator = 5;
    int denominator = 2;
    int nPrimesTarget = atoi(argv[1]);
    
    gettimeofday(&start, NULL);
    
    printf("Getting first %d prime numbers\n", nPrimesTarget);
    pMem = (int*) malloc(nPrimesTarget * sizeof(int));
    pMem[nPrimesFound++] = 2;
    pMem[nPrimesFound++] = 3;

    while (nPrimesFound < nPrimesTarget) {
        limit = (int) sqrt(numerator);
        for (denominator = 2; denominator <= limit; denominator++) {
            if ((numerator % denominator) == 0) {
                break;
            }
        }

        /* Got to here by one of two ways:
         * If by break then numerator is not a prime.
         * If denominator is greater that the limit, then numerator is prime.
        */
        if (denominator > limit) {
            pMem[nPrimesFound] = numerator;
            nPrimesFound++;
        }
        
        numerator += 2;
    }

    sum = 0;
    for (int i = 0; i < nPrimesFound; i++) {
        sum += pMem[i];
        /* 
        printf("%d\n", pMem[i]);
        */
    }

    free(pMem); 
    gettimeofday(&end, NULL);

    microSecs = (1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
    printf("Sum = %lu of first %d prime numbers.\n", sum, nPrimesFound);
    printf("Duration:  %d [ms] (in C) \n", microSecs / 1000);
    
    return 0;
}    


