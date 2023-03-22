Release channels provide a way to test new features and manage version promotions in a controlled manner.

With Kyma Lifecycle Manager, developers can create different channels for releasing modules, which allows them to test new features early and decide when to apply updates.

For detail channel concept and usage explanation, please reference Kyma community concept: [Release channels](https://github.com/kyma-project/community/tree/main/concepts/modularization#release-channels)

To demonstrate how to use release channels, let's consider two common use cases:

## Use channel for early testing of new features

Suppose that the `cluster-ip` module has a new feature that needs to be tested before it can be released to production. 

To do this, a new module template can be created with the specific version of the cluster-ip module under the beta channel.

To apply this new module template, run the following kubectl command:
```
kubectl apply -f cluster-ip-module-template-beta.yaml
```{{exec}}

Check `cluster-ip` module, make sure it enabled under `fast` channel, and the current version is `v0.0.24`. 
```
kyma alpha list module -k default-kyma
```{{exec}}

Now switch the `cluster-ip` module to the `beta` channel by running the following command:
```
kyma alpha enable module cluster-ip --channel beta -k default-kyma
```{{exec}}

After switching the module, verify that the `cluster-ip` module is enabled under the `beta` channel and has the new version `v0.0.26`.
```
kyma alpha list module -k default-kyma
```{{exec}}

## Use channel for version promotion

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

By following the steps outlined in these use cases, developers can take advantage of release channels to effectively manage module releases in Kyma.