%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 22. Mar 2017 3:39 PM
%%%-------------------------------------------------------------------
-module(shop).
-author("vishal").

%% API
-export([cost/1]).

cost(oranges) ->
  5;
cost(newspaper) ->
  8;
cost(apples) ->
  2;
cost(pears) ->
  9;
cost(milk) ->
  7.
