FROM nginx:alpine

ARG VERSION
ENV APP_VERSION=${VERSION:-v1.0}
ARG PORT
ENV API_PORT=${PORT:-8080}

RUN apk update && apk add npm

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
ADD src ./
RUN npm install

HEALTHCHECK --interval=60s --timeout=1s \
    CMD curl -f http://127.0.0.1 || exit 1

CMD [ "sh", "-c", "nginx & node app.js" ]

EXPOSE 80
