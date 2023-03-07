#!/bin/bash

echo -e "\nConfiguring Kubernetes"
sleep 0.5
./setup-k8s.sh > /dev/null 2>&1
# kubectl cluster-info > /dev/null 2>&1

echo -e "\nCloning Course Repo"
git clone https://github.com/kong-education/KMIL-101.git > /dev/null 2>&1 && cd KMIL-101
sleep 0.5

echo -e "\nDeploying Marketplace Application...."
kubectl apply -f 03/01-kong-mesh-demo-aio.yaml > /dev/null 2>&1
kubectl wait --for=condition=available --timeout=600s deployment/kuma-demo-app -n kong-mesh-demo
kubectl wait --for=condition=available --timeout=600s deployment/kong-mesh-demo-backend-v0 -n kong-mesh-demo
kubectl wait --for=condition=available --timeout=600s deployment/redis-master -n kong-mesh-demo
kubectl wait --for=condition=available --timeout=600s deployment/postgres-master -n kong-mesh-demo
sleep 0.5

# kubectl get pods -n kong-mesh-demo
echo -e "\nExposing ports"
kubectl port-forward svc/frontend -n kong-mesh-demo --address 0.0.0.0 8080:8080 > /dev/null 2>&1 &
# export KONG_MESH_DEMO=https://${AVL_PRIMARY_CONTAINER_EXTERNAL_DOMAIN#?}
export KONG_MESH_DEMO=http://$KONGHOSTNAME:8080

sleep 0.5

echo -e "\nNow browse to $KONG_MESH_DEMO"

# undo
# kubectl delete -f 03/01-kong-mesh-demo-aio.yaml
# cd
# rm -rf KMIL-101
