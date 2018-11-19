FROM node:alpine

WORKDIR /app

RUN yarn global add eslint eslint-plugin-xss
COPY eslintrc /config/eslintrc
COPY run.sh /config/run.sh
ENTRYPOINT ["/config/run.sh"]
