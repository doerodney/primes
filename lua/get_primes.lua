function is_prime(n)
  result = false

  limit = math.floor(math.sqrt(n))

  numerator = n
  denominator = 2
  remainder = 0

  for denominator = 2, limit do
    remainder = math.fmod(numerator, denominator)    
    if remainder < 1 then
      break
    end
  end

  --Arrived here by one of two ways:
  --If by break, then remainder is 0, and n is not a prime.  Result is already false.
  --If remainder > 0, then the number is prime.
  if remainder > 0 then
    result = true
  end

  return result
end

--main-----------------------------------------------------------------------
function main()
  --Get target count of primes argument:
  nprimes_target = tonumber(arg[1])

  --Define early primes:
  primes = {2, 3}
  nprimes_found = #primes

  start = os.time()
  n = 5
  while nprimes_found < nprimes_target do
    prime = is_prime(n) 
    if prime then 
      table.insert(primes, n)
      nprimes_found = nprimes_found + 1
    end
  
    n = n + 2
  end

  --Sum the primes:
  sum = 0
  for i = 1, #primes do
    prime = primes[i]
    sum = sum + prime
    --print(prime)
  end

  now = os.time()
  seconds = os.difftime(now, start)
  print(string.format("The sum of the first %d prime numbers is %d", nprimes_target, sum))
  print(string.format("Duration: %d [secs] (in lua)", seconds))
end

main()
