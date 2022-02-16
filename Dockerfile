FROM ubuntu:18.04
MAINTAINER qiyuan
RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list && cd /usr/local \
	&& apt-get update --fix-missing && apt-get install -y sudo openjdk-8-jdk vim python3-pip wget zip --fix-missing \
	&& pip3 install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple/ && pip install mongo-connector \
	&& pip3 install mongo-connector[elastic5] && cd /usr/local/src && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.1.zip \
	&& unzip elasticsearch-5.0.1.zip && useradd elasticsearch && pip3 install pymongo==3.9
COPY start.sh /usr/local/src/elasticsearch-5.0.1/start.sh
RUN chown -R elasticsearch:elasticsearch /usr/local/src/elasticsearch-5.0.1 && chmod 777 /usr/local/src/elasticsearch-5.0.1/start.sh
EXPOSE 9200
EXPOSE 9300
ENTRYPOINT ["/bin/sh", "/usr/local/src/elasticsearch-5.0.1/start.sh"] 
