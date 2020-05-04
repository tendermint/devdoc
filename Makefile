all: docker_build

devdoc_build:
	docker build -t "devdoc" -f Dockerfile .
	@echo "If you need to log in, just do:"
	@echo "docker login --username=yourhubusername --email=youremail@company.com"
	#docker push tendermint/devdoc

devdoc_build_develop:
	docker build -t "devdoc" -f Dockerfile.develop .

.PHONY: docker_build, docker_push

########################################
### Docker

DEVDOC_SAVE = docker commit `docker ps -a -n 1 -q` devdoc:latest
DEVDOC_HOME = "$(GOPATH)/src/github.com/tendermint/devdoc/home"

devdoc_init:
	docker run -it -v "$(GOPATH):/go" -w "/go/src/github.com/tendermint" "devdoc" echo
	# TODO make this safer
	$(call DEVDOC_SAVE)

devdoc:
	docker run -it -v "$(GOPATH):/go" -v "$(DEVDOC_HOME):/root" -w "/go/src/github.com/tendermint" "devdoc:latest" bash

devdoc_throwaway:
	docker run -it --rm -v "$(GOPATH):/go" -v "$(DEVDOC_HOME):root" -w "/go/src/github.com/tendermint" "devdoc:latest" bash

devdoc_save:
	# TODO make this safer
	$(call DEVDOC_SAVE)

devdoc_test:
	echo $(GOPATH)

devdoc_clean:
	docker rm $$(docker ps --filter "status=exited" -q)
	docker rmi $$(docker images -f "dangling=true" -q)
