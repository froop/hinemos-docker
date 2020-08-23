# hinemos-docker

## Usage

* コマンド

```
git clone https://github.com/froop/hinemos-docker.git
cd hinemos-docker

./build.sh              # build images
docker-compose build

docker-compose up -d    # 起動
docker-compose stop     # 停止
docker-compose down     # 削除

./clean.sh              # clean images
```

* ログイン

```
1. ブラウザでhttp://localhostにアクセス
2. 接続先URLをhttp://manager:8080/HinemosWS/に変更
3. パスワードに"hinemos"と入力しログイン
```

* IPアドレス

```
1. マネージャ  　  : 172.31.1.10
2. エージェント    : 172.31.1.11
3. Webクライアント : 172.31.1.12
```

## Build

```
# バージョン、環境(OS, Java)、ビルド対象ディレクトリ(＝タグ名)を指定
vi .env

# パッケージ(rpm)ファイル配置(オフライン環境の場合のみ)
# ＊オンラインの場合、https://github.com/hinemos から自動ダウンロード
# ${SERVICE}/${HINEMOS_MAJOR}/${HINEMOS_MINOR}/package/${DISTRIBUTION}

# パッチファイル配置
# ${SERVICE}/${HINEMOS_MAJOR}/${HINEMOS_MINOR}/${IMAGE_TAG}/patch

# 依存イメージが存在しなければビルド(OS, Java, Hinemos packages)
docker images
./build.sh
# base/build.sh
# manager/build.sh
# agent/build.sh
# web/build.sh

# イメージをビルドして起動
docker-compose up -d --build
```

## yumリポジトリオフライン化メモ

```
# ISOファイルをマウント
# download: https://www.centos.org/download/
mkdir /media/cdrom
mount /dev/cdrom /media/cdrom

# yumリポジトリ用HTTPサーバを立てる
docker pull httpd
docker run --name yumrepo -d -v "/media/cdrom/:/usr/local/apache2/htdocs/" httpd

# yumリポジトリのIPアドレスをdockerコンテナ用に設定
docker inspect -f '{{.NetworkSettings.IPAddress}}' yumrepo
vi .env
#YUM_REPO_IP=172.17.0.2

# 使用するyumリポジトリを切り替え
vi base/centos7jp/Dockerfile
#COPY yumrepo/* /etc/yum.repos.d/

# その他
docker exec -it yumrepo /bin/bash
```

## テスト用コンテナ

```
# sendmail
# 172.31.1.20:25 root@smtp
docker-compose -f test/sendmail/docker-compose.yml up -d --build
test/sendmail/login.sh
```

## fluentdメモ

```
docker build -t fluentd-http test/fluentd
docker run -d --name fluentd -p 8888:8888 fluentd-http
docker inspect -f '{{.NetworkSettings.IPAddress}}' fluentd
```
