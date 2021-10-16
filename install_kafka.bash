#!/bin/bash

source ${PWD}/inc/config

apt-get update > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Updates the package sources list"
else
  log "${ACTION_KO}" "Updates the package sources list"
fi

apt-get upgrade > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Updates all the packages presently installed"
else
  log "${ACTION_KO}" "Updates all the packages presently installed"
fi

apt-get install default-jre wget git unzip default-jdk -y > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Install prerequisite"
else
  log "${ACTION_KO}" "Install prerequisite"
fi

if [ ! -e "${TMP_DOWNLOAD_KAFKA_TMP_DIR}" ]
then
  wget -c "${KAFKA_URL}" -O "${TMP_DOWNLOAD_KAFKA_TMP_DIR}" > /dev/null 2>&1
  if [ $? == 0 ]; then
    log "${ACTION_OK}" "Donwload Kafka Package"
  else
    log "${ACTION_KO}" "Donwload Kafka Package"
  fi
fi

mkdir -p "${KAFKA_INSTALL_DIR}"
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Creat install Kafka directory"
else
  log "${ACTION_KO}" "Creat install Kafka directory"
fi

tar -xvzf "${TMP_DOWNLOAD_KAFKA_TMP_DIR}" -C "${KAFKA_INSTALL_DIR}"/ --strip 1 > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Install Kafka Package to ${KAFKA_INSTALL_DIR}"
else
  log "${ACTION_KO}" "Install Kafka Package to ${KAFKA_INSTALL_DIR}"
fi

${PWD}/Template/service.bash "${ZOOKEEPER_SERVICE_NAME}" "${ZOOKEEPER_SERVICE_FILE_NAME}" "${ZOOKEEPER_SERVICE_DESCRIPTION}" "${ZOOKEEPER_SERVICE_REQUIRES}" "${ZOOKEEPER_SERVICE_AFTER}" "${ZOOKEEPER_SERVICE_EXE_START}" "${ZOOKEEPER_SERVICE_EXE_STOP}" 
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Install Zookeeper service file"
else
  log "${ACTION_KO}" "Install Zookeeper service file"
fi

${PWD}/Template/service.bash "${KAFKA_SERVICE_NAME}" "${KAFKA_SERVICE_FILE_NAME}" "${KAFKA_SERVICE_DESCRIPTION}" "${KAFKA_SERVICE_REQUIRES}" "${KAFKA_SERVICE_AFTER}" "${KAFKA_SERVICE_EXE_START}" "${KAFKA_SERVICE_EXE_STOP}" 
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Install Kafka service file"
else
  log "${ACTION_KO}" "Install Kafka service file"
fi

systemctl restart zookeeper.service

systemctl restart kafka.service