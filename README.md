# DockerBuilds [![](https://images.microbadger.com/badges/image/yexianyi/hbase.svg)](https://microbadger.com/images/yexianyi/hbase "Get your own image badge on microbadger.com")
|Command|HBase|System|JDK|
|:-----:|:---:|:----:|:-:|
|docker pull yexianyi/hbase:standalone-1.2.3|1.2.3|Ubuntu16.04|JDK1.8.0_101|
|docker pull yexianyi/hbase:pseudo-clustering-1.2.3|1.2.3|Ubuntu16.04+Hadoop2.7.3|JDK1.8.0_101|

##Environment Variables
+ JAVA_HOME=/usr/lib/java/jdk1.8.0_101
+ HADOOP_HOME=/home/hadoop-2.7.3
+ HBASE_HOME=/home/hbase-1.2.3
+ PATH=/usr/lib/java/jdk1.8.0_101/bin:/home/hbase-1.2.3/bin:/home/hadoop-2.7.3/bin:/home/hadoop-2.7.3/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
+ PWD=/

##Launch Service
###pseudo-clustering-1.2.3
1. service ssh start </br>
2. hdfs namenode -format
3. start-dfs.sh


