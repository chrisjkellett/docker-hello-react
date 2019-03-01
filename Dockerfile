FROM node:alpine as builder

WORKDIR /hello-from-react

COPY ./package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder /hello-from-react/build /usr/share/nginx/html