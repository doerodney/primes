param(
    [int] $RangeStart,
    [int] $RangeEnd
)

function Get-PrimeNumbers
{
    [CmdletBinding()]
    param(
        [int] $RangeStart,
        [int] $RangeEnd
    )

    $prime_list = @()

    [int] $n = $RangeStart
    [int] $d = 2    
    
    for ($n = $RangeStart; $n -le $RangeEnd; $n++) {               
        $notPrime = $true

        for ($d = 2; $d -lt $n; $d++) {
            if (($n % $d) -eq 0) {                                
               break
            }
        }
        
        if ($d -eq $n) { 
            $prime_list += $n
        }
    }

    $prime_list    
}

Get-PrimeNumbers -RangeStart $RangeStart -RangeEnd $RangeEnd

