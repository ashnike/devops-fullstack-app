
FROM golang:1.19-alpine AS builder

WORKDIR /app

#install dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

RUN go build -o main .

# Stage 2: Create a lightweight image to run the application
FROM golang:1.19-alpine

WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/main .

# Set environment variables 
ENV DB_HOST=db \
    DB_PORT=5432 \
    DB_USER=employee_user \
    DB_PASSWORD=password \
    DB_NAME=employee_db \
    ALLOWED_ORIGINS="*"

# Expose the backend port
EXPOSE 8080

# Start the Go application
CMD ["./main"]
