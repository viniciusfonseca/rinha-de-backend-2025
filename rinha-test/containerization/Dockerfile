FROM alpine:3.22.0

COPY ./entrypoint.sh .
COPY ../*.js .

RUN apk update && apk add --no-cache git curl

ENTRYPOINT ["./entrypoint.sh"]
