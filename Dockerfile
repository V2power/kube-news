FROM node:24 AS builder
COPY ./src /app
WORKDIR /app
RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs24-debian13
COPY --from=builder /app /app
WORKDIR /app
EXPOSE 8080
CMD [ "server.js" ]