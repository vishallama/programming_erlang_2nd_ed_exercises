%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 23. Mar 2017 9:26 PM
%%%-------------------------------------------------------------------
-module(my_maps).
-author("vishal").

%% API
-export([count_characters/1]).

count_characters(Str) ->
  count_characters(Str, #{}).

count_characters([H | T], X) ->
  count_characters(T, maps:put(H, maps:get(H, X, 0) + 1, X));
count_characters([], X) ->
  X.
