# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install 

# Copy the rest of the application code
COPY . .

# Expose the service port
EXPOSE 3000

# Set environment variables for RabbitMQ and other configurations
ENV RABBITMQ_CONNECTION_STRING=amqp://guest:guest@localhost:5672/
ENV PORT=3000

# Start the order-service
CMD ["node", "index.js"]