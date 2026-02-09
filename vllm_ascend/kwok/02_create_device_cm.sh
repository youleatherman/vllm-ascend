for i in  $(seq 0 $1);do sed "s/mindx-dl-deviceinfo-k8smaster/mindx-dl-deviceinfo-kwok-node-$i/g" device-info.yaml | kubectl apply -f -; done

