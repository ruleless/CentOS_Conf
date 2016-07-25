#!/bin/sh

./client_linux_amd64 -l :12948 -r 127.0.0.1:29900 -key test -mtu 1400 -sndwnd 256 -rcvwnd 2048 -mode fast2 -dscp 46 > client.log 2>&1 &
