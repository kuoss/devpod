build:
	cd docker && make build

preflight:
	cd k8s/preflight && kubectl apply -f .

install-prometheus:
	cd prometheus && make install

deploy:
	cd k8s && kubectl apply -k .
