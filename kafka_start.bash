#!/bin/bash

source ${PWD}/inc/config

${PWD}/install_kafka.bash

systemctl restart zookeeper.service
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Zookeeper Service Stared"
else
  log "${ACTION_KO}" "Zookeeper Service Stared"
fi

systemctl restart kafka.service
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Kafka Service Stared"
else
  log "${ACTION_KO}" "Kafka Service Stared"
fi
