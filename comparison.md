# Prime Number Filter Results
This shows results of detection and summing of the first N prime numbers as a function of programming language.  Times are in milliseconds.  Tests were conducted on a MacBook Pro.

| Language/N | 1000 | 10,000 | 100,000 | 200,000 | 300,000 | 400,000 | 500,000 | 1,000,000 |
| ---------- | ---- | ------ | ------- | ------- | ------- | ------- | ------- | --------- |
| C           | 1 <    |  9 | 225 |  613 | 1087 | 1692 | 2347 |  6848 |
| Go              | 0.9 | 31 | 718 | 2074 | 3862 | 5899 | 8524 | 24201 |
| Node/JavaScript | 11 | 23 | 348 | 940  | 1709 | 2674 | 3837 | 10523 |
| Perl | 8 | 253 | 7777 | 22272 | 40964 | 64850 | 88252 | 247868 |
| Python | 15 | 295 | 9865 | 25288 | 55836 | 76922 | 108119 | 307878 |

The interesting part of these results is the comparison between Go and Node. Go was faster for small numbers of primes.  Node, which does a just-in-time compilation to machine code as it executes, was _much_ faster for large numbers.  The fact that C was the fastest suggests that quality has no fear of time.