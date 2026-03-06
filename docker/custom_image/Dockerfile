# File name should be always Dockerfile
# This file helps to build custom docker image
# build - build a custom image
# build command should be used in Dockerfile location
# . - Docker file is in current directory
# -t - tag name
# docker build -t image_name .
# Better add version for best practices
# docker build -t image_name:1.0.0 .
# Then we can run the image
# docker run -p 8000:3000 image_name
# -e - environment variable
# docker run -e ENV=production -p 8000:3000 image_name

# Pull node base image
FROM node:latest

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./

# Install packages
RUN npm install

# Copy source code to working directory
COPY . .


# TO improve performance we can first install dependencies and then copy source code
# Because the node_modules folder is cached and not copied unless package.json is changed
# If there is any change in the layer all the upcoming layers will be rebuilt

# Expose port 3000
EXPOSE 3000

# Start application
CMD ["node", "index.js"]