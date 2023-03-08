curl -Lo kyma https://storage.googleapis.com/kyma-cli-unstable/kyma-linux # kyma-linux, kyma-linux-arm, kyma.exe, or kyma-arm.exe
chmod +x kyma
mv kyma /usr/local/bin/
kyma alpha deploy --ci
kubectl apply -f modules.yaml
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-
echo "Kyma Control Plane is ready. Go to next step."
