-define(APPLICATION_NAME, rest_app).

%%% HTTP Status codes
-define(HTTP_CODE_METHOD_NOT_ALLOWED, 405).
-define(HTTP_OK_RESPONSE_CODE, 200).

%%% REST RESPONSE
-define(DEFAULT_HTTP_JSON_RESPONSE_HEADER, #{<<"content-type">> => <<"application/json; charset=utf-8">>,
    <<"connection">> => <<"keep-alive">>}).
-define(DEFAULT_HTTP_PORT,8001).