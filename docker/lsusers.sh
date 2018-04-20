#!/bin/sh

printf "User list:\n\n"

cat /etc/passwd | grep dante
