# Use Node.js 22 as the base image
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json for backend
COPY app/server/package*.json ./server/

# Install backend dependencies
RUN cd server && npm install

# Copy the backend code
COPY app/server ./server/

# Expose the backend port (4000)
EXPOSE 4000

# Run the backend server
CMD ["sh", "-c", "cd server && npm run dev"]
