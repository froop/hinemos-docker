# hinemos-playground

## Usage

* コマンド

```
git clone https://github.com/froop/hinemos-playground.git
cd hinemos-playground
chmod +x build.sh
./build.sh              # build docker images

docker-compose up -d    # 起動
docker-compose down     # 停止
docker-compose down -v  # 停止(設定も削除)

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
