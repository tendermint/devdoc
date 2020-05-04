When you first get a bare machine with git, build essentials, and docker, run:
```bash
git clone https://github.com/tendermint/devdoc.git 
cd devdoc
```

If you have make:
```bash
make docker_build
make docker_init
make docker
```

Else if you don't have make:
```bash
docker build -t "devdoc" -f Dockerfile .
docker run -it "devdoc" echo
docker commit `docker ps -a -n 1 -q` devdoc:latest
./docker_bash.sh
```

This will get you a bare development environment.
Modify `Makefile` or `docker_bash.sh` file appropriately.
