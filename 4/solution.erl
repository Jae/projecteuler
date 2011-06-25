-module (solution).

main([Arg]) ->
  NumberOfDigit = list_to_integer(Arg),
  Format = "largest palindrome made from the product of two ~p-digit numbers is ~p ~n",
  io:format(Format, [NumberOfDigit, largestPalindromeFromNDigits(NumberOfDigit)]).
  
largestPalindromeFromNDigits(Digit) ->
  MaxNumberOfDigit = trunc(math:pow(10,Digit) - 1),
  Palindromes = [X*Y || X <- lists:seq(1, MaxNumberOfDigit), 
                        Y <- lists:seq(1, MaxNumberOfDigit), 
                        integer_to_list(X*Y) =:= lists:reverse(integer_to_list(X*Y))],
  lists:last(lists:sort(Palindromes)).