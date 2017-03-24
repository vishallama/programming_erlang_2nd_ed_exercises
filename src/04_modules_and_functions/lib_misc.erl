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
-export([
  for/3, qsort/1, pythag/1, perms/1, odds_and_evens2/1, my_tuple_to_list/1,
  my_time_func/1, my_date_string/0, sqrt/1]).

for(Max, Max, F) ->
  [F(Max)];
for(I, Max, F) when I < Max ->
  [F(I) | for(I + 1, Max, F)].

qsort([]) ->
  [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
  qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
  [ {A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].

perms([]) ->
  [[]];
perms(L) ->
  [[H | T] || H <- L, T <- perms(L -- [H])].

odds_and_evens2(L) ->
  odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H | Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H | Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.

my_tuple_to_list(T) when is_tuple(T) ->
  Len = tuple_size(T),
  my_tuple_to_list(T, Len, []).

my_tuple_to_list(_T, 0, Acc) ->
  Acc;
my_tuple_to_list(T, N, Acc) ->
  my_tuple_to_list(T, N - 1, [element(N, T) | Acc]).

my_time_func(F) ->
  Start = erlang:monotonic_time(),
  Value = F(),
  End = erlang:monotonic_time(),
  {Value, erlang:convert_time_unit(End - Start, native, millisecond)}.

my_date_string() ->
  {Date, Time} = calendar:local_time(),
  {Year, Month, Day} = Date,
  {Hour, Minute, Second} = Time,
  lists:flatten(
    io_lib:format(
      "~4..0w-~2..0w-~2..0w ~2..0w:~2..0w:~2..0w",[Year, Month, Day, Hour, Minute, Second]
    )
  ).

sqrt(X) when X < 0 ->
  error({squareRootNegativeArgument, X});
sqrt(X) ->
  math:sqrt(X).
