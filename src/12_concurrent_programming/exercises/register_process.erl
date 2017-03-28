-module(register_process).
-export([start/2]).

start(AnAtom, Fun) ->
  spawn(fun() -> register(AnAtom, self()), Fun() end).
