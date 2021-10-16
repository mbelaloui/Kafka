#!/bin/bash

source ${PWD}/inc/config

SERVICE_NAME="$1"
SERVICE_FILE_NAME="$2"
SERVICE_DESCRIPTION="$3"
SERVICE_REQUIRES="$4"
SERVICE_AFTER="$5"
SERVICE_EXE_START="$6"
SERVICE_EXE_STOP="$7"

echo "

[Unit]
Description=\"${SERVICE_DESCRIPTION}\"
Requires=\"${SERVICE_REQUIRES}\"
After=\"${SERVICE_AFTER}\"

[Service]
Type=simple
ExecStart=${SERVICE_EXE_START}
ExecStop=${SERVICE_EXE_STOP}
Restart=on-abnormal

[Install]
WantedBy=multi-user.target" > "${SERVICE_FILE_NAME}"

if [ $? == 0 ]; then
  log "${ACTION_OK}" "Creat template ${SERVICE_NAME}"
else
  log "${ACTION_KO}" "Creat template ${SERVICE_NAME}"
fi

systemctl daemon-reload

systemctl enable ${SERVICE_NAME}