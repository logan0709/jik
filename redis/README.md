### redis集群初始化
```
kubectl exec -it redis-0 -n weilus-cloud -- sh
```

```
redis-cli -a 123456 --cluster create 10.244.1.216:6379 10.244.1.217:6379 10.244.1.218:6379 10.244.1.219:6379 10.244.1.220:6379 10.244.1.221:6379 --cluster-replicas 1
```

### 新增master节点
```
redis-cli --cluster add-node 192.168.0.251:6390 192.168.0.251:6381
```

### 新增slave节点
```
redis-cli --cluster add-node 127.0.0.1:7006 127.0.0.1:7000 --cluster-slave --cluster-master-id 3c3a0c74aae0b56170ccb03a76b60cfe7dc1912e
```

### 删除节点
```
redis-cli --cluster del-node 127.0.0.1:7000 `<node-id>`
```


