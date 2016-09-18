# This docker file is for Hbase1.2.0 standalone.
FROM ubuntu:16.04

ARG JDK_VERSION=jdk-8u101
ARG JDK_PACKAGE=$JDK_VERSION-linux-x64.tar.gz

MAINTAINER Xianyi Ye <https://cn.linkedin.com/in/yexianyi>

RUN sed -i 's/archive.ubuntu.com/hk.archive.ubuntu.com/g' /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y wget \
	&& mkdir /usr/lib/java \
	&& cd /usr/lib/java \
	&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/$JDK_PACKAGE \
	&& tar -xzvf $JDK_PACKAGE \
	&& rm ./$JDK_PACKAGE \
	&& apt-get clean \
	
	# Download HBase
	&& wget http://apache.claz.org/hbase/1.2.3/hbase-1.2.3-bin.tar.gz \
	&& tar xzvf hbase-1.2.3-bin.tar.gz \
	&& rm -f hbase-1.2.3-bin.tar.gz \
	&& rm -rf hbase-1.2.3/docs/ \
	&& cd hbase-1.2.3/ \
	&& pwd \
