docker run -d --name=svn \
-p 8080:80 \
-v $(pwd)/repo:/svn/repo \
-v $(pwd)/auth-conf:/etc/apache2/auth \
-v $(pwd)/logs:/var/log/apache2 \
svn:test

## 初始化仓库
docker run --rm -v $(pwd)/repo:/svn/repo svn:test svnadmin create /svn/repo
