kubectl delete pod -n volcano-system $(kubectl get pod -n volcano-system -owide |grep volcano-scheduler |awk '{print $1}') --force
sleep 3
kubectl get pod -n volcano-system -owide
