FROM node:12.13.0-alpine AS builder

RUN apk update \
  && apk add curl \
  && apk add make \
  && apk add gcc \
  && apk add g++ \
  && apk add git \
  && apk add openssh \
  && apk add python \
  && rm -rf /var/cache/apk/*

RUN yarn install --frozen-lockfile --non-interactive --cache-folder=/app/.cache/yarn  --production=true \
  && rm -fr /app/.cache/yarn/*

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY package*.json ./
COPY yarn.lock ./

FROM builder AS development
EXPOSE 4000

FROM builder AS production
COPY . $APP_HOME
RUN yarn install --production=true
EXPOSE 4000
CMD ["npm", "run", "start"]
