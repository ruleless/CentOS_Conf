dirs:=bash gitconf

.PHONY:default config install emacs emacsdep
default:config

include ./build.mak

# only copy configration files
config:all

# install common software
centos7:install
	yum install -y clang
	yum install -y emacs

centos6:install

install:
	yum install -y net-tools
	yum install -y gcc
	yum install -y gcc-c++
	yum install -y ncurses-devel
	yum install -y samba # 远程文件传输服务


emacsdep:
	yum -y groupinstall "Development Tools"
	yum -y install gtk+-devel gtk2-devel
	yum -y install libXpm-devel
	yum -y install libpng-devel
	yum -y install giflib-devel
	yum -y install libtiff-devel libjpeg-devel
	yum -y install ncurses-devel
	yum -y install gpm-devel dbus-devel dbus-glib-devel dbus-python
	yum -y install GConf2-devel pkgconfig
	yum -y install libXft-devel
