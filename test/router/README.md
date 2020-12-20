## router (NAPT, firewall)

# 各ホストの設定
```
route add -net 172.31.1.0 netmask 255.255.255.0 gw 172.31.2.200 eth0
route add -net 172.31.2.0 netmask 255.255.255.0 gw 172.31.1.200 eth0
```

# NAPT化
```
firewall-cmd --zone=internal --change-interface=eth1
firewall-cmd --zone=internal --add-masquerade
firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o eth0 -j MASQUERADE
firewall-cmd --direct --add-rule ipv4 filter FORWARD 1 -i eth1 -o eth0 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter FORWARD 1 -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
```

# test of Path MTU Discovery
```
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 0 -p icmp -j DROP
ifconfig eth0 mtu 1499
ping -s 1472 -M do 172.31.1.10
```
