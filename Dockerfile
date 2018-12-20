FROM openresty/openresty:trusty

RUN apt-get -y update && apt-get install -y \
    build-essential \
    python-dev \
    python-pip \
    libyaml-dev \
    libev4 libev-dev\
    libffi-dev \
    libssl-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Remove default nginx configs
RUN rm /usr/local/openresty/nginx/conf/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

#Copy site contents and config
RUN mkdir -p /etc/nginx/sites-enabled/ && mkdir -p /var/www
ADD ./dist /var/www
ADD ./sites-enabled/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf