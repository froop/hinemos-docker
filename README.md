# hinemos-docker

## Usage

* コマンド

```
git clone https://github.com/froop/hinemos-docker.git
cd hinemos-docker
chmod +x build.sh

./build.sh              # build docker images
docker-compose up -d    # 起動
docker-compose stop     # 停止
docker-compose down     # 削除(DBは残す)
docker-compose down -v  # 削除(DBも削除)
./clean.sh              # clean docker images

docker exec -it hinemos-manager /bin/bash
docker exec -it hinemos-web /bin/bash
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
2. Webクライアント : 172.31.1.11
```
