#!/bin/bash
set -x
rm -rf /tmp/z
mkdir  /tmp/z
cd     /tmp/z

IMAGE=ghcr.io/kuoss/devpod:v0.1.0

cat <<'EOF' > Dockerfile
FROM golang:1.19-bullseye

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN set -eux; \
	\
	apt-get update; \
	apt-get install -y --no-install-recommends \
		nodejs \
	; \
	rm -rf /var/lib/apt/lists/*

CMD ['sleep','infinity']
EOF

docker build -t $IMAGE . && docker push $IMAGE
