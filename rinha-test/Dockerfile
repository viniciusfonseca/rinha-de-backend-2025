FROM docker:dind

RUN apk update && apk add --no-cache git curl

RUN wget https://github.com/grafana/k6/releases/download/v1.1.0/k6-v1.1.0-linux-amd64.tar.gz
RUN tar xf k6-v1.1.0-linux-amd64.tar.gz -C /tmp
RUN mv /tmp/k6-v1.1.0-linux-amd64/k6 /bin

RUN git clone https://github.com/zanfranceschi/rinha-de-backend-2025.git

WORKDIR /rinha-de-backend-2025/rinha-test
RUN git checkout test-automation-with-dind
WORKDIR /rinha-de-backend-2025/participantes/zanfranceschi-exemplo
RUN docker compose up -d
WORKDIR /rinha-de-backend-2025/payment-processor
RUN docker compose up -d
RUN sleep 5
RUN k6 run -e MAX_REQUESTS=850 rinha.js

# docker build -t rinha-2025-test . && docker run --rm --privileged -e PARTICIPANTE=zan rinha-2025-test:latest

