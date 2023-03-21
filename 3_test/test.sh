#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit;
fi

VENTI_VERSION=$1
LETHE_VERSION=$2

cd $(dirname $0)
rm -rf venti-stack
git clone https://github.com/kuoss/venti-stack.git

cd venti-stack/
cp ../values.yaml .
./render.sh
cd _rendered/
sed "s|image: ghcr.io/kuoss/lethe:.*|image: ghcr.io/kuoss/lethe:$LETHE_VERSION|" -i rendered.yaml
sed "s|image: ghcr.io/kuoss/venti:.*|image: ghcr.io/kuoss/venti:$VENTI_VERSION|" -i rendered.yaml

cat <<EOF > kustomization.yaml
namespace: kuoss
resources:
- rendered.yaml
EOF

kubectl create ns kuoss
kubectl apply -k .

