#!/usr/bin/perl

use strict;
use Time::HiRes qw(gettimeofday tv_interval);

sub isqrt {
  my $n = shift;
  my $result = 0;
  my $sqrd = 0;

  for (my $i = 1; $i < $n; $i++) {
    $sqrd = $i * $i;
    if ($sqrd >= $n) {
      $result = ($sqrd == $n) ? $i : $i - 1;
      last;
    }
  }

  return $result;
}


sub is_odd {
  my $n = shift;

  my $result = (($n % 2) > 0) ? 1 : 0;

  return $result;
}


sub is_prime {
  my $N = shift;
  my $result = 0;

  # Given S, the integer square root of N, modulo divide N by successive 
  # numbers up to and including S. If the remainder is 0, then N is not prime.
  
  my $remainder = 0;

  if ($N == 2 || $N == 3) {
    $remainder = 1;
  } else {
    if (is_odd $N) {
      my $limit = isqrt $N;

      for (my $denom = 2; $denom <= $limit; $denom++) {
        $remainder = $N % $denom;
        last if ($remainder < 1);
      }
    }
  }

  $result = ($remainder > 0) ? 1 : 0;
  return $result;
}


my @start = gettimeofday();
my @primes = ();
my $nPrimesTarget = $ARGV[0];
my $nPrimesFound = scalar(@primes);
print "Getting first $nPrimesTarget prime numbers.\n";

my $N = 2;
my $limit = 0;
my $result = 0;

while ($nPrimesFound < $nPrimesTarget) {
  
  $result = is_prime($N);

  if ($result > 0) {
    # print "prime: $N\n";
    push(@primes, $N);
    $nPrimesFound = scalar(@primes);
  }

  $N++;
}

my $durationMs = int(1000 * tv_interval(\@start));

my $sum = 0;
my $prime = 0;
foreach $prime (@primes) {
  # print "$prime\n";
  $sum += $prime;
}

print "Sum = $sum of first $nPrimesFound prime numbers.\n";
print "Duration:  $durationMs [ms] (in Perl)\n";

