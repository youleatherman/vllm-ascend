#kubectl get cm -n kube-system |grep "deviceinfo" |awk '{print $1}' |xargs kubectl delete cm -n kube-system --force --grace-period=0
kubectl delete cm -n kube-system -l mx-consumer-cim=true
