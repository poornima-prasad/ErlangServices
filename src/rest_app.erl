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

-include("constants.hrl").

%% API

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Routes = get_routes(),
    HttpRestConfig = application:get_env(?APPLICATION_NAME, http_rest, []),
    Port = proplists:get_value(port, HttpRestConfig, ?DEFAULT_HTTP_PORT),
    Dispatch = cowboy_router:compile(Routes),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, Port}],
        #{env => #{dispatch => Dispatch}}
    ),
    rest_app_sup:start_link().

stop(_State) ->
    ok.

get_routes() ->
    [{'_',
        [{"/api/healthcheck",health_check_handler, []}
    ]}]
.
