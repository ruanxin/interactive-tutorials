When non exists module enabled
```
kubectl apply -f https://github.com/kyma-project/keda-manager/releases/download/v0.0.4/moduletemplate.yaml
```{{exec}}

```
kyma alpha list module -A
```{{exec}}

```
kyma alpha enable module keda -c fast -n kyma-system -k default-kyma
```{{exec}}

add internal=true to keda
```
kubectl patch moduletemplate -n kcp-system moduletemplate-keda --type merge --patch-file add-internal-label.yaml
```{{exec}}

change internal=false to keda
```
kubectl patch moduletemplate -n kcp-system moduletemplate-keda --type merge --patch-file disable-internal-label.yaml
```{{exec}}


add internal=true to kyma
```
kubectl patch kyma -n kyma-system default-kyma --type merge --patch-file add-internal-label.yaml
```{{exec}}

add internal=true to keda
```
kubectl patch moduletemplate -n kcp-system moduletemplate-keda --type merge --patch-file add-internal-label.yaml
```{{exec}}