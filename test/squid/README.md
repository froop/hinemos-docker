# squid (172.31.1.25)

```
docker compose -f test/squid/docker-compose.yml up -d --build
test/squid/login.sh
```

```
export http_proxy=http://172.31.1.25:3128
export https_proxy=http://172.31.1.25:3128
#export http_proxy=http://user1:password@172.31.1.25:3128
```

Basic Authentication

```
# vi /etc/squid/squid.conf
auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
#http_access allow localnet

yum install -y httpd-tools
htpasswd -c /etc/squid/passwords user1
systemctl restart squid
```
