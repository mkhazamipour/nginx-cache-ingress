#!/bin/sh
export SIZE=$SIZE
export URL=$URL
echo $SIZE | envsubst '$SIZE' < /etc/nginx/conf.d/cache.conf.val > /etc/nginx/conf.d/cache.conf
echo $URL | envsubst '$URL' < /etc/nginx/conf.d/default.conf.val > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
