build:
	docker build -t uaa-build-env .
	docker run uaa-build-env
	docker cp $(shell docker ps -q -l -f status=exited):/var/build/rabbitmq-auth-backend-uaa/plugins/rabbitmq_auth_backend_uaa-1b1ddd3.ez ./
	docker cp $(shell docker ps -q -l -f status=exited):/var/build/rabbitmq-auth-backend-uaa/plugins/uaa_jwt-0.1.0.ez ./
	docker cp $(shell docker ps -q -l -f status=exited):/var/build/rabbitmq-auth-backend-uaa/plugins/elixir-1.6.1.ez ./
	docker cp $(shell docker ps -q -l -f status=exited):/var/build/rabbitmq-auth-backend-uaa/plugins/jose-1.8.4.ez ./
	docker cp $(shell docker ps -q -l -f status=exited):/var/build/rabbitmq-auth-backend-uaa/plugins/base64url-0.0.1.ez ./

clean:
	rm -f *.ez
