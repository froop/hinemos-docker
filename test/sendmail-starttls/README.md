# sendmail for STARTTLS (port 25, 587) and SMTPS (port 465) (172.31.1.20)

```
cd test/sendmail-starttls
mkdir secure
docker run --rm -e SSL_SUBJECT="smtp" -e SSL_DNS="smtp" -v $(pwd)/secure:/certs paulczar/omgwtfssl
sudo docker compose up -d --build
```

```
docker cp test/sendmail-starttls/secure/cert.pem hinemos-manager:/root/
manager/login.sh
#keytool -delete -noprompt -keystore /etc/alternatives/jre/lib/security/cacerts -alias smtp -storepass changeit
#keytool -import -noprompt -trustcacerts -file cert.pem -keystore /etc/alternatives/jre/lib/security/cacerts -alias smtp -storepass changeit
#systemctl restart hinemos_manager
#exit
```

```
test/sendmail-starttls/login.sh
#mail
```

172.31.1.20
root@smtp, user01@smtp, user02@smtp
