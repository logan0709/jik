## 安装
```
docker build -t svn:test .
```

## 初始化仓库
```
docker run --rm -v $(pwd)/repo:/svn/repo svn:test svnadmin create /svn/repo
```

## 运行
```
docker run -d --name=svn -p 8080:80 -v $(pwd)/repo:/svn/repo -v $(pwd)/auth-conf:/etc/apache2/auth -v $(pwd)/logs:/var/log/apache2 svn:test
```

## 配置账号
```
htpasswd -cbm auth-conf/passwd admin admin123
```

