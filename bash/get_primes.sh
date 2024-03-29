#!/bin/bash

# bash settings:
set -o errexit  # Fail on error
set -o pipefail # Fail when any part of a pipeline fails
set -o nounset  # Fail when an undefined variable is used
#set -o xtrace  # Print commands before execution

# Global variables:
N=${1:-10}


function isqrt() {
  local n=${1:-0}
  local x
  local xsq=0
  local result=0

  for x in $(seq 1 "$n")
  do
    xsq=$(( x * x ))
    if test "$xsq" -ge "$n"
    then
      break
    fi
  done

  if test "$xsq" -eq "$n"
  then
    result="$x"
  else
    result=$(( x - 1 ))
  fi

  echo "$result"
}


function is_odd() {
  # Determine if n is an odd number:
  local n=${1:-0}
  local remainder=$(( n % 2 ))
  
  echo "$remainder"
}


function is_prime() {
  # Determine n is a prime number:
  local denom
  local limit
  local n
  local remainder
  local result

  n=${1:-0}
  limit=$(isqrt "$n")
  denom=0
  remainder=0
  result=0

  if test "$n" -eq 2 -o "$n" -eq 3 
  then
    remainder=1  # Faked result...
  else
    # Only odd numbers > 2 can be prime:
    if test "$(is_odd "$n")" -ne 0
    then
      for denom in $(seq 2 "$limit")
      do
        remainder=$(( n % denom ))
        if test "$remainder" -eq 0
        then
          break
        fi
      done

      # We arrived at the end of the loop:
      # if remainder is 0 then the number is not prime
    fi
  fi

  if test "$remainder" -eq 0
  then
    result=0
  else
    result=1
  fi

  echo "$result"
}


#-main-------------------------------------------------------------------------

out=/tmp/primes.txt
if test -d "out"
then
  rm "$out"
fi

x=1
count=0
sum=0

echo "Getting first $N prime numbers."
start="$SECONDS"

while [ "$count" -lt "$N" ]
do
  if test "$(is_prime "$x")" -ne 0
  then
    count=$(( count + 1 ))
    # echo "$x"
    sum=$((sum + x))
  fi
  x=$(( x + 1 ))
done

# awk 'BEGIN { sum = 0 } {sum += $1} END {print "Sum: " sum}' "$out"

finish="$SECONDS"
echo "Sum = $sum of first $N prime numbers."
duration=$(( finish - start ))
echo "Duration: $duration [seconds] (in bash)"
