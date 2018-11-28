FROM nginx:alpine
RUN rm /etc/nginx/conf.d/default.conf
ENV SIZE $SIZE
ENV URL $URL
COPY 404.html /home/index/
COPY cache.conf.val /etc/nginx/conf.d/cache.conf.val
COPY cache.conf.val /etc/nginx/conf.d/cache.conf
COPY default.conf.val /etc/nginx/conf.d/default.conf.val
COPY default.conf.val /etc/nginx/conf.d/default.conf
RUN printenv
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["sh", "./run.sh"]
