#去除所有模拟节点污点
kubectl taint node --all kwok.x-k8s.io/node=fake:NoSchedule-
