# Use Node.js 22 as the base image
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json for frontend
COPY app/client/package*.json ./client/

# Install frontend dependencies
RUN cd client && npm install

# Copy the frontend code
COPY app/client ./client/

# Expose the frontend port (5173)
EXPOSE 5173

# Run the frontend using Vite
CMD ["sh", "-c", "cd client && npm run dev -- --host 0.0.0.0"]
