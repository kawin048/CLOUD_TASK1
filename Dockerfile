# Use an official Node.js image 
FROM node:12-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the rest of the application code into the working directory
COPY . .

# Build the React application
RUN npm run build

# Expose port 3000 (or the port your app is using)
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]
