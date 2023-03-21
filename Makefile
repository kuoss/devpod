docker:
	cd 0_docker && make build

preflight:
	cd 1_preflight && make install

devpod:
	cd 2_devpod && kubectl apply -k .

delete-all:
	kubectl delete ns kuoss-dev
	kubectl delete clusterrole fluentbit-lethe-dev 
	kubectl delete clusterrole prometheus-dev-kube-state-metrics
	kubectl delete clusterrole prometheus-dev-server
	kubectl delete clusterrole venti-dev
	kubectl delete clusterrolebinding fluentbit-lethe-dev 
	kubectl delete clusterrolebinding prometheus-dev-kube-state-metrics
	kubectl delete clusterrolebinding prometheus-dev-server
	kubectl delete clusterrolebinding venti-dev

test:
	3_test/test.sh