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

deluser --remove-home $OS_USER

echo "$OS_USER was deleted"
