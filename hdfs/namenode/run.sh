#!/bin/bash
if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

# Formatting the Namenode
# Before HDFS can be started, the namenode must be formatted. Formatting is a relatively simple operation, performed once, 
# that creates the initial filesystem metadata on the namenode. The format command must be run as the OS user that you intend 
# to be the HDFS super user
# sudo -u hdfs hadoop namenode -format

if [ "`ls -A ${HADOOP_NN_DIR}`" == "" ]; then
  echo "Formatting namenode name directory: $namedir"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME 
fi

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode