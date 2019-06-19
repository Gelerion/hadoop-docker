FROM hadoop-base-image

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

# file:///data/yarn/timeline - yarn-site.xml
ENV HADOOP_TIMELINE_DIR=/data/yarn/timeline
RUN mkdir -p /data

ADD run.sh /run.sh
RUN chmod a+x /run.sh \
	&& chown hdfs:hadoop run.sh \
	&& chown -R yarn:hadoop /data 

USER yarn

RUN mkdir -p ${HADOOP_TIMELINE_DIR}
VOLUME ${HADOOP_TIMELINE_DIR}

EXPOSE 8188

CMD ["/run.sh"]