FROM hadoop-base-image

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh \
	&& chown hdfs:hadoop run.sh

USER yarn

# Web UI port
EXPOSE 8042

CMD ["/run.sh"]