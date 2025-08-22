FROM node:24.6.0-alpine as  builder
WORKDIR /usr/app

COPY ./ /usr/app

RUN npm install

FROM builder
WORKDIR /usr/app
RUN echo 'Deploying bot commands!'
RUN npm run deploy
RUN echo 'Bot commands deployed!'
CMD ["npm", "run", "start"]