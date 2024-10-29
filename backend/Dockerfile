
FROM golang:1.19-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files and install dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go application
RUN go build -o main .

# Stage 2: Create a lightweight image to run the application
FROM golang:1.19-alpine

# Set the working directory
WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/main .

# Set environment variables (can also be overridden via Docker Compose)
ENV DB_HOST=db \
    DB_PORT=5432 \
    DB_USER=employee_user \
    DB_PASSWORD=password \
    DB_NAME=employee_db \
    ALLOWED_ORIGINS=http://localhost:3000

# Expose the backend port
EXPOSE 8080

# Start the Go application
CMD ["./main"]
