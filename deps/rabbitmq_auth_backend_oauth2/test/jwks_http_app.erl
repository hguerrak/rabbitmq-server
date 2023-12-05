-module(jwks_http_app).

-export([start/3, stop/0]).

start(Port, CertsDir, Mounts) ->
    Endpoints = [ {Mount, jwks_http_handler, [{keys, Keys}]} || {Mount,Keys} <- Mounts ] ++
      [{"/.well-known/openid-configuration", openid_http_handler, []}],
    Dispatch = cowboy_router:compile([{'_', Endpoints}]),
    {ok, _} = cowboy:start_tls(jwks_http_listener,
                      [{port, Port},
                       {certfile, filename:join([CertsDir, "server", "cert.pem"])},
                       {keyfile, filename:join([CertsDir, "server", "key.pem"])}],
                      #{env => #{dispatch => Dispatch}}),
    ok.

stop() ->
    ok = cowboy:stop_listener(jwks_http_listener).
