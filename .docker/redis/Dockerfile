ARG REDIS_VERSION

FROM redis:${REDIS_VERSION}-alpine

COPY ./conf/redis.conf /usr/local/etc/redis/redis.conf

EXPOSE 6379