### nfs 目录
```
mkdir -p /data/nfs-k8s/logs /data/nfs-k8s/mysql/conf
mkdir -pv /data/nfs-k8s/{redis,mysql,gitlab,jenkins,zookeeper}/data
mkdir -pv /data/nfs-k8s/solr/{data0,data1,data2,data3}
```

### gitlab 汉化
> 中文设置方法： 依次点击工具栏最右侧用户头像 》 Settings 》 Preferred language ， 然后选择 简体中文 即可

### jenkins 构建
```
docker build -t registry.cn-hangzhou.aliyuncs.com/weilus923/jenkins:2.180 jenkins
```

### fluent-es 构建
```
docker build -t registry.cn-hangzhou.aliyuncs.com/weilus923/fluent-es:1.0 fluentd
```


### EFK 部署
```
kubectl apply -f efk-pvc.yaml -f efk-configmap.yaml -f efk.yaml
```


### solrCloud 部署
```
kubectl apply -f zookeeper.yaml -f solr-pv.yaml -f solr-pvc.yaml -f solr.yaml
```