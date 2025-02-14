%%%-------------------------------------------------------------------
%%% @author poornima.prasad
%%% @copyright (C) 2025, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Feb 2025 7:18 am
%%%-------------------------------------------------------------------
-module(health_check_handler).
-author("poornima.prasad").
-include("constants.hrl").

%% API
-export([init/2]).

-spec init(Req :: cowboy_req:req(), State :: term()) ->
    {ok, cowboy_req:req(), term()}.
init(Req0, State) ->
    case cowboy_req:method(Req0) of
        <<"GET">> ->
            Content = jiffy:encode(#{<<"Message">>=>"server is up"}),
            Resp = cowboy_req:reply(?HTTP_OK_RESPONSE_CODE, ?DEFAULT_HTTP_JSON_RESPONSE_HEADER, Content, Req0),
            {ok, Resp, State};
        _ ->
            Req2 = cowboy_req:reply(?HTTP_CODE_METHOD_NOT_ALLOWED, Req0),
            {ok, Req2, State}
    end.
