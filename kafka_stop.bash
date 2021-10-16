#!/bin/bash

source ${PWD}/inc/config

systemctl stop kafka.service
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Kafka Service Stopped"
else
  log "${ACTION_KO}" "Kafka Service Stopped"
fi

systemctl stop zookeeper.service
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Zookeeper Service Stopped"
else
  log "${ACTION_KO}" "Zookeeper Service Stopped"
fi

