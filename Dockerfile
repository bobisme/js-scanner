FROM node:alpine

WORKDIR /app

RUN yarn global add eslint eslint-plugin-xss
COPY eslintrc.json /config/eslintrc.json
COPY run.sh /config/run.sh
ENTRYPOINT ["/config/run.sh"]
