docker:
	cd 0_docker && make build

preflight:
	cd 1_preflight && make install

deploy:
	cd 2_deploy && kubectl apply -k .
