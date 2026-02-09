#kubectl get nodes |grep "kwok-node" |awk '{print $1}' |xargs kubectl delete no --force --grace-period=0
kubectl delete node -l type=kwok
