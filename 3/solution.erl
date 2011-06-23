-module (solution).

main([Arg]) ->
  Number = list_to_integer(Arg),
  io:format("largest prime factor of number ~p is ~p ~n", [Number, lists:last(lists:sort(factors(Number)))]).
  
factors(Number) ->
  NotAFactor = fun(X) -> Number rem X /= 0 end,
  Factor = Number div lists:nth(1, lists:dropwhile(NotAFactor, lists:reverse(lists:seq(1,trunc(math:sqrt(Number)))))),
  
  case Number div Factor of
    TheOtherFactor when TheOtherFactor == 1; TheOtherFactor == Number ->
      [Number];
    TheOtherFactor ->
      factors(Factor) ++ factors(TheOtherFactor)
  end.
  
