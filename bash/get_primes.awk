BEGIN {
    count = 0
    n = 0 
    sum = 0
}


function is_odd(num) {
    return(num % 2)
}

function isqrt(num) {
    result = 0
    x = 0
    for (x = 2; x < num; x++) {
        if ((x * x) >= num) {
            break
        }
    }

    if ((x * x) == num) {
        result = x
    } else {
        result = x - 1
    }

    return( result )
}


function is_prime(num) {
    result = 0
    denom = 0
    limit = 0

    if ((num == 2) || (num == 3 )) {
        result = 1
    } else {
        if (is_odd(num) > 0) {
            limit = isqrt(num)
            for (denom = 2; denom <= limit; denom++) {
                if ((num % denom) == 0) {
                    break
                }
            }

            if (denom > limit) {
                result = 1
            }
        }
    }

    return result
}


$1 > 0 {
    printf "%d is odd: %d\n", $1, is_odd($1)
    printf "isqrt(%d) = %d\n", $1, isqrt($1)
    printf "%d is prime: %d\n\n", $1, is_prime($1)
}

END {

}