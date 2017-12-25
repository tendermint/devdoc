all: docker_build

docker_build:
	docker build -t "tendermint/devdoc" -f Dockerfile .
	@echo "If you need to log in, just do:"
	@echo "docker login --username=yourhubusername --email=youremail@company.com"
	docker push tendermint/devdoc

.PHONY: docker_build, docker_push
