build:
	cd docker && make build

preflight:
	cd k8s/preflight && make deploy

deploy:
	cd k8s && kubectl apply -k .
