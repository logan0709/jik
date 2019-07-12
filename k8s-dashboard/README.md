### dashboard证书导入浏览器

> 1. 生成p12证书
```
grep 'client-certificate-data' /root/.kube/config | head -n 1 | awk '{print $2}' | base64 -d >> kubecfg.crt
grep 'client-key-data' /root/.kube/config | head -n 1 | awk '{print $2}' | base64 -d >> kubecfg.key
openssl pkcs12 -export -clcerts -inkey kubecfg.key -in kubecfg.crt -out kubecfg.p12 -name "kubernetes-client"
```

> 2. 导入浏览器

  点击浏览器 菜单-设置-高级-管理证书; 选择“受信任的根证书颁发机构”这一栏，然后点击导入kubecfg.p12