%%%-------------------------------------------------------------------
%%% @author poornima.prasad
%%% @copyright (C) 2025, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Feb 2025 6:13 am
%%%-------------------------------------------------------------------
-module(rest_app).
-author("poornima.prasad").
-behaviour(application).

%% API

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    rest_app_sup:start_link().

stop(_State) ->
    ok.

