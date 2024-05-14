FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

RUN apk --no-cache add curl

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

EXPOSE 8081

CMD [ "node", "server.js" ]