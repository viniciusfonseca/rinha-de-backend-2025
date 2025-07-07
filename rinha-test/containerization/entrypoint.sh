#!/usr/bin/env sh

wget https://github.com/grafana/k6/releases/download/v1.1.0/k6-v1.1.0-linux-amd64.tar.gz
tar xf k6-v1.1.0-linux-amd64.tar.gz -C /tmp
mv /tmp/k6-v1.1.0-linux-amd64/k6 /bin

cd /
git clone https://$GIT_USER:$GIT_TOKEN@github.com/zanfranceschi/rinha-de-backend-2025.git

cd /rinha-de-backend-2025/rinha-test

k6 run -e MAX_REQUESTS=850 rinha.js

