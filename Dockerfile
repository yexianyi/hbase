# This docker file is for Hbase1.2.0 standalone.
FROM ubuntu:16.04

ARG JDK_VERSION=jdk-8u101
ARG JDK_PACKAGE=$JDK_VERSION-linux-x64.tar.gz
ARG JDK_INSTALL_PATH=/usr/lib/java
    
ARG HBASE_VERSION=1.2.3
ARG HBASE_PACKAGE=hbase-$HBASE_VERSION-bin.tar.gz
ARG HBASE_INSTALL_PATH=/home
    
ENV JAVA_HOME=$JDK_INSTALL_PATH/jdk1.8.0_101 \
    HBASE_HOME=$HBASE_INSTALL_PATH/hbase-$HBASE_VERSION
ENV PATH=$JAVA_HOME/bin:$HBASE_HOME/bin:$PATH


MAINTAINER Xianyi Ye <https://cn.linkedin.com/in/yexianyi>

RUN sed -i 's/archive.ubuntu.com/hk.archive.ubuntu.com/g' /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y wget \
	&& apt-get clean \
	&& apt-get autoremove \
	
	# Install Oracle JDK
	&& mkdir /usr/lib/java \
	&& cd /usr/lib/java \
	&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/$JDK_PACKAGE \
	&& tar -xzvf $JDK_PACKAGE \
	&& rm ./$JDK_PACKAGE \

	# Install HBase
	&& cd /home \
	&& wget http://apache.claz.org/hbase/$HBASE_VERSION/$HBASE_PACKAGE \
	&& tar xzvf $HBASE_PACKAGE \
	&& rm -f $HBASE_PACKAGE \
	&& rm -rf $HBASE_HOME/docs/ \
	
	# Config HBase Standalone
	&& cd $HBASE_HOME/conf \
	&& rm -f hbase-env.sh hbase-site.xml \
	&& wget https://raw.githubusercontent.com/yexianyi/hbase/standalone-1.2.3/conf/hbase-env.sh \
	&& wget https://raw.githubusercontent.com/yexianyi/hbase/standalone-1.2.3/conf/hbase-site.xml \

	
