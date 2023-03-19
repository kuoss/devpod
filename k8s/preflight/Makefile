
install:
	kubectl apply -f .
	cd prometheus && make install
	cd lethe-writer && amke install
	cd fluentbit-lethe && make install
