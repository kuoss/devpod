build:
	cd docker && make build

deploy:
	cd k8s && kubectl apply -k .
