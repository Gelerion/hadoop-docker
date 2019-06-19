#!/bin/bash

hadoop fs -rm -r /input
hadoop fs -rm -r /output
hadoop fs -mkdir /input
hadoop fs -put input.txt /input/input.txt

$HADOOP_PREFIX/bin/hadoop jar $JAR_FILEPATH $CLASS_TO_RUN $PARAMS