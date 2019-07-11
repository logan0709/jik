
### gitlab-k8s
> gitlab 部署
 ```
 nfs #> mkdir -p /data/nfs-k8s/gitlab/data
 k8s #> kubectl apply -f gitlab.yaml
 ```
> gitlab 汉化

  中文设置方法： 依次点击工具栏最右侧用户头像 》 Settings 》 Preferred language ， 然后选择 简体中文 即可

### jenkins-k8s
```
nfs #> mkdir -p /data/nfs-k8s/jenkins/data
k8s #> kubectl apply -f jenkins.yaml
```

### EFK-k8s
```
kubectl apply -f efk-pvc.yaml -f efk-configmap.yaml -f efk.yaml
```

### solrCloud-k8s
```
nfs #> mkdir -pv /data/nfs-k8s/solr/{data0,data1,data2,data3}
k8s #> kubectl apply -f solr-pv.yaml -f solr-pvc.yaml -f solr.yaml
```

### zookeeper-k8s 集群
```
nfs #> mkdir -pv /data/nfs-k8s/zookeeper/{data1,data2,data3}
k8s #> kubectl apply -f zk-pv.yaml -f zk-pvc.yaml -f zookeeper.yaml
```


### redis-k8s 集群
```
nfs #> mkdir -pv /data/nfs-k8s/redis/{data0,data1,data2,data3,data4,data5}
k8s #> kubectl apply -f redis-pv.yaml -f redis-pvc.yaml -f redis-svc.yaml
```


### elasticsearch 集群
```
nfs #> mkdir -pv /data/nfs-k8s/elasticsearch/{data1,data2}
k8s #> kubectl apply -f elasticsearch-pvc.yaml -f elasticsearch-master.yaml -f elasticsearch-data.yaml -f elasticsearch-svc.yaml
```