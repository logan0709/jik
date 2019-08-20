## 安装
```
docker build -t svn:apache2-alpine build
```

## 初始化仓库
```
docker run --rm -v $(pwd)/repo:/svn/repo svn:apache2-alpine svnadmin create /svn/repo/jik
docker run --rm -v $(pwd)/repo:/svn/repo svn:apache2-alpine svnadmin create /svn/repo/test1
```

## 运行
```
docker run -d --name=svn -p 8080:80 \
-v $(pwd)/repo:/svn/repo \
-v $(pwd)/auth-conf:/etc/apache2/auth \
-v $(pwd)/logs:/var/log/apache2 \
svn:apache2-alpine
```

## 访问
```
http://192.168.1.37:8080/svn/test1
```
## 配置账号 auth-conf/passwd
```
htpasswd -cbm auth-conf/passwd admin admin123
```


## 配置权限 auth-conf/authz

```
[/]
admin = rw
* =

[test1:/]
admin = rw
* =

[jik:/]
admin = rw
* =
```

## K8S
```
kubectl apply -f svn-auth-configmap.yaml -f svn.yaml
```
