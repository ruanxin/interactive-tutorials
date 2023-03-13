Install [BTP manager](https://github.com/kyma-project/btp-manager):
```
kubectl apply -f deployments/btp-manager.yaml
```{{exec}}

Check the status of installation:
```
kubectl get btpoperator -n kyma-system btpoperator-sample
```{{exec}}