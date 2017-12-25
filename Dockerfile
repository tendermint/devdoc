FROM golang:alpine

# This is where we add tools we want to support in the offical image.
# We will be conservative with what gets added.

# Install common tools
RUN apk add --update bash make git curl

########################################
# Cleanup
# Clean cache
RUN rm -rf /var/cache/apk/*
