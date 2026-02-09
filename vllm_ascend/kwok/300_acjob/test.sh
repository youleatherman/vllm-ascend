for i in {1..60}
do
    echo "第$i秒下发5个"
    for j in {1..5}
    do
        # 替换模板中的字符串，将acjob-test-time-300-1替换为acjob-test-time-300-$i-$j
        sed "s/acjob-test-time-300-1/acjob-test-time-300-$i-$j/g" 300-1-acjob.yaml | kubectl apply -f -
    done
    sleep 1
done
