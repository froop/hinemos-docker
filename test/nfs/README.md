# NFS (172.31.1.29)

```
docker compose -f test/nfs/docker-compose.yml up -d
```

yum install -y nfs-utils
mkdir -p /mnt/nfs-client
mount -v -t nfs 172.31.1.29:/share/nfs /mnt/nfs-client
