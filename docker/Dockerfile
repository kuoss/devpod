FROM golang:1.19-bullseye

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		nodejs \
	; \
	rm -rf /var/lib/apt/lists/*

RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
-o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
&& chmod 700 get_helm.sh \
&& ./get_helm.sh \
&& rm -f get_helm.sh

CMD ['sleep','infinity']
