curl -Lo kyma https://storage.googleapis.com/kyma-cli-unstable/kyma-linux # kyma-linux, kyma-linux-arm, kyma.exe, or kyma-arm.exe
chmod +x kyma
mv kyma /usr/local/bin/
#export ISTIO_VERSION=1.17.1
#curl -L https://istio.io/downloadIstio | TARGET_ARCH=x86_64 sh -
#chmod +x istio-$ISTIO_VERSION/bin/istioctl
#mv istio-$ISTIO_VERSION/bin/istioctl /usr/local/bin
#istioctl install -y
kubectl apply -f https://raw.githubusercontent.com/prometheus-community/helm-charts/main/charts/kube-prometheus-stack/crds/crd-servicemonitors.yaml

kubectl create ns kcp-system
kubectl create ns kyma-system
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml

kubectl apply -k kustomization.yaml
kubectl apply -f cluster-ip-module-template-fast.yaml
kubectl apply -f template-noconfig.yaml
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-
echo "Kyma Control Plane is ready. Go to next step."
