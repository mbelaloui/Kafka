#!/bin/bash

source ${PWD}/inc/config

npm remove kafkajs > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Clean kafkajs lib"
else
  log "${ACTION_KO}" "Clean kafkajs lib"
fi

apt remove yarn -y > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Clean npm package"
else
  log "${ACTION_KO}" "Clean npm package"
fi

apt autoremove -y > /dev/null 2>&1
if [ $? == 0 ]; then
  log "${ACTION_OK}" "Clean system"
else
  log "${ACTION_KO}" "Clean system"
fi
