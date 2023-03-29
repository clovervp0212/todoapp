FROM node:14-stretch-slim as build

WORKDIR /app
COPY . /app

RUN npm install

RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY --from=build /app/build /usr/share/nginx/html
