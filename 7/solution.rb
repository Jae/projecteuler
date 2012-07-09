primes = []
potential_prime = 1
until primes.length == 10001
  potential_prime += 1
  primes << potential_prime unless primes.any? {|prime| potential_prime % prime == 0}
end
p primes.last