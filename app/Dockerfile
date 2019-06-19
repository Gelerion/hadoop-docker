FROM hadoop-base-image

USER hadoop

ENV JAR_FILEPATH=$HADOOP_HOME/applications/WordCount.jar
ENV CLASS_TO_RUN=WordCount
ENV PARAMS="/input /output"

COPY WordCount.jar $JAR_FILEPATH


COPY --chown=hadoop:hadoop input.txt input.txt
COPY --chown=hadoop:hadoop run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]