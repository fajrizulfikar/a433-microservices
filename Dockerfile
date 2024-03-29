# pull node image from docker registry
FROM node:14.21-alpine

# set working directory to /app
WORKDIR /app

# copy package json and package-lock.json
COPY package*.json ./

# install all dependencies
RUN npm install

# copy rest of application to working directory
COPY . .

# expose app port
EXPOSE 3000

# run the application
CMD [ "node", "index.js" ]