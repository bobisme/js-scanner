build:
	docker build . -t bobisme/js-scanner

push:
	docker push bobisme/js-scanner:latest
