DOCKER_USER  := minotaur
APP 				 := node-test
TAG					 := $(shell git rev-parse --short HEAD)
IMAGE 			 := ${DOCKER_USER}/${APP}:${TAG}
PORT  			 := 5000
CONTAINER_ID := $(shell docker ps --filter name=${APP} -aq)

restart: stop pull run

stop:
	@if [ ${CONTAINER_ID} ]; then \
		docker rm -f ${CONTAINER_ID}; \
	fi

pull:
	docker pull ${IMAGE}

run:
	docker run -e PORT:${PORT} -d -p ${PORT}:${PORT} --name ${APP} ${IMAGE}

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}

.PHONY: build run all stop pull restart