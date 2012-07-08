def sum_of_multiple_of(factor, limit)
  freq = (limit - 1) / factor
  factor * freq * (freq + 1) / 2
end

p sum_of_multiple_of(3,1000) + sum_of_multiple_of(5,1000) - sum_of_multiple_of(15,1000)