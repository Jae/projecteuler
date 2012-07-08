def largest_prime_factor(n)
  factor = 2
  while factor < n
    until n % factor != 0
      n /= factor
    end
    if factor % 2 == 0
      factor += 1
    else
      factor += 2
    end
  end
  n
end

p largest_prime_factor(600851475143)