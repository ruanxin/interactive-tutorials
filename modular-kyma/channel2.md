In this use case, a new version of the `cluster-ip` module (`v0.0.26`) is ready to be promoted to the `fast` channel.

To simulate this behavior, update the `fast` channel module template with the new version using the following kubectl command:
```
kubectl apply -f cluster-ip-module-template-fast-upgraded.yaml
```{{exec}}

Once the module template has been updated, switch the `cluster-ip` module to the `fast` channel by running the following command:
```
kyma alpha enable module cluster-ip --channel fast -k default-kyma
```{{exec}}

After switching the module, verify that the cluster-ip module in the `fast` channel has been upgraded to the new version (`v0.0.26`).
```
kyma alpha list module -k default-kyma
```{{exec}}

Using release channels in Kyma provides a way to test new features early, manage version promotions, and control the system's stability.