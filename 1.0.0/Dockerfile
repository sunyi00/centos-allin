FROM sunyi00/centos-golang-nodejs-python:1.0.0

ADD nginx.repo /etc/yum.repos.d/nginx.repo
RUN rpm -i http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
ENV DOWNLOAD_URL http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz


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
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" $DOWNLOAD_URL \
    && tar xzf jdk-8u51-linux-x64.tar.gz \
    && rm -f jdk-8u51-linux-x64.tar.gz \
    && cd /opt/jdk1.8.0_51/ \
    && alternatives --install /usr/bin/java java /opt/jdk1.8.0_51/bin/java 1 \
    && alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_51/bin/jar 1 \
    && alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_51/bin/javac 1 \
    && alternatives --set jar /opt/jdk1.8.0_51/bin/jar \
    && alternatives --set javac /opt/jdk1.8.0_51/bin/javac \
    && curl https://bintray.com/sbt/rpm/rpm > /etc/yum.repos.d/bintray-sbt-rpm.repo \
    && yum -y install tomcat sbt\
    && yum -y clean all \
    && cd / \
    && curl -OL https://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip \
    && unzip typesafe-activator-1.3.6.zip \
    && chmod a+x /typesafe-activator-1.3.6/activator \
    && rm -f /typesafe-activator-1.3.6.zip


ENV PATH $PATH:/typesafe-activator-1.3.6/

COPY . /
RUN /scripts/mysql-init.sh
