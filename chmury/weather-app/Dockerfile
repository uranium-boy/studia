FROM node:24-alpine AS builder

WORKDIR /app

COPY src/package*.json ./
RUN npm ci --omit=dev

COPY src/ .

FROM node:24-alpine
LABEL org.opencontainers.image.authors="Maciej Janczara"

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

HEALTHCHECK --interval=60s --timeout=3s \
    CMD curl -f http://localhost:3000 || exit 1

CMD [ "npm", "start" ]
