#!/bin/bash

kubectl apply -f $1

#PG_NAME="acjob-test-time-40e040a7-bcd5-44fb-aa0b-4f1b35555e13"
NAMESPACE="default"
TIMEOUT=300  # 超时时间（秒）
start_time=$(date +%s)

echo "开始监控 PG 资源: $PG_NAME"
echo "超时设置为: $TIMEOUT 秒"
echo "等待状态变为 Running..."

while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    
    # 检查超时
    if [ $elapsed_time -ge $TIMEOUT ]; then
        echo "监控超时！经过 $elapsed_time 秒后仍未达到 Running 状态"
        exit 1
    fi
    
    # 获取 PG 详细信息
    #pg_info=$(kubectl get pg $PG_NAME -n $NAMESPACE -o json 2>/dev/null)
    pg_info=$(kubectl get pg  -n $NAMESPACE -o json 2>/dev/null)
    
    if [ $? -ne 0 ]; then
        echo "错误: 无法获取 PG 信息"
        exit 1
    fi
    
    status=$(echo "$pg_info" | jq -r '.items[0].status.phase')
    runnings=$(echo "$pg_info" | jq -r '.items[0].status.running // 0')
    minmember=$(echo "$pg_info" | jq -r '.items[0].spec.minMember // 0')
    
    echo "[$(date '+%H:%M:%S')] 状态: $status, RUNNINGS: $runnings/$minmember"
    
    if [ "$status" == "Running" ] && [ "$runnings" -eq "$minmember" ]; then
        echo "=========================================="
        echo "PG 状态变为 Running 的时间: $(date)"
        echo "总耗时: $elapsed_time 秒"
        echo "RUNNINGS/MINMEMBER: $runnings/$minmember"
        echo "=========================================="
        break
    fi
    
    sleep 2
done
