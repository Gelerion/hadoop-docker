# docker build -t hadoop-base-image -f hadoop-base/Dockerfile .
FROM ubuntu:19.04

RUN apt-get update && apt-get install -y --no-install-recommends \
		openjdk-8-jdk \
		curl \
		net-tools \
		netcat \
		gnupg \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

# used in hadoop-env.sh
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ARG HADOOP_VERSION=2.9.2
ENV HADOOP_VERSION ${HADOOP_VERSION}
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

# install hadoop
RUN set -x \
    #-f fail  silently (no output at all) on server errors
    #-S makes curl show an error message if it fails
    #-L if the server reports that the requested page  has  moved  to  a  different  location
    #   (indicated  with  a Location: header and a 3XX response code), this option will make 
    #.  curl redo the request on the new place
	&& curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
	&& tar -xvf /tmp/hadoop.tar.gz -C /usr/local/ \
	&& rm /tmp/hadoop.tar.gz*

RUN ln -s /usr/local/hadoop-$HADOOP_VERSION/etc/hadoop /etc/

ENV HADOOP_HOME=/usr/local/hadoop-$HADOOP_VERSION
ENV HADOOP_PREFIX=/usr/local/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV PATH $HADOOP_HOME/bin/:$PATH

RUN groupadd -r hadoop \
	&& useradd -r -g hadoop hadoop \
	&& useradd -r -g hadoop yarn \
	&& useradd -r -g hadoop hdfs

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh \
	&& chown -R hadoop:hadoop ${HADOOP_HOME}/etc/hadoop/ \
	&& chgrp -R hadoop ${HADOOP_HOME} && chmod g+rwX ${HADOOP_HOME} -R


COPY --chown=hadoop:hadoop config/*.xml ${HADOOP_HOME}/etc/hadoop/

# grant execute permissions for shell files
RUN find ${HADOOP_HOME}/etc/hadoop/ -type f -iname "*.sh" -exec chmod a+x {} \;
# RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_HOME/etc/hadoop/hadoop-env.sh

# CMD ["/bin/bash"]
ENTRYPOINT ["/entrypoint.sh"]