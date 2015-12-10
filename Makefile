.Phony:all
all:conf software

conf:
	cp ./bash/.bash_profile ~/
	cp ./bash/.bashrc ~/
	cp ./bash/.bash_logout ~/
	cp ./gitconf/.gitconfig ~/

software:
	yum install -y net-tools
	yum install -y gcc gcc-g++
	yum install -y clang
	yum install -y emacs

emacs:
	cd emacscfg && $(MAKE)

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
