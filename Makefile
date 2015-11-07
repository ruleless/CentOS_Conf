.Phony:all
all:conf software

conf:
	cp ./bash/.bash_profile ~/
	cp ./bash/.bashrc ~/
	cp ./bash/.bash_logout ~/
	cp ./gitconf/.gitconfig ~/

software:
	yum install -y gcc gcc-g++
