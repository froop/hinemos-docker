# squid

```
docker-compose -f test/squid/docker-compose.yml up -d --build
test/squid/login.sh
```

```
export http_proxy=http://172.31.1.25:3128
export https_proxy=http://172.31.1.25:3128
```
