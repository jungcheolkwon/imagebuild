###########################################################
# base tools and dependencies
###########################################################
FROM ubuntu:18.04 as base

RUN  apt-get -y update 
RUN apt-get install -y curl nginx python3-pip
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx
RUN pip3 install f5-sdk f5-sdk-python pandas ipstack

#VOLUME ["~/Downloads", "/etc/nginx/site-enabled", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["nginx"]

EXPOSE 80 443
