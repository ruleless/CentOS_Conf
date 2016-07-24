
.PHONY:all config start stop dep
all:
	@echo "config? start? or stop?"

config:
	cp ./ss-config.json /etc
	cp ./shadowsocks-libev /etc/init.d
	chkconfig --add shadowsocks-libev
	chkconfig --list shadowsocks-libev
# echo "/usr/local/bin/ss-server -c /etc/config.json -f /tmp/ss-server.pid" >> /etc/rc.local

start:
	service shadowsocks-libev start

stop:
	service shadowsocks-libev stop

dep:
	yum install build-essential autoconf libtool openssl-devel gcc asciidoc xmlto -y
