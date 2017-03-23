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
-export([even/1, odd/1, filter/2]).

even(X) when is_integer(X) ->
  X rem 2 =:= 0.

odd(X) when is_integer(X) ->
  X rem 2 =:= 1.

filter(F, L) ->
  [X || X <- L, F(X)].
