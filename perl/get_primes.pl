use strict;
use Time::HiRes qw(gettimeofday tv_interval);

my @start = gettimeofday();
my @primes = ();
my $nPrimesTarget = $ARGV[0];
my $nPrimesFound = scalar(@primes);
print "Getting first $nPrimesTarget prime numbers.\n";

my $numerator = 2;
my $denominator = 2;
my $limit = 0;

while ($nPrimesFound < $nPrimesTarget) {
  $limit = sqrt($numerator);

  for ($denominator = 2; $denominator <= $limit; $denominator++) {
    last if (($numerator % $denominator) == 0);
  }

  # Got to here one of two ways.
  # If here by break, then numerator is not a prime.
  # If the denominator equals the numerator, then numerator is a prime.
  if ($denominator > $limit) {
    push(@primes, $numerator);
    $nPrimesFound = scalar(@primes);
  }

  $numerator++;
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

