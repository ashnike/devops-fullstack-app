# Stage 1: Build Image
FROM node:18.20 AS builder
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Inject build-time environment variables into the React app using a .env file or via Docker build arguments
ARG REACT_APP_SERVER_URL
RUN echo "REACT_APP_SERVER_URL=$REACT_APP_SERVER_URL" >> .env

RUN npm run build

# Stage 2: Serve Image
FROM node:18-alpine

WORKDIR /app

# Copy the built files from the builder stage
COPY --from=builder /app/build ./build

# Install serve to serve the React app
RUN npm install -g serve

# Expose port 3000 for the React app
EXPOSE 3000

# Start the server
CMD ["serve", "-s", "build", "-l", "3000"]
