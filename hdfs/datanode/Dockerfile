FROM hadoop-base-image

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ENV HADOOP_DN_DIR=/data/1/dfs/dn

RUN mkdir -p /data

ADD run.sh /run.sh
RUN chmod a+x /run.sh \
	&& chown hdfs:hadoop run.sh \
	&& chown -R hdfs:hadoop /data 
	# && chown -R hdfs:hadoop ${HADOOP_HOME}

USER hdfs

# file:///data/1/dfs/dn from hdfs-site.xml
RUN mkdir -p ${HADOOP_DN_DIR} && mkdir -p ${HADOOP_HOME}/logs
VOLUME ${HADOOP_DN_DIR}

# http interface
EXPOSE 9864

CMD ["/run.sh"]