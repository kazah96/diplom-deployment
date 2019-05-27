FROM nginx

# RUN mkdir -m 0770 -p /var/cache/super-speed-nginx \
 #  && chown root:nginx /var/cache/super-speed-nginx

VOLUME  /var/log/nginx/

COPY ./nginx.conf.dev /etc/nginx/nginx.conf
COPY ./conf.d/default.conf.dev /etc/nginx/conf.d/default.conf

EXPOSE 8080
EXPOSE 80
WORKDIR /app

CMD ["nginx", "-g", "daemon off;"]