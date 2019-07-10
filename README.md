# hadoop-docker
Hadoop in Docker Desktop Environment

1. Clone the repository into Docker Server

git clone $(repository)

2. Execute the build (inside the hadoop-docker folder)

docker build . -t hadoop:1

3. Start the container

docker run -it --name hadoop --rm -p 50070:50070 -p 8088:8088 -p 9864:9864 hadoop:1

4. Feel Free now to use the container. Some uses:

# Test YARN job
/root/hadoop/bin/hadoop jar /root/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.1.jar pi 1 10

# Access NameNode WebUI
http://localhost:50070

# Access YARN Resource Manager
http://localhost:8088

# Access DataNode WebUI
http://localhost:9864

* To use WebUI, remember that localhost is only if you´re using Docker in same host you´re using. If you´re using some external environment, you need to get the external IP address.