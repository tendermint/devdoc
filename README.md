# devdoc

```
########################################
### Docker

DEVDOC_SAVE = docker commit `docker ps -a -n 1 -q` devdoc:local

docker_build:
	docker build -t "tendermint/abci-dev" -f Dockerfile.develop .

docker_run:
	docker run -it -v "$(CURDIR):/go/src/github.com/tendermint/abci" -w "/go/src/github.com/tendermint/abci" "tendermint/abci-dev" /bin/bash

docker_run_rm:
	docker run -it --rm -v "$(CURDIR):/go/src/github.com/tendermint/abci" -w "/go/src/github.com/tendermint/abci" "tendermint/abci-dev" /bin/bash

devdoc_init:
	docker run -it -v "$(CURDIR):/go/src/github.com/tendermint/abci" -w "/go/src/github.com/tendermint/abci" tendermint/devdoc echo
	# TODO make this safer
	$(call DEVDOC_SAVE)

devdoc:
	docker run -it -v "$(CURDIR):/go/src/github.com/tendermint/abci" -w "/go/src/github.com/tendermint/abci" devdoc:local bash

devdoc_save:
	# TODO make this safer
	$(call DEVDOC_SAVE)

devdoc_clean:
	docker rmi $$(docker images -f "dangling=true" -q)
```
