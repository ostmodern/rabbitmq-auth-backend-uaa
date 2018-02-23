#!/bin/bash -ex

git clone https://github.com/rabbitmq/rabbitmq-auth-backend-uaa --depth=1
cd rabbitmq-auth-backend-uaa
mix local.rebar --force
make dist
