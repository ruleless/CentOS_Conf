#!/bin/sh

./client_linux_amd64 -l :5080 -r 45.63.60.117:29900 -key test -mtu 1400 -sndwnd 256 -rcvwnd 2048 -mode fast2 -dscp 46 > client.log 2>&1 &
