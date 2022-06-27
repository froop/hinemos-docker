# sendmail for SMTPS (172.31.1.26)

```
cd test/sendmail-smtps
mkdir secure
docker run --rm -e SSL_SUBJECT="smtps" -e SSL_DNS="smtps" -v $(pwd)/secure:/certs paulczar/omgwtfssl
sudo docker compose up -d --build
```

```
docker cp test/sendmail-smtps/secure/cert.pem hinemos-manager:/root/
manager/login.sh
#keytool -delete -noprompt -keystore /etc/pki/java/cacerts -alias smtps -storepass changeit
#keytool -import -noprompt -trustcacerts -file cert.pem -keystore /etc/pki/java/cacerts -alias smtps -storepass changeit
#systemctl restart hinemos_manager
#exit
```

```
test/sendmail-smtps/login.sh
#mail
```

172.31.1.26:465 root@smtps, user01@smtps, user02@smtps
