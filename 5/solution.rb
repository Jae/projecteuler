def prime_factors(n)
  factors = {}

  factor = 2
  while factor <= n
    if n % factor == 0
      factors[factor] = 0
      until n % factor != 0
        n /= factor
        factors[factor] += 1
      end
    end
    
    if factor % 2 == 0
      factor += 1
    else
      factor += 2
    end
  end
  
  factors
end

lcd = (2..20).map do |i|
  prime_factors(i)
end.inject({}) do |memo, factors|
  factors.each do |(factor, power)|
    memo[factor] ||= 0
    memo[factor] = power if power > memo[factor]
  end
  memo
end.inject(1) do |memo, (factor, power)|
  memo *= factor ** power
  memo
end

p lcd