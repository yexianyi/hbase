# This docker file is for Hbase1.2.0 standalone.
FROM ubuntu:16.04

MAINTAINER Xianyi Ye <yexianyi@sohu.com>

RUN sed -i 's/archive.ubuntu.com/hk.archive.ubuntu.com/g' /etc/apt/sources.list \
RUN apt-get update \
RUN apt-get install -y python-software-properties software-properties-common wget \
RUN add-apt-repository ppa:webupd8team/java \
RUN apt-get update  \
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
RUN apt-get install -y oracle-java8-installer oracle-java8-set-default \
RUN apt-get clean \
	
	# Download HBase
RUN wget http://apache.claz.org/hbase/1.2.3/hbase-1.2.3-bin.tar.gz \
RUN tar xzvf hbase-1.2.3-bin.tar.gz \
RUN rm -f hbase-1.2.3-bin.tar.gz \
RUN cd hbase-1.2.3/ \
RUN pwd \
