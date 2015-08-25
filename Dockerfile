FROM sunyi00/centos-golang-nodejs-python:1.0.0

RUN rpm -i http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
RUN yum -y install \
        mercurial \
        supervisor \
        mysql-community-server \
        redis \
    && yum -y clean all

COPY . /
RUN /scripts/mysql-init.sh
