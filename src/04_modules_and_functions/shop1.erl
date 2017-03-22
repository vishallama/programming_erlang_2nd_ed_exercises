%%%-------------------------------------------------------------------
%%% @author vishal
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Mar 2017 3:50 PM
%%%-------------------------------------------------------------------
-module(shop1).
-author("vishal").

%% API
-export([total/1]).

total([{What, N} | T]) ->
  shop:cost(What) * N + total(T);
total([]) ->
  0.
