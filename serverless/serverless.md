Install serverless manager:
```
kubectl apply -f https://raw.githubusercontent.com/kyma-project/kyma/main/installation/resources/crds/serverless/crd-serverless.yaml
kubectl apply -f https://github.com/kyma-project/serverless-manager/releases/latest/download/serverless-manager.yaml
```{{exec}}

And create serverless instance:
```
cat <<EOF | kubectl apply -n kyma-system -f -
apiVersion: operator.kyma-project.io/v1alpha1
kind: Serverless
metadata:
  name: serverless-sample
spec:
  dockerRegistry:
    enableInternal: false
    secretName: my-secret
EOF
```{{exec}}

Check the status of the serverless instance:
```
kubectl get serverless serverless-sample -n kyma-system -oyaml
```{{exec}}