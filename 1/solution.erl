-module (solution).

main([Max]) ->
  UpperLimit = list_to_integer(Max),
  io:format("sum of product of 3 or 5 below ~p is ~p ~n", [UpperLimit, sum(UpperLimit)]).

sum(UpperLimit) ->
  lists:sum([X|| X <- lists:seq(1, UpperLimit-1), (X rem 3 == 0) or (X rem 5 == 0)]).