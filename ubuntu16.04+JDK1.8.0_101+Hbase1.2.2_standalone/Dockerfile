# This docker file is for Hbase1.2.0 standalone.
FROM ubuntu:16.04

MAINTAINER Xianyi Ye <yexianyi@sohu.com>

RUN sed -i 's/archive.ubuntu.com/hk.archive.ubuntu.com/g' /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y python-software-properties software-properties-common wget \
	&& add-apt-repository ppa:webupd8team/java \
    	&& apt-get update  \
	&& echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
	&& apt-get install -y oracle-java8-installer oracle-java8-set-default \

	# Download apt repo source file
	&& wget 'https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' \
	&& mv cloudera.list /etc/apt/sources.list.d/ \
	&& apt-get update  \
	
	# By default, HBase ships configured for standalone mode. In this mode of operation, a single JVM hosts the HBase Master, an HBase Region Server, and a ZooKeeper quorum peer. In order to run HBase in standalone mode, you must install the HBase Master package:
	&& apt-get --allow-unauthenticated install -y hbase-master \
	&& service hbase-master start \
	
	# Installing and Starting the HBase Thrift Server
	&& apt-get --allow-unauthenticated install -y hbase-thrift \
	&& service hbase-thrift start \

	# To verify that the standalone installation is operational, visit http://localhost:60010. The list of Region Servers at the bottom of the page should include one entry for your local machine.
	#Installing and Configuring REST
	&& apt-get --allow-unauthenticated install -y hbase-rest \

	# The script starts the server by default on port 8080. 
	&& service hbase-rest start \

	&& apt-get clean \
