#!/bin/bash

if [ -z $PORT ]; then
    PORT="30120"
fi
if [ -z $HOSTNAME ]; then
    HOSTNAME="0.0.0.0"
fi
if [ -z $KEY ]; then
    exit 1
fi

sed -i "s@_PORT_@$PORT@g" /server/server.cfg
sed -i "s@_HOSTNAME_@$HOSTNAME@g" /server/server.cfg
sed -i "s@_KEY_@$KEY@g" /server/server.cfg

cd /server
sh ./FXServer/run.sh +exec server.cfg