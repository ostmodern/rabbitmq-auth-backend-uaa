To build it run `make`. Cleanup with `make clean`.

Generates a bunch of `.ez` files which you can place in the
`/usr/lib/rabbitmq/lib/rabbitmq_server-3.7.3/plugins/` directory of your server.
Requires RabbitMQ 3.7. Enable with `rabbitmq-plugins enable
rabbitmq_auth_backend_uaa`.

Place this in `/etc/rabbitmq/rabbitmq.config`:

```erlang
[
  {rabbitmq_auth_backend_uaa, [{resource_server_id, <<"rabbit">>}]},
  %% UAA signing key configuration
  {uaa_jwt, [
    {signing_keys, #{
        <<"a-key-ID">> => {map, #{<<"kty">> => <<"RSA">>,
                                          <<"alg">> => <<"RS256">>,
                                          <<"value">> => <<"-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2dP+vRn+Kj+S/oGd49kq
6+CKNAduCC1raLfTH7B3qjmZYm45yDl+XmgK9CNmHXkho9qvmhdksdzDVsdeDlhK
IdcIWadhqDzdtn1hj/22iUwrhH0bd475hlKcsiZ+oy/sdgGgAzvmmTQmdMqEXqV2
B9q9KFBmo4Ahh/6+d4wM1rH9kxl0RvMAKLe+daoIHIjok8hCO4cKQQEw/ErBe4SF
2cr3wQwCfF1qVu4eAVNVfxfy/uEvG3Q7x005P3TcK+QcYgJxav3lictSi5dyWLgG
QAvkknWitpRK8KVLypEj5WKej6CF8nq30utn15FQg0JkHoqzwiCqqeen8GIPteI7
VwIDAQAB
-----END PUBLIC KEY-----">>}}
        }}
    ]}
].
```
