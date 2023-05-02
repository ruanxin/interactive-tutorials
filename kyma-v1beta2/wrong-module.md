When non exists module enabled
```
kubectl apply -f https://raw.githubusercontent.com/kyma-project/lifecycle-manager/main/config/samples/component-integration-installed/operator_v1beta1_kyma.yaml
```{{exec}}

```
kyma alpha enable module non-exist-module
```{{exec}}