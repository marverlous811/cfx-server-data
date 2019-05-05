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
# sh ./FXServer/run.sh +exec server.cfg
exec ./FXServer/alpine/opt/cfx-server/ld-musl-x86_64.so.1 \
    --library-path "./FXServer/alpine/usr/lib/v8/:./FXServer/alpine/usr/lib/:./FXServer/alpine/lib" -- \
    ./FXServer/alpine/opt/cfx-server/FXServer +set citizen_dir ./FXServer/alpine/opt/cfx-server/citizen/ +exec server.cfg