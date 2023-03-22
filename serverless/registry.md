Create kyma-system namespace:
```
kubectl create ns kyma-system
```{{exec}}

Create secret for temporary container registry:
```
export REGISTRY_URL={{TRAFFIC_HOST1_5000}}
export REGISTRY_ADDRESS=${REGISTRY_URL/https:\/\//}
kubectl create secret generic my-secret \
    --namespace kyma-system \
    --from-literal username="admin" \
    --from-literal password="secret" \
    --from-literal serverAddress="${REGISTRY_URL}" \
    --from-literal registryAddress="${REGISTRY_ADDRESS}/kyma"
```{{exec}}

If you want to verify if the registry works you can push there `hello-world` image:
```
docker pull hello-world
docker tag hello-world ${REGISTRY_ADDRESS}/kyma/hello-world:1.0
docker push ${REGISTRY_ADDRESS}/kyma/hello-world:1.0
```{{exec}}

And now you can run it:
```
docker run ${REGISTRY_ADDRESS}/kyma/hello-world:1.0
```{{exec}}