# nginx-cache-ingress
Nginx with enabled cache and custom environment variable to deploy on kubernetes cluster as part of caching system.
# Instruction
```bash
docker build -t nginx-cache .
```
```bash
docker run -dit -e URL=URL_TO_BE_CACHED(http/s://cker.ir) -e SIZE=CACHE_SIZE(example 5g) --name=caching nginx-cache
```
