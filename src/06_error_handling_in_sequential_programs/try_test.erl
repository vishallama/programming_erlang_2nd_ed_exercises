%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 24. Mar 2017 11:35 AM
%%%-------------------------------------------------------------------
-module(try_test).
-author("vishal").

%% API
-export([generate_exception/1, demo1/0]).

generate_exception(1) ->
  a;
generate_exception(2) ->
  throw(a);
generate_exception(3) ->
  exit(a);
generate_exception(4) ->
  {'EXIT', a};
generate_exception(5) ->
  error(a).

demo1() ->
  [catcher(I) || I <- [1, 2, 3, 4, 5]].

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw: X -> {N, caught, thrown, X};
    exit: X -> {N, caught, exited, X};
    error: X -> {N, caught, error, X}
  end.
