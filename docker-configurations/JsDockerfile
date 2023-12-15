# Build stage
FROM node:16 AS build

# Install git (for branch/patch info)
RUN apt-get update && apt-get install -y git

# Install dependencies
WORKDIR /app
COPY package*.json ./
RUN npm install

# Build server deployment 
COPY . .
RUN npm run build

# Get branch and patch level, then create patch.txt file
RUN BRANCH=$(git rev-parse --abbrev-ref HEAD) && \
    PATCH=$(git rev-parse HEAD) && \
    echo $BRANCH.$PATCH > ./dist/patch.txt

# Deployment stage
FROM nginx:stable-alpine as deploy

# Copy built assets from build stage to nginx serving directory
COPY --from=build /app/dist /usr/share/nginx/html
COPY ./src/docker/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
