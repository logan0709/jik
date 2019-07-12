### dashboard证书
```
  openssl genrsa -out dashboard.key 2048

  openssl req -new -out dashboard.csr -key dashboard.key -subj '/CN=192.168.1.38'

  openssl x509 -req -in dashboard.csr -signkey dashboard.key -out dashboard.crt

  kubectl create secret generic kubernetes-dashboard-certs --from-file=dashboard.key --from-file=dashboard.crt -n kube-system

  kubectl describe secret kubernetes-dashboard-certs -n kube-system
```




kubectl describe secret kubernetes-dashboard-token-xtpgt -n kube-system