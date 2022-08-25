"use strict";
const process = require('process');

const start = new Date();
const primes = [];
const nPrimesTarget = parseInt(process.argv[2]);
console.log(`Getting first ${nPrimesTarget} prime numbers.`);
let nPrimesFound = primes.length;

let numerator = 2;
let denominator = 2;
let limit = 0;

while (nPrimesFound < nPrimesTarget) {
  limit = Math.sqrt(numerator); 
  for (denominator = 2; denominator <= limit; denominator++) {
    if ((numerator % denominator) == 0) {
      break;
    }
  }

  // Got to here by one of two ways.
  // If here by break, then numerator is not a prime.
  // If denominator equals the numerator, then numerator is a prime.
  if (denominator > limit) {
    primes.push(numerator);
    nPrimesFound = primes.length;
  }

  numerator++;  
}

const end = new Date();
const durationMs = end - start;


let sum = 0;
let prime = 0;
primes.forEach((prime) => {
  sum += prime;
  // console.log(prime);
});

console.log(`Sum = ${sum} of first ${nPrimesFound} prime numbers.`);
console.log(`Duration: ${durationMs} [ms] (in Node)`); 

