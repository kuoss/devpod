install:
	helm repo list | grep prometheus || helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm upgrade -n kuoss prometheus prometheus-community/prometheus -f values.yaml --install

uninstall:
	helm uninstall -n kuoss prometheus
