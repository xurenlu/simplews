#!/bin/bash

# Set environment variables for Linux x86_64 build
export GOOS=linux
export GOARCH=amd64

# Build the Go program
echo "Building gws for Linux x86_64..."
go build -o gws ./src/

if [ $? -eq 0 ]; then
    echo "Build successful! Output binary: gws"
else
    echo "Build failed!"
    exit 1
fi
