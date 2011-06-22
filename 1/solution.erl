-module (solution).
-export ([sum/1]).

main([Max]) ->
  io:format("sum of product of 3 or 5 below ~p is ~p ~n", [Max, sum(list_to_integer(Max))]).

sum(Max) ->
  lists:sum([X|| X <- lists:seq(1, Max-1), (X rem 3 == 0) or (X rem 5 == 0)]).