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
-export([count_characters/1, map_search_pred/2]).

count_characters(Str) ->
  count_characters(Str, #{}).

count_characters([H | T], X) ->
  count_characters(T, maps:put(H, maps:get(H, X, 0) + 1, X));
count_characters([], X) ->
  X.

map_search_pred(Map, Pred) ->
  map_search_pred(Map, Pred, maps:keys(Map)).

map_search_pred(_Map, _Pred, []) ->
  error("no match");
map_search_pred(Map, Pred, [Key | T]) ->
  Value = maps:get(Key, Map),
  case Pred(Key, Value) of
    true -> {Key, Value};
    false -> map_search_pred(Map, Pred, T)
  end.
