#!/bin/sh

./server_linux_amd64 -l :29900 -t 127.0.0.1:5080 -key test -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -mode fast2 > kcptun.log 2>&1 &
