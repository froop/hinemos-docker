# reverse-proxy by nginx (172.31.1.22)

```
docker compose -f test/reverse-proxy/docker-compose.yml up -d --build
test/reverse-proxy/login.sh
```

http://172.31.1.22:80/ -> http://172.31.1.12:80/
