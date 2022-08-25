# Prime number filter:
using ArgParse
using Dates


# Finds all primes between 1 and upper_limit (inclusive)
function find_primes(target_count)
    primes = Vector{BigInt}()
    found = 0
    n = 2  # 1 is not a prime number by definition 
    while found < target_count
        if is_prime(n)
            push!(primes, n)
            found = found + 1
        end
        
        n = n + 1
    end

    return primes
end


# Tests if a number is even:
function is_even(n)
    result = false
    remainder = n % 2
    if remainder == 0
        result = true
    end

    return result
end
    

# Tests if a number is prime:
function is_prime(n)
    result = false
    limit = trunc(Int, sqrt(n))

    if n == 2 || n == 3
        result = true
    elseif is_even(n)
        result = false
    else
        # Starting with 2, increment the denominator:
        denominator = 2
        while denominator <= limit
            remainder = n % denominator
            if remainder == 0
                # No remainder, so not a prime.
                break
            else
                denominator = denominator + 1
            end
        end

        # At this point, if denominator > limit, then n is a prime.
        if denominator > limit
            result = true
        end
    end

    return result
end


# Entry point:
function main()
    started = now()
    parsed_args = parse_commandline()
    target_count = parsed_args["count"]
    primes = find_primes(target_count)
    sum::BigInt = 0
    for p in primes
        sum = sum + p
    end
    completed = now()
    duration = completed - started
    println("Duration: $duration")
    println("The sum of the first $target_count primes is $sum.")
    # println("Primes: $primes")
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

main()