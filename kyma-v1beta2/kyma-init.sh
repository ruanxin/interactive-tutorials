curl -Lo kyma https://storage.googleapis.com/kyma-cli-unstable/kyma-linux # kyma-linux, kyma-linux-arm, kyma.exe, or kyma-arm.exe
chmod +x kyma
mv kyma /usr/local/bin/
kyma alpha deploy --ci -k  https://github.com/ruanxin/kyma-operator/config/control-plane?ref=v1beta2
kubectl apply -f cluster-ip-module-template-fast.yaml
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-
echo "Kyma Control Plane is ready. Go to next step."
