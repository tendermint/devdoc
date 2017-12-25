FROM golang:alpine

# This is where we add tools we want to support in the offical image.
# We will be conservative with what gets added.

# Install common tools
RUN apk add --update --no-cache bash make git curl
RUN apk add --update --no-cache gcc musl-dev g++

########################################
# Cleanup
# Clean cache
RUN rm -rf /var/cache/apk/*
