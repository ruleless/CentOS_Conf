
.PHONY:all config start stop dep
all:
	@echo "config? start? or stop?"

config:
	cp ./sssd-config.json /etc
	cp ./sssd /etc/init.d
	chkconfig --add sssd
	chkconfig --list sssd
# echo "/usr/local/bin/ss-server -c /etc/config.json -f /tmp/ss-server.pid" >> /etc/rc.local

start:
	service sssd start

stop:
	service sssd stop

dep:
	yum install build-essential autoconf libtool openssl-devel gcc asciidoc xmlto -y
