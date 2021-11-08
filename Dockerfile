FROM node:12-alpine3.12 AS builder
WORKDIR /App
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
CMD node /App