#!/bin/bash

set -e

# Ensure output directory exists
mkdir -p gen/go

echo "Generating Go code from proto files..."

# Generate Go code
# Using --proto_path=proto so that imports like "provider/v1/flight.proto" work correctly.
# Using paths=source_relative to keep the directory structure relative to the proto files within gen/go/
protoc --proto_path=proto \
    --go_out=gen/go --go_opt=paths=source_relative \
    --go-grpc_out=gen/go --go-grpc_opt=paths=source_relative \
    $(find proto -name "*.proto")

echo "Generation complete."
