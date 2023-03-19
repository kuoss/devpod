
install:
	kubectl apply -f .
	cd prometheus && make install
	cd lethe-writer && make install
	cd fluentbit-lethe && make install
