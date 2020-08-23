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

ENV YARN_VERSION=1.17.3

RUN cd /opt \
  && rm -fr /opt/yarn* \
  && curl -L -O https://yarnpkg.com/downloads/${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz \
  && ls -alh /opt \
  && tar zvxf yarn-v${YARN_VERSION}.tar.gz \
  && rm yarn-v${YARN_VERSION}.tar.gz \
  && rm /usr/local/bin/yarn \
  && rm /usr/local/bin/yarnpkg \
  && ln -s /opt/yarn-v${YARN_VERSION}/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v${YARN_VERSION}/bin/yarnpkg /usr/local/bin/yarnpkg

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY package*.json ./
COPY yarn.lock ./

FROM builder AS development
CMD ["yarn", "run", "start:dev:docker"]
EXPOSE 4000

FROM builder AS production
COPY . $APP_HOME
RUN yarn install --production=true
EXPOSE 4000
