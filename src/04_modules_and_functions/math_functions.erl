%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 23. Mar 2017 11:05 AM
%%%-------------------------------------------------------------------
-module(math_functions).
-author("vishal").

%% API
-export([even/1, odd/1, filter/2, split/1, split1/1]).

even(X) when is_integer(X) ->
  X rem 2 =:= 0.

odd(X) when is_integer(X) ->
  X rem 2 =:= 1.

filter(F, L) ->
  [X || X <- L, F(X)].

split(L) ->
  Evens = filter(fun(X) -> even(X) end, L),
  Odds = filter(fun(X) -> odd(X) end, L),
  {Evens, Odds}.

split1(L) ->
  split1(L, [], []).

split1([], Evens, Odds) ->
  {lists:reverse(Evens), lists:reverse(Odds)};
split1([H | T], Evens, Odds) when is_integer(H) ->
  case even(H) of
    true -> split1(T, [H | Evens], Odds);
    false -> split1(T, Evens, [H | Odds])
  end.
