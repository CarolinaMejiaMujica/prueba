FROM node:12-alpine3.12 AS builder
WORKDIR /App
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.21.3-alpine AS prod-stage
COPY --from=build /App/build /usr/share/nginx/html/build
EXPOSE 80
CMD [ "nginx","-g","daemon off;" ]