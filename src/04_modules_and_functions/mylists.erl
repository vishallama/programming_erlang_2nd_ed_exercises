%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 22. Mar 2017 5:48 PM
%%%-------------------------------------------------------------------
-module(mylists).
-author("vishal").

%% API
-export([sum/1, map/2]).

sum([H | T]) ->
  H + sum(T);
sum([]) ->
  0.

map(_F, []) ->
  [];
map(F, [H | T]) ->
  [F(H) | map(F, T)].
