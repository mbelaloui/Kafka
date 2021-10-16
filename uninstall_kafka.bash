#!/bin/bash

source ${PWD}/inc/config

${PWD}/kafka_stop.bash

rm -fr "${TMP_DOWNLOAD_KAFKA_TMP_DIR}"
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Clean Kafka downloaded Package"
else
  log "${ACTION_KO}" "Clean Kafka downloaded Package"
fi

rm -fr "${ZOOKEEPER_SERVICE_FILE_NAME}"
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Clean Zookeeper service file"
else
  log "${ACTION_KO}" "Clean Zookeeper service file"
fi

rm -fr ""${KAFKA_SERVICE_FILE_NAME}""
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Clean Kafka service file"
else
  log "${ACTION_KO}" "Clean Kafka service file"
fi

systemctl daemon-reload