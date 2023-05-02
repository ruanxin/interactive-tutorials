When non exists module enabled
```
kubectl apply -f https://raw.githubusercontent.com/kyma-project/lifecycle-manager/main/config/samples/component-integration-installed/operator_v1beta1_kyma.yaml
```{{exec}}

```
kubectl patch kyma -n kyma-system default-kyma --type merge --patch-file add-sync-label.yaml
```{{exec}}

```
kubectl patch kyma -n kyma-system default-kyma --type merge --patch-file non-exist-module.yaml
```{{exec}}

```
kubectl patch kyma -n kyma-system default-kyma --type merge --patch-file no-module.yaml
```{{exec}}