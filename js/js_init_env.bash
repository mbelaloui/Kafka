#!/bin/bash

source ${PWD}/inc/config

apt install yarn -y > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Install npm package"
else
  log "${ACTION_KO}" "Install npm package"
fi

npm install kafkajs > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Add kafkajs lib"
else

  log "${ACTION_KO}" "Add kafkajs lib"
fi