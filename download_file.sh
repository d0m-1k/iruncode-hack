#!/bin/bash

host=""
port="80"
path="/files/test.zip"

request="GET $path HTTP/1.1
Host: $host
Connection: close"

exec 3<>/dev/tcp/$host/$port
echo -e "$request" >&3
cat <&3 > test.zip
exec 3>&-

echo "Success"
