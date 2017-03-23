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
-export([area/1, perimeter/1]).

area({rectangle, Width, Height}) ->
  Width * Height;
area({square, Side}) ->
  Side * Side;
area({circle, Radius}) ->
  math:pi() * Radius * Radius;
area({right_triangle, Base, Height}) ->
  Base * Height / 2.

perimeter({rectangle, Width, Height}) ->
  2 * (Width + Height);
perimeter({square, Side}) ->
  4 * Side;
perimeter({circle, Radius}) ->
  2 * math:pi() * Radius;
perimeter({right_triangle, Base, Height}) ->
  Hypot = math:sqrt(Base * Base + Height * Height),
  Base + Height + Hypot.
