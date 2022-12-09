# Prime number filter:
using ArgParse
using Dates


# integer sqrt
function isqrt(n)
  result = 0

  for i = 1:n
    if i * i >= n
      result = i
      break
    end
  end

  if result * result > n
    result -= 1
  end

  return result
end


# Tests if a number is odd:
function is_odd(n)
  result = false
  if n % 2 > 0
    result = true
  end

  return result
end


# Tests if a number is prime:
function is_prime(n)
    result = false
    remainder = 0

    if n == 2 || n == 3
      remainder = 1
    else
      if is_odd(n)
        limit = isqrt(n)
        
        for denom = 2:limit
          remainder = n % denom
          if remainder == 0
            break
          end
        end
        
      end
    
    end

    if remainder != 0
      result = true
    end

    return result
end


# Entry point:
function main()
    started = now()
    parsed_args = parse_commandline()
    target_count = parsed_args["count"]
    
    count = 0
    sum::BigInt = 0
    n = 2
    
    while count < target_count
      if is_prime(n)
        # println("$n is prime")
        sum += n
        count += 1
      end
      n += 1
    end
    
    completed = now()
    duration = completed - started
    println("Duration: $duration")
    println("The sum of the first $target_count primes is $sum.")
end


# Parse command line arguments:
function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "--count", "-c"
        help = "the count of prime numbers to find"
        arg_type = Int
        default = 10
    end

    return parse_args(s)
end


function test_isqrt()
  for n = 1:17
    result = isqrt(n)
    println("isqrt($n) is $result")
  end
end  


function test_is_odd()
  for n = 1:17
    result = is_odd(n)
    println("$n is odd: $result")
  end
end  


function test_is_prime()
  for n = 1:17
    result = is_prime(n)
    println("$n is prime: $result")
  end
end  

main()
