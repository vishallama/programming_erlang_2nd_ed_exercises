%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 22. Mar 2017 10:50 PM
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("vishal").

%% API
-export([for/3]).

for(Max, Max, F) ->
  [F(Max)];
for(I, Max, F) when I < Max ->
  [F(I) | for(I + 1, Max, F)].
