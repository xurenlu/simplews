# Use the official Golang image as the base image
FROM golang:1.20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY ./src/*.go ./
COPY ./go.mod ./
COPY ./go.sum ./
# Build the Go application
RUN go build -o ./bin/sws ./

# Create a minimal runtime image
FROM alpine:latest

# Copy the binary from the builder stage
COPY --from=builder /app/bin/sws /bin/sws
ENV PORT=5000
# Set the startup command
CMD ["/bin/sws"]
