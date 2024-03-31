# pull node image from docker registry
FROM node:14.21-alpine

# set working directory to /app
WORKDIR /app

# copy rest of application to working directory
COPY . .

# install all dependencies
RUN npm install

# expose app port
EXPOSE 3001

# run the application
CMD [ "node", "index.js" ]