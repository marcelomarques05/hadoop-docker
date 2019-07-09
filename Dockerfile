FROM ubuntu:bionic

EXPOSE 50070 8088

RUN apt-get update -y && apt-get install -y ssh rsync wget curl net-tools vim openjdk-8-jdk openjdk-8-jre
RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys2
ADD http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz /root/
RUN tar -xzvf /root/hadoop-3.1.2.tar.gz -C /root/ && rm -f /root/hadoop-3.1.2.tar.gz
COPY prepare_hadoop.sh /tmp/
COPY conf /root/conf
ENTRYPOINT [ "/tmp/prepare_hadoop.sh" ]