docker run -d \
-p 5000:5000 \
--restart=always \
eu.gcr.io/kyma-project/test-infra/docker-registry-2:20200202
kubectl create priorityclass -n kyma-system kyma-system-priority # fixing dependency to cluster-essentials
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-

