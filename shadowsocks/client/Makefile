
.PHONY:all config start stop
all:
	@echo "config? start? or stop?"

config:
	cp ./ssc-config.json /etc
	cp ./sscd /etc/init.d
	chkconfig --add sscd
	chkconfig --list sscd
# echo "/usr/local/bin/ss-server -c /etc/config.json -f /tmp/ss-server.pid" >> /etc/rc.local

start:
	service sscd start

stop:
	service sscd stop
