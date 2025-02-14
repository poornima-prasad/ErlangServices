%%%-------------------------------------------------------------------
%%% @author poornima.prasad
%%% @copyright (C) 2025, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Feb 2025 6:14 am
%%%-------------------------------------------------------------------
-module(rest_app_sup).
-author("poornima.prasad").
-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    SupFlags = #{strategy => one_for_one, intensity => 1, period => 5},
    ChildSpecs = [
        #{id => my_app_worker,
            start => {my_app_worker, start_link, []},
            restart => permanent,
            shutdown => 5000,
            type => worker,
            modules => [my_app_worker]}
    ],
    {ok, {SupFlags, ChildSpecs}}.

