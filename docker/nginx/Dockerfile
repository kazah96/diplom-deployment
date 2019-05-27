FROM nginx

RUN mkdir -m 0770 -p /var/cache/super-speed-nginx \
    && chown root:nginx /var/cache/super-speed-nginx

VOLUME  /var/log/nginx/

WORKDIR /app
COPY ./conf.d/default.conf.dev /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]