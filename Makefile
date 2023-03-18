build:
	cd docker && make build

preflight:
	cd k8s/preflight && kubectl apply -f .

deploy:
	cd k8s && kubectl apply -k .
