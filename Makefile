build:
	docker build -t uaa-build-env .
	docker run uaa-build-env
	docker cp $(shell docker ps -q -l -f status=exited):/mnt/uaa_jwt-0.1.0.ez ./

clean:
	rm -f uaa_jwt-0.1.0.ez
