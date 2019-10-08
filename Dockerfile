FROM ubuntu:bionic

EXPOSE 50070 8088 9864

RUN apt-get update -y && apt-get install -y ssh rsync wget curl net-tools vim openjdk-8-jdk openjdk-8-jre
RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys2
ADD http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz /root/
RUN tar -xzf /root/hadoop-3.2.1.tar.gz -C /root/ && rm -f /root/hadoop-3.2.1.tar.gz
ADD http://ftp.unicamp.br/pub/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz /root/
RUN tar -xzf /root/spark-2.4.4-bin-hadoop2.7.tgz -C /root/ && rm -f /root/spark-2.4.4-bin-hadoop2.7.tgz
COPY prepare_hadoop.sh /root/
COPY conf /root/conf
RUN chmod +x /root/prepare_hadoop.sh
ENTRYPOINT [ "/root/prepare_hadoop.sh" ]
