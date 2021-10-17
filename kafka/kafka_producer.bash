#!/bin/bash

source ${PWD}/inc/config

#	bash kafka_producer.bash localhost 9092 test-topic

KAFKA_END_POINT_HOST=$1
KAFKA_END_POINT_PORT=$2
KAFKA_TOPIC_NAME=$3

if [ $# == 3 ];
then
	${KAFKA_BIN_DIR}/kafka-console-producer.sh  --topic "${KAFKA_TOPIC_NAME}" --bootstrap-server "${KAFKA_END_POINT_HOST}:${KAFKA_END_POINT_PORT}"
else
	echo 
	echo "Usage :"
	echo "	$0 [KAFKA_END_POINT_HOST] [KAFKA_END_POINT_PORT] [KAFKA_TOPIC_NAME]"
	echo     
fi