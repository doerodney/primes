
function is_prime(n)
  print(string.format("n = %d", n))
  result = false

  limit = math.floor(math.sqrt(n))
  print(string.format("limit = %d", limit))

  numerator = n
  denominator = 2
  remainder = 0

  for denominator = 2, limit do
    remainder = math.fmod(numerator, denominator)
    print(string.format("numerator, denominator, remainder: %d, %d, %d", numerator, denominator, remainder))
    if remainder < 1 then
      print(string.format("break - %d is not prime", n))
      print(string.format("modulo of %d,%d is %d", n, denominator, remainder))
      break
    end
  end

  --Arrived here by one of two ways:
  --If by break then numerator, then remainder is 0, and n is not a prime.  
  -- result is already false.
  --if remainder > 0, then the number is prime (fear floating point mischief)
  if remainder > 0 then
    result = true
  end

  return result
end

--main-----------------------------------------------------------------------
-- Get target count of primes argument:
nprimes_target = tonumber(arg[1])
-- print(string.format("nprimes_target = %d", nprimes_target))

--Define early primes:
primes = {2, 3}
nprimes_found = #primes

for i = 15, 20 do
  result = is_prime(i)
  print(string.format("%d is prime: %s", i, result))
end
--[[
n = 5
while nprimes_found < nprimes_target do
  prime = is_prime(n) 
  if prime then 
    table.insert(primes, n)
    nprimes_found = nprimes_found + 1
  end
  
  n = n + 2
end
]]

--Print the primes:
--print(#primes)
--[[
for i = 1, #primes do
  n = primes[i]
  print(n)
end
]]