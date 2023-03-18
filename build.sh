#!/bin/bash
set -x
rm -rf /tmp/z
mkdir  /tmp/z
cd     /tmp/z

IMAGE=ghcr.io/kuoss/devpod:v0.1.1

cat <<'EOF' > Dockerfile
FROM golang:1.19-bullseye

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
RUN set -eux; \
	\
	apt-get update; \
	apt-get install -y --no-install-recommends \
		gh \
		nodejs \
	; \
	rm -rf /var/lib/apt/lists/*

CMD ['sleep','infinity']
EOF

docker build -t $IMAGE . && docker push $IMAGE
