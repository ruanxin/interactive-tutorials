For our tutorial, we will use [Istio](https://istio.io), a well-known service mesh for kubernetes.
Usually, you would have to manually manage the installation and maintain it with tools like HELM or kustomize. 

However, with a Kyma Module this process becomes a One-Liner!

We took the freedom to already install a small operator that installs istio for you. All you have to do now, is add Istio to the module list in Kyma resource:

kyma alpha enable module --name istio --channel regular
```
kyma alpha enable module istio --channel regular --wait
```{{exec}}

Wait until the module is ready and check if Istio resource was created:
```
kubectl get istio -A
```{{exec}}

Check if istio is installed:
```
kubectl get pods -A
```{{exec}}

You should see several istio pods running in `istio-system` namespace.


Note: If you prefer kubectl, you can always manually use a patch:
```
kubectl patch kyma default-kyma -n kyma-system --type='json' \
  -p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "istio","channel":"regular" }] }]'
```{{exec}}

However you will have observe the resource for Readiness manually and check when it is finished.
