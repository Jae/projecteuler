-module (solution).
-export ([sum/1]).

sum(Max) ->
  List = [X|| X <- lists:seq(1, Max-1), (X rem 3 == 0) or (X rem 5 == 0)],
  lists:sum(List).
  
