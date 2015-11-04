# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin:.
export PATH

# ssh start
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

# 自启程序
# echo "start gtags flag generating prog."
# cd ~/proj/unix/
# schedule 5 gtags -i &
# cd ~
