# nginx-cache-ingress
Nginx with enabled local cache and custom environment variable to deploy on kubernetes cluster as part of caching system.
# Instruction
```bash
docker build -t nginx-cache .
```
```bash
docker run -dit -e URL=URL_TO_BE_CACHED(http/s://cker.ir) -e SIZE=CACHE_SIZE(example 5g) --name=caching nginx-cache
```
# OR
```bash
docker pull mormoroth/nginx-cache
```
```bash
docker run -dit -e URL=https://ha.cker.ir -e SIZE=3g --name nginx-cache mormoroth/nginx-cache:latest
```
# HOW TO USE INSIDE Kubernetes

Change ENV values inside deployment.yaml

```bash
    spec:
      containers:
      - env:
        - name: SIZE
          value: 3g
        - name: URL
          value: https://somesite.tobe.cached
```

Change domain inside ingress.yaml that serves cached content from bucket or any object storage defined in deployment.yaml

```bash
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: nginx-cache
  namespace: cker-endpoint
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
  - host: cdn.cker.ir
    http:
      paths:
      - path: /
        backend:
          serviceName: nginx-cache
          servicePort: 80
  tls:
  - hosts:
    - cdn.cker.ir
    secretName: cker-wildcard
```

```bash
kubectl create -f .
```
