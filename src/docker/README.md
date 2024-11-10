# Dockerを使ったFlutterアプリ開発環境構築

このプロジェクトは、FlutterアプリケーションをDocker環境でビルドおよび実行するための設定を含んでいます。

## 必要なツール

- Docker
- Docker Compose

### アプリをビルドする(Android向け)

```bash
cd ./src/docker

docker-compose run --rm flutter-app flutter build apk --release
```

コンテナ上での確認になるっぽいから、実際はGUI上で確認すると思うから、このコマンドは使わないかも・・・

## 注意点

- Dockerがインストールされていない場合は、[Docker公式サイト](https://www.docker.com/get-started)からインストール手順を確認してください。
- このプロジェクトは、Dockerを使用してFlutterアプリケーションを開発する環境を提供します。AndroidやiOSのエミュレータを使用する場合は、ホストOSで必要なSDKの設定も必要です。
