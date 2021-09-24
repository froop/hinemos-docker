# bind (172.31.1.23)

```
docker-compose -f test/bind/docker-compose.yml up -d --build
test/bind/login.sh
```

/etc/resolv.conf
```
nameserver 172.31.1.23
domain test.local
```
