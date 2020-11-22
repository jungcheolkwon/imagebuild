###########################################################
# base tools and dependencies
###########################################################
FROM ubuntu:18.04 as base

RUN apt makecache fast && \
    apt -y install \
        libtirpc \
        python3 \
        python3-libs \
        python3-pip \
        python3-setuptools \
        unzip \
        bzip2 \
        make \
        openssh-clients \
        man \
        ansible \
        net-tools \
        bind-utils \
        tar \
        nginx \
        which && \
    apt -y update


###########################################################
# toolchains image
###########################################################
FROM base

RUN apt -y install \
        make \
        zlib-devel \
        curl-devel \ 
        gettext \
        bzip2 \
        gcc \
        tar \
        gzip \
        unzip && \
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

VOLUME ["~/Downloads", "/etc/nginx/site-enabled", "/var/log/nginx"]

WORKDIR /etc/nginx
CMD ["nginx"]
EXPOSE 80
EXPOSE 443
