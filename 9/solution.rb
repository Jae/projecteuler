(0..1000).each do |a|
  (a+1..1000).each do |b|
    c = 1000 - a - b
    p [a,b,c, a*b*c] if a ** 2 + b ** 2 == c ** 2 and b < c
  end
end