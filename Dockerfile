FROM centos:7

RUN yum -y update && yum install -y httpd

# yum utils & config
RUN yum install -y yum-utils

RUN yum-config-manager --enable remi

# Node
RUN yum install -y https://rpm.nodesource.com/pub_16.x/el/9/x86_64/nodesource-release-el9-1.noarch.rpm

RUN yum install -y nodejs

# Php
RUN yum install -y --enablerepo=remi,epel,remi-php80 php

# Mysql
RUN yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm

RUN yum install -y mysql-community-server

# Enable service
RUN systemctl enable httpd.service

RUN systemctl enable mysqld

# COPY config
COPY ./config/httpd.conf /etc/httpd/conf
COPY ./config/my.cnf /etc/my.cnf

EXPOSE 80
