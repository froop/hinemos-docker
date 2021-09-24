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

## コンテナへのログイン

* docker exec

```
manager: docker exec -it hinemos-manager /bin/bash
agent  : docker exec -it hinemos-agent /bin/bash
web    : docker exec -it hinemos-web /bin/bash
```

* local port forwarding

```
# TERATERM.INI
DefaultForwarding=L10022:172.31.1.10:22;L11022:172.31.1.11:22;L12022:172.31.1.12:22

# command
manager: "C:\Program Files (x86)\teraterm\ttermpro.exe" /ssh2 /auth=password /user=root /passwd=password localhost:10022
agent  : "C:\Program Files (x86)\teraterm\ttermpro.exe" /ssh2 /auth=password /user=root /passwd=password localhost:11022
web    : "C:\Program Files (x86)\teraterm\ttermpro.exe" /ssh2 /auth=password /user=root /passwd=password localhost:12022
```

## インターネット上のyumリポジトリが使えない環境用

インターネットに接続できるPCを経由する。  
→PCとDockerホストの間にSSHトンネルを開ける(remote port forwarding)。

```
# PCからDockerホストへ接続する Tera Term に設定追加 (TERATERM.INI)
DefaultForwarding=R22080:mirror.centos.org:80

# Dockerホストで外部(コンテナ内)からのポートフォワードを許可
vi /etc/ssh/sshd_config
#GatewayPorts yes

# DockerホストのIPアドレスをコンテナ内からの参照用に設定
vi .env
#LOCAL_IP=172.30.3.90

# 使用するyumリポジトリを切り替え
vi base/centos7jp/Dockerfile
#COPY CentOS-Base.repo /etc/yum.repos.d/
```
