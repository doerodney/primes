#!/bin/bash

# bash settings:
#set -e  # Fail on error
#set -o  # Fail when any part of a pipeline fails
#set -u  # Fail when an undefined variable is used
#set -x  # Print commands before execution

# Global variables:


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
  local n=${1:-0}
  local limit=$(isqrt $n)
  local denom=0
  local remainder=0
  local result=0

  if test "$n" -eq 2 -o "$n" -eq 3 
  then
    remainder=1  # Faked result...
  else
    # Only odd numbers > 2 can be prime:
    if test "$(is_odd $n)" -ne 0
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


for x in $(seq 3 2 71)
do
  echo "$x is prime:  $(is_prime $x)"
done


