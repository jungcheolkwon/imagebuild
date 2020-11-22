# There is no latest git package for centos 7. So building it from source using docker multi-stage builds
# also speed-up sub-sequent builds


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
