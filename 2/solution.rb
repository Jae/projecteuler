fib_n_1 = 0
fib_n_2 = 1
sum_of_even_fib = 0
while fib_n_1 + fib_n_2 < 4000000
  sum_of_even_fib += fib_n_1 + fib_n_2 if (fib_n_1 + fib_n_2) % 2 == 0
  fib_n_1, fib_n_2 = fib_n_2, fib_n_1 + fib_n_2
end
p sum_of_even_fib