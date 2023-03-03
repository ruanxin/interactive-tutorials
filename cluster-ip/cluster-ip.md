Install cluster-ip operator:
```
kubectl apply -f https://github.com/pbochynski/cluster-ip/releases/latest/download/cluster-ip-operator.yaml
```{{exec}}
It installs the [latest version](https://github.com/pbochynski/cluster-ip/releases/latest), but you can pick any [other version](https://github.com/pbochynski/cluster-ip/releases). 

Create a resource:
```yaml
cat <<EOF | kubectl apply -f -
apiVersion: operator.kyma-project.io/v1alpha1
kind: ClusterIP
metadata:
  name: clusterip-sample
spec:
  nodeSpreadLabel: kubernetes.io/hostname
EOF
```{{exec}}

Wait until cluster IP resource is ready:
```sh
kubectl wait --for=jsonpath='{.status.state}'=Ready  clusterips/clusterip-sample
```{{exec}}

Check the status:
```sh
kubectl get clusterips/clusterip-sample -oyaml
```{{exec}}


You can extract all the IPs in all availability zones using this command
```sh
kubectl get clusterips/clusterip-sample -ojson | jq -r '.status.nodeIPs[].ip'
```{{exec}}
