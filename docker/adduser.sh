#!/bin/sh

OS_USER="$1"

if [ -z "$OS_USER" ]; then
  echo "Usage: $0 username" >&2
  echo "Example: $0 proxyuser" >&2
  exit 1
fi

case "$OS_USER" in
  *[\\\"\']*)
    echo "SOCKS5 credentials must not contain any of these characters: \\ \" '" >&2
    exit 1
    ;;
esac


RAND_PASSWORD="$(LC_CTYPE=C tr -dc 'A-HJ-NPR-Za-km-z2-9' < /dev/urandom | head -c 8)"
printf "Password for user is: $RAND_PASSWORD\n"

addgroup -g 1000 dante &> /dev/null

printf "$RAND_PASSWORD\n$RAND_PASSWORD\n" | adduser -s /sbin/nologin $OS_USER -g dante

echo "$OS_USER was added"

