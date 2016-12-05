# 配置防火墙的三个步骤：
## 1. 清除表中所有链的所有规则
## 2. 设定预设策略
## 3. 添加各项规则

ICMP_TYPE:=0 3 4 8 11 12 14 16 18
SERVICES:=21 22 80 81 443 445 519 1050 1080 1081 1085 5080 29900
SERVICES_UDP:=53 81 443 519 29900

open:clean_t policy_t rule_t
close:clean_t
show:show_t

# 总规则
rule_t:first_rule_t lo_rule_t icmp_rule_t ssh_rule_t mine_rule_t udp_rule_t last_rule_t

first_rule_t:
	iptables -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

lo_rule_t:
	iptables -t filter -A INPUT -i lo -j ACCEPT

## icmp封包过滤规则
icmp_rule_t:
	for x in $(ICMP_TYPE); \
		do iptables -t filter -A INPUT -p icmp --icmp-type $$x -j ACCEPT; \
	done

ssh_rule_t:
	iptables -t filter -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT

mine_rule_t:
	for port in $(SERVICES); \
		do iptables -t filter -A INPUT -p tcp -m state --state NEW -m tcp --dport $$port -j ACCEPT; \
	done

udp_rule_t:
	for port in $(SERVICES_UDP); \
		do iptables -t filter -A INPUT -p udp --dport  $$port --sport 1024:65534 -j ACCEPT; \
	done

last_rule_t:
	iptables -t filter -A INPUT -j REJECT --reject-with icmp-host-prohibited
	iptables -t filter -A FORWARD -j REJECT --reject-with icmp-host-prohibited


policy_t:
	iptables -P INPUT   DROP
	iptables -P OUTPUT  ACCEPT
	iptables -P FORWARD ACCEPT

clean_t:
	iptables -F
	iptables -X
	iptables -Z

show_t:
	iptables -t filter -L -n

save:
	/etc/init.d/iptables save
