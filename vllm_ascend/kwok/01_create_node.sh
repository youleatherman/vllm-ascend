# 创建4个910 node（在master节点上执行）
for i in $(seq 0 $1); do sed "s/kwok-node-0/kwok-node-$i/g" 910-node.yaml | kubectl apply -f - ; done
