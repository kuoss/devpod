install:
	kubectl kustomize . --enable-helm | kubectl apply -f -

uninstall:
	kubectl kustomize . --enable-helm | kubectl delete -f -
