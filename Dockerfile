# Use Node.js 22 Alpine as base image
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lock files for both backend and frontend
COPY app/server/package*.json ./server/
COPY app/client/package*.json ./client/

# Install dependencies separately to optimize cache
RUN cd server && npm install
RUN cd client && npm install

# Copy the full source code
COPY app/server ./server/
COPY app/client ./client/

# Install concurrently globally to run both frontend and backend
RUN npm install -g concurrently

# Expose backend and frontend ports
EXPOSE 4000 5173

# Set environment variables (optional override at runtime)
ENV PORT=4000
ENV NODE_ENV=development

# Default command: run backend and frontend concurrently
CMD ["sh", "-c", "echo MONGO_URL=$MONGO_URL && concurrently --kill-others \"cd server && npm run dev\" \"cd client && npm run dev -- --host 0.0.0.0\""]
