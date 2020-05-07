FROM golang:1.14-alpine

# This is where we add tools we want to support in the offical image.
# We will be conservative with what gets added.

# Install common tools
RUN apk add --update --no-cache bash make git curl tmux tmux-docs
RUN apk add --update --no-cache gcc musl-dev g++ linux-headers
RUN apk add --update --no-cache vim openssl

# RUN mkdir -p $WORKDIR $GOPATH/pkg $ $GOPATH/bin $BASE_PATH && ln -sf $WORKDIR $REPO_PATH

########################################
# Cleanup
# Clean cache
RUN rm -rf /var/cache/apk/*
