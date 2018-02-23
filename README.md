To build it run `make`. Cleanup with `make clean`.

Generates a bunch of `.ez` files which you can place in the
`/usr/lib/rabbitmq/lib/rabbitmq_server-3.7.3/plugins/` directory of your server.
Requires RabbitMQ 3.7. Enable with `rabbitmq-plugins enable
rabbitmq_auth_backend_uaa`.
