FROM scratch AS base
ADD alpine-minirootfs-3.21.3-x86_64.tar /

ARG VERSION
ENV APP_VERSION=$VERSION
ARG PORT
ENV API_PORT=$PORT

RUN apk update && apk add npm

RUN mkdir -p /var/node
WORKDIR /var/node
ADD src ./
RUN npm install

FROM nginx:alpine

ARG VERSION
ENV APP_VERSION=${VERSION:-v1.0}
ARG PORT
ENV API_PORT=${PORT:-8080}

RUN apk update && apk add npm

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=base /var/node/node_modules /usr/share/nginx/html/node_modules
COPY --from=base /var/node/app.js /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

HEALTHCHECK --interval=60s --timeout=1s \
    CMD curl -f http://127.0.0.1 || exit 1

CMD [ "sh", "-c", "nginx & node app.js" ]

EXPOSE 80
