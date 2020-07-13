# hinemos-docker

## Usage

* コマンド

```
git clone https://github.com/froop/hinemos-docker.git
cd hinemos-docker

./build.sh              # build images
docker-compose up -d    # 起動
docker-compose stop     # 停止
docker-compose down     # 削除(container)
# docker-compose down -v  # 削除(with volume)
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
