# pull node image from docker registry
FROM node:14

# set working directory to /app
WORKDIR /app

# copy all files and directories to working directory
COPY . .

# read value from build-time arguments
ARG NODE_ENV=
ARG DB_HOST=

# set environment variable
ENV NODE_ENV=${NODE_ENV} DB_HOST={DB_HOST}

# install npm packages and build the app
RUN npm install --production --unsafe-perm && npm run build

# expose app to port 8080
EXPOSE 8080

# run app with `npm start` command
CMD [ "npm", "start" ]