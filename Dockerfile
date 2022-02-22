# build environment
FROM node:16.13.0-alpine AS build
#WORKDIR /app
#ENV PATH /app/node_modules/.bin:$PATH
#COPY package.json /app/package.json
#COPY yarn.lock /app/package.lock
#RUN yarn install --silent
#RUN yarn global add react-scripts@3.0.1 --silent
#COPY . /app
#RUN yarn run build

WORKDIR /usr/src/app

# Copies package.json and package-lock.json to Docker environment
COPY package*.json ./

# Installs all node packages
RUN yarn install

# Copies everything over to Docker environment
COPY . .

# Uses port which is used by the actual application
EXPOSE $PORT

# Finally runs the application
CMD [ "yarn", "start" ]