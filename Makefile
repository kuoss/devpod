build:
	./build.sh

deploy:
	cd k8s && kubectl apply -k .
