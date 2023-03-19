FROM golang:1.19-bullseye

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        net-tools \
        nodejs \
        vim \
    ; \
    npm -v ; \
    node -v ; \
    rm -rf /var/lib/apt/lists/*

CMD ['sleep','infinity']
