-module (solution).

main([Arg]) ->
  UpperLimit = list_to_integer(Arg),
  Format = "smallest number that can be divided by each of numbers from 1 to ~p is ~p ~n",
  io:format(Format, [UpperLimit, leastCommonMultipleOf(lists:seq(2, UpperLimit), [])]).

leastCommonMultipleOf([], LCM) ->
  lists:foldl(fun({Prime,Power}, Product) -> math:pow(Prime,Power) * Product end, 1, LCM);
leastCommonMultipleOf([Number|Numbers], LCM) ->
  leastCommonMultipleOf(Numbers, leastCommonMultiple(LCM, lists:sort(primeFactors(Number)))).

leastCommonMultiple([{Prime,Power}|RestOfLCM], [Prime|RestOfPrimes]) ->
  {Primes,OtherPrimes} = lists:partition(fun(E) -> E == Prime end, [Prime|RestOfPrimes]),
  case Power < length(Primes) of
    true ->
      [{Prime,length(Primes)}|leastCommonMultiple(RestOfLCM,OtherPrimes)];
    false ->
      [{Prime,Power}|leastCommonMultiple(RestOfLCM,OtherPrimes)]
  end;
leastCommonMultiple([{Prime,Power}|RestOfLCM], [AnotherPrime|RestOfPrimes]) ->
  case Prime < AnotherPrime of
    true ->
      [{Prime,Power}|leastCommonMultiple(RestOfLCM, [AnotherPrime|RestOfPrimes])];
    flase ->
      {AnotherPrimes,OtherPrimes} = lists:partition(fun(E) -> E == AnotherPrime end, [AnotherPrime|RestOfPrimes]),
      [{AnotherPrime,length(AnotherPrimes)},{Prime,Power}|leastCommonMultiple(RestOfLCM,OtherPrimes)]
  end;
leastCommonMultiple([], [Prime|RestOfPrimes]) ->
  {Primes,OtherPrimes} = lists:partition(fun(E) -> E == Prime end, [Prime|RestOfPrimes]),
  [{Prime,length(Primes)}|leastCommonMultiple([],OtherPrimes)];
leastCommonMultiple(RestOfLCM, []) ->
  RestOfLCM.

primeFactors(Number) ->
  NotAFactor = fun(X) -> Number rem X /= 0 end,
  Factor = Number div lists:nth(1, lists:dropwhile(NotAFactor, lists:reverse(lists:seq(1,trunc(math:sqrt(Number)))))),

  case Number div Factor of
    TheOtherFactor when TheOtherFactor == 1; TheOtherFactor == Number ->
      [Number];
    TheOtherFactor ->
      primeFactors(Factor) ++ primeFactors(TheOtherFactor)
  end.