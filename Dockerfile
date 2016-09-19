# This docker file is for Hbase1.2.0 standalone.
FROM ubuntu:16.04

ARG JDK_VERSION=jdk-8u101
ARG JDK_PACKAGE=$JDK_VERSION-linux-x64.tar.gz
ARG JDK_INSTALL_PATH=/usr/lib/java
    
ARG HADOOP_VERSION=2.7.3
ARG HADOOP_PACKAGE=hadoop-$HADOOP_VERSION.tar.gz
ARG HADOOP_INSTALL_PATH=/home

ARG HBASE_VERSION=1.2.3
ARG HBASE_PACKAGE=hbase-$HBASE_VERSION-bin.tar.gz
ARG HBASE_INSTALL_PATH=/home
    
ENV JAVA_HOME=$JDK_INSTALL_PATH/jdk1.8.0_101 \
    HBASE_HOME=$HBASE_INSTALL_PATH/hbase-$HBASE_VERSION
    HADOOP_HOME=$HADOOP_INSTALL_PATH/hadoop-$HADOOP_VERSION
ENV PATH=$JAVA_HOME/bin:$HBASE_HOME/bin:$HADOOP_HOME/bin:$PATH


MAINTAINER Xianyi Ye <https://cn.linkedin.com/in/yexianyi>

RUN sed -i 's/archive.ubuntu.com/hk.archive.ubuntu.com/g' /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y wget ssh rsync\
	&& apt-get clean \
	&& apt-get autoremove \

	# Config SSH
	&& sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
	
	# Install Oracle JDK
	&& mkdir /usr/lib/java \
	&& cd /usr/lib/java \
	&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/$JDK_PACKAGE \
	&& tar -xzvf $JDK_PACKAGE \
	&& rm ./$JDK_PACKAGE \

	#Install Hadoop
	&& cd /home
	&& wget http://www-eu.apache.org/dist/hadoop/common/stable/$HADOOP_PACKAGE \
	&& tar xzvf $HADOOP_PACKAGE \
	&& rm -f $HADOOP_PACKAGE \
	&& rm -rf $HBASE_HOME/share/doc/ \

	#Config Hadoop
	&& cd $HADOOP_HOME/etc/hadoop \
	&& rm -f core-site.xml hdfs-site.xml \
	&& wget https://raw.githubusercontent.com/yexianyi/hbase/pseudo-clustering-1.2.3/etc/hadoop/core-site.xml \
	&& wget https://raw.githubusercontent.com/yexianyi/hbase/pseudo-clustering-1.2.3/etc/hadoop/hdfs-site.xml \

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

	
