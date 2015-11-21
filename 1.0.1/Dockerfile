FROM sunyi00/centos-golang-nodejs-python:1.0.0

ADD nginx.repo /etc/yum.repos.d/nginx.repo
RUN rpm -i http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm

RUN yum -y install \
        mercurial \
        supervisor \
        mysql-community-server \
        redis \
        wget \
        unzip \
        nginx-1.9.4-1.el7.ngx.x86_64 \
    && mkdir -p /opt/ \
    && cd /opt/ \
    && curl https://bintray.com/sbt/rpm/rpm > /etc/yum.repos.d/bintray-sbt-rpm.repo \
    && yum -y install tomcat sbt\
    && yum -y clean all \
    && cd / \
    && curl -OL https://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip \
    && unzip typesafe-activator-1.3.6.zip \
    && chmod a+x /activator-dist-1.3.6/activator \
    && rm -f /typesafe-activator-1.3.6.zip

ENV PATH $PATH:/activator-dist-1.3.6/

COPY . /
RUN /scripts/mysql-init.sh

RUN curl -LO https://nodejs.org/dist/v5.0.0/node-v5.0.0-linux-x64.tar.gz \
    && tar --strip-components 1 -xzvf node-v* -C /usr/local \
    && rm -f node-v5.0.0-linux-x64.tar.gz

WORKDIR /opt
