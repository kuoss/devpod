build:
	cd docker && make build

pvc:
	cd k8s && kubectl apply -f _pvc.yaml

deploy:
	cd k8s && kubectl apply -k .
