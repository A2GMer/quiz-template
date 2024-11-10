# ベースイメージ
FROM cirrusci/flutter:latest

# Android SDKパスの設定
ENV ANDROID_SDK_ROOT="/opt/android-sdk"
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/platform-tools"

RUN apt-get update && apt-get install -y g++ \
    ninja-build \
    cmake \
    clang \
    pkg-config \
    libgtk-3-dev \
    && rm -rf /var/lib/apt/lists/*

# CMakeで使用するコンパイラを明示的に設定
ENV CXX=/usr/bin/g++

# Android SDKのコンポーネントインストール
RUN sdkmanager --install "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Flutterプロジェクトの作成
WORKDIR /app
COPY . .
RUN flutter pub get
