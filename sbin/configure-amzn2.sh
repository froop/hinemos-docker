#!/bin/bash -eu

# locale
localectl set-locale LANG=ja_JP.utf8

# timezone
echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
rm -f /etc/localtime
ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# swap file
dd if=/dev/zero of=/swapfile bs=128M count=8
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile swap swap defaults 0 0' >> /etc/fstab

# docker
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -a -G docker ec2-user

# docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# git
yum install -y git
#git clone https://github.com/froop/hinemos-docker.git /home/ec2-user/hinemos-docker

yum clean all
