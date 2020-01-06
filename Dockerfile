FROM golang:1.13-buster as builder
WORKDIR /app
COPY . .
RUN make build

FROM node:13.5-alpine
RUN apk update && \
    apk add make gcc g++

USER node
ENV NPM_CONFIG_PREFIX /home/node/.npm-global
RUN npm install -g serverless
ENV PATH $PATH:/home/node/.npm-global/bin

WORKDIR /app
COPY --from=builder /app/bin /app/bin
