FROM node:13.5-alpine
RUN apk update

USER node
ENV NPM_CONFIG_PREFIX ~/.npm-global
RUN npm install -g serverless
