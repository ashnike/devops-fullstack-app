FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the frontend code
COPY . .

# Build the React app for production
RUN npm run build

# Stage 2: Create a lightweight image with only the build files
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the built files from the builder stage
COPY --from=builder /app/build ./build

RUN npm install -g serve

# Expose the port for the React app
EXPOSE 3000

# Start the server to serve the React app
CMD ["serve", "-s", "build", "-l", "3000"]
