# Specify the base image
 FROM node:alpine AS build-stage
 WORKDIR  /app

# COpy he files from current working DIR to  the container. This will copy package.json and solve the second issue
 COPY package.json .

# Install dependencies
 RUN npm install

 COPY . .

 RUN npm run build

 FROM nginx
# WORKDIR /usr/app/build
 COPY --from=build-stage /app/build  /usr/share/nginx/html
