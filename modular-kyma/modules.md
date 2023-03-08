You can now enable modules in the Kyma Dashboard. Go to the namespace `kyma-system`, open the Kyma resource (in the `Kyma` section), edit it and add `keda` or `cluster-ip` module from beta channel. 

Alternatively, feel free to observe all available modules in the cluster with the CLI:
```
kyma alpha list module
```{{exec}}

To check which modules are currently enabled in your cluster, pass a reference to a valid Kyma Custom Resource:

```
kyma alpha list module -k default-kyma
```{{exec}}


If you prefer CLI  also for enabling/disabling the other modules, you can enable them using the same command as before:
```
kyma alpha enable module keda --channel beta --wait
```{{exec}}

and `cluster-ip` module using this command:
```
kyma alpha enable module cluster-ip --channel beta --wait
```{{exec}}

Now you can verify if cluster IP is already available:
```
kubectl get clusterip -n kyma-system clusterip-nodes -oyaml
```{{exec}}
