FROM hadoop-base-image

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HADOOP_NN_DIR=/data/1/dfs/namenode

RUN mkdir -p /data

ADD run.sh /run.sh
RUN chmod a+x /run.sh \
	&& chown hdfs:hadoop run.sh \
	&& chown -R hdfs:hadoop /data 
	# && chown -R hdfs:hadoop ${HADOOP_HOME}

USER hdfs

# file:///data/1/dfs/namenode from hdfs-site.xml
RUN mkdir -p ${HADOOP_NN_DIR} && mkdir -p ${HADOOP_HOME}/logs
VOLUME ${HADOOP_NN_DIR}

# Web UI port, internal rpc port is 9000
EXPOSE 9870

CMD ["/run.sh"]