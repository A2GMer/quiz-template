# Flutterの公式イメージを使用
FROM cirrusci/flutter:3.24.4

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    && apt-get clean

# Flutterプロジェクトのディレクトリ作成
WORKDIR /app

# デバッグ用のポートを開放
EXPOSE 8080
