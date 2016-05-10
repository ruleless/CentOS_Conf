
# 配置防火墙的三个步骤：
## 1. 清除表中所有链的所有规则
## 2. 设定预设策略
## 3. 添加各项规则

CMD:=iptables

all:

def:clean_t policy_t default_t # 默认防火墙配置
clean:clean_t
show:show_t

default_t:
	$(CMD) -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
	$(CMD) -t filter -A INPUT -p icmp -j ACCEPT
	$(CMD) -t filter -A INPUT -i lo -j ACCEPT
	$(CMD) -t filter -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
	$(CMD) -t filter -A INPUT -j REJECT --reject-with icmp-host-prohibited
	$(CMD) -t filter -A FORWARD -j REJECT --reject-with icmp-host-prohibited

clean_t:
	$(CMD) -F
	$(CMD) -X
	$(CMD) -Z

policy_t:
	$(CMD) -P INPUT   DROP
	$(CMD) -P OUTPUT  ACCEPT
	$(CMD) -P FORWARD ACCEPT

show_t:
	$(CMD) -t filter -L

save:
	/etc/init.d/iptables save
