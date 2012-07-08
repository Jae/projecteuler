def palindromic?(product)
  product.to_s == product.to_s.reverse
end

def largest_palindrome(max)
  (0..max).each do |step|
    (0..step).map do |i|
      (max-i) * (max+i-step)
    end.sort.each do |product|
      return product if palindromic?(product)
    end
  end
end

p largest_palindrome(999)