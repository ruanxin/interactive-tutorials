```
kubectl apply -f https://github.com/kyma-project/keda-manager/releases/download/v0.0.4/moduletemplate.yaml
```{{exec}}

```
kyma alpha list module -A
```{{exec}}


make keda moduletemplate as internal
```
kubectl patch moduletemplate -n kcp-system moduletemplate-keda --type merge --patch-file add-internal-label.yaml
```{{exec}}

```
k get moduletemplate -n kcp-system moduletemplate-keda --show-labels 
```{{exec}}

```
kyma alpha enable module keda -c fast -n kyma-system -k default-kyma
```{{exec}}


Enable kyma support internal
```
kubectl patch kyma -n kyma-system default-kyma --type merge --patch-file add-internal-label.yaml
```{{exec}}

Disable kyma internal
```
kubectl patch kyma -n kyma-system default-kyma --type merge --type merge --patch-file disable-internal-label.yaml
```{{exec}}