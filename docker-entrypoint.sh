#!/bin/sh
set -e
: "${SOCKD_USER_NAME:=user}"
if [ -n "$SOCKD_USER_PASSWORD" ]; then
  id "$SOCKD_USER_NAME" || adduser -D "$SOCKD_USER_NAME"
  echo "$SOCKD_USER_NAME:$SOCKD_USER_PASSWORD" | chpasswd
  exec sockd
else
  echo "Set \$SOCKD_USER_PASSWORD variable please"
fi
