FROM node:13.5.0-alpine3.11
COPY ["./service","/usr/src/nodejs/"]
RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
        && /bin/bash
RUN apk add --no-cach tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

WORKDIR /usr/src/nodejs/
RUN npm install
EXPOSE 3000

CMD ["node","/usr/src/nodejs/server.js"]
