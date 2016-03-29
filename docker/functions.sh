#!/bin/bash

d_cleanup() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

d_unset() {
	unset DOCKER_TLS_VERIFY
	unset DOCKER_CERT_PATH
	unset DOCKER_MACHINE_NAME
	unset DOCKER_HOST
}
