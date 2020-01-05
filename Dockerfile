FROM node:13.5-alpine
RUN apk update

USER node
ENV NPM_CONFIG_PREFIX /home/node/.npm-global
RUN npm install -g serverless
ENV PATH $PATH:/home/node/.npm-global/bin
