# PostgreSQL (172.31.1.28)

```
docker compose -f test/postgres/docker-compose.yml up -d
```

psql -h 172.31.1.28 -p 5432 -U postgres -d postgres  
jdbc:postgresql://172.31.1.28:5432/postgres
