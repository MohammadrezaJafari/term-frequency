# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:latest

LABEL maintainer="Mreza Jafari <mohammadreza.jafari89@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

RUN go get github.com/canthefason/go-watcher & go install github.com/canthefason/go-watcher/cmd/watcher

# Copy the source from the current directory to the Working Directory inside the container

# Build the Go app
#RUN go build -o main .

# Expose port 8080 to the outside world

# Command to run the executable
