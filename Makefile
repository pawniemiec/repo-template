.PHONY: help build run start test stop clear deploy bash

DOCKER_NAME=<name>
DOCKER_VER=0.0.1
DCR_HOST=localhost
DCR_PORT=5000
ENV_FILE = $(PWD)/.env

ifneq ("$(wildcard $(ENV_FILE))", "")
	include $(ENV_FILE)
	export $(shell sed 's/=.*//' $(ENV_FILE))
endif

help: ##  shows all available targets
	@echo ""
	@echo "${DOCKER_NAME}"
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\)\:.*##/\1:/'
	@echo ""

build: ## builds/downloads ${DOCKER_NAME} docker image
	@docker build -t ${DOCKER_NAME}:${DOCKER_VER} .

run: ##   runs docker image in foreground
	@docker-compose up

start: ## starts docker image in background
	@docker-compose up -d

test: ##  run tests
	@tests/test.sh

stop: ##  stops ${DOCKER_NAME}
	@docker-compose stop

clear: ## stops ${DOCKER_NAME} and removes all projects
	@docker-compose down

deploy: ## deploys image to container registry
	@docker tag ${DOCKER_NAME}:${DOCKER_VER} ${DCR_HOST}:${DCR_PORT}/${DOCKER_NAME}
	@docker push ${DCR_HOST}:${DCR_PORT}/${DOCKER_NAME}

bash: ##  login to container
	@docker exec -u 0 -it `docker-compose ps -q` /usr/bin/env bash
