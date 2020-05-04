# When you have a minimal configuration with no make or GOPATH,
# you'll want to run this script to start devdoc bash.

GOPATH="$HOME/gopath"
DEVDOC_HOME="$HOME/devdoc/home"

docker run -it -v "$GOPATH:/go" -v "$DEVDOC_HOME:/root" "devdoc:latest" bash
