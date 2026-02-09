#!/bin/bash
 
kwok \
          --kubeconfig=~/.kube/config \
            --manage-all-nodes=false \
              --manage-nodes-with-annotation-selector=kwok.x-k8s.io/node=fake \
                --manage-nodes-with-label-selector= \
                  --manage-single-node= \
                    --disregard-status-with-annotation-selector=kwok.x-k8s.io/status=custom \
                      --disregard-status-with-label-selector= \
                        --cidr=192.168.0.0/24 \
                          --node-ip=10.0.0.1 \
                            --node-lease-duration-seconds=40
