%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 22. Mar 2017 2:45 PM
%%%-------------------------------------------------------------------
-module(geometry).
-author("vishal").

%% API
-export([area/1]).

area({rectangle, Width, Height}) ->
  Width * Height;
area({square, Side}) ->
  Side * Side;
area({circle, Radius}) ->
  math:pi() * Radius * Radius.
