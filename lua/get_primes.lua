function is_odd(n)
  odd = false
  i = math.floor(n)
  rem = math.fmod(n,2)
  if rem > 0 then
     odd = true
  end
  
  return odd
end

for n = 3, 6 do
  odd = is_odd(n)
  print(string.format("%d is odd %s", n, odd))
end

 
