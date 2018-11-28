# nginx-cache-ingress
Nginx with enabled caching image to deploy on kubernetes cluster as part on caching system
# Instruction
docker build -t nginx-caching .

docker run -dit -e URL=URL_TO_BE_CACHED(http/s://cker.ir) -e SIZE=CACHE_SIZE(example 5g) --name=caching nginx-caching
