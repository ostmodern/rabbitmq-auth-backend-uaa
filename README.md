To build it run `make`. Cleanup with `make clean`.

Generates a bunch of `.ez` files which you can place in the
`/usr/lib/rabbitmq/lib/rabbitmq_server-3.7.3/plugins/` directory of your server.
Requires RabbitMQ 3.7. Enable with `rabbitmq-plugins enable
rabbitmq_auth_backend_uaa`.

Place this in `/etc/rabbitmq/rabbitmq.config`:

```erlang
[{rabbit,
    [{auth_backends, [rabbit_auth_backend_uaa]}]},
 {rabbitmq_auth_backend_uaa,
    [{resource_server_id, <<"rabbitmq">>}]},
 {uaa_jwt, [
  {default_key, <<"jwt-key">>},
  {signing_keys,
    #{
        <<"jwt-key">> =>
            {map,
                #{<<"kty">> => <<"MAC">>,
                  <<"value">> => <<"secret">>,
                  <<"alg">> => <<"HS256">>}
            }
    }
  }]
}].
```
