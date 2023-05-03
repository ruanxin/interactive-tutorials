apple in skr cluster
```
export KUBECONFIG=./kubeconfig--jellyfish--skr-test.yaml 
```{{exec}}

```
k apply -f template-noconfig.yaml
```{{exec}}

```
k patch kyma -n kyma-system default-kyma --type merge --patch-file remote-mt.yaml
```{{exec}}