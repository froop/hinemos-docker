# sendmail for SMTPS (172.31.1.26)

```
cd test/sendmail-smtps
docker run --rm -e SSL_SUBJECT="smtps" -e SSL_DNS="smtps" -v /tmp/certs:/certs paulczar/omgwtfssl
sudo cp /tmp/certs/key.pem .
cp /tmp/certs/cert.pem .
cp /tmp/certs/ca.pem .
sudo docker compose up -d --build
```

```
docker cp /tmp/certs/cert.pem hinemos-manager:/root/
manager/login.sh
#keytool -delete -noprompt -keystore /etc/alternatives/jre/lib/security/cacerts -alias smtps -storepass changeit
#keytool -import -noprompt -trustcacerts -file cert.pem -keystore /etc/alternatives/jre/lib/security/cacerts -alias smtps -storepass changeit
#systemctl restart hinemos_manager
#exit
```

```
test/sendmail-smtps/login.sh
#mail
```

172.31.1.26:465 root@smtps, user01@smtps, user02@smtps
