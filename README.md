# DockerBuilds [![](https://images.microbadger.com/badges/image/yexianyi/hbase.svg)](https://microbadger.com/images/yexianyi/hbase "Get your own image badge on microbadger.com")
|Command|HBase|System|JDK|Launch Service|
|:-----:|:---:|:----:|:-:|:-------------|
|docker pull yexianyi/hbase:standalone-1.2.3|1.2.3|Ubuntu16.04|JDK1.8.0_101||
|docker pull yexianyi/hbase:pseudo-clustering-1.2.3|1.2.3|Ubuntu16.04+Hadoop2.7.3|JDK1.8.0_101|1.service ssh start </br>2.hdfs namenode -format|

JAVA_HOME = /usr/lib/java/jdk1.8.0_101 </br>
HBASE_HOME = /home/hbase-\<version\> </br>


