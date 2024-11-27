/* アプリ全体で使用する定数（色、テキストスタイル、パスなど）を定義 */
import 'package:flutter/material.dart';

//カスタマイズポイント
//多言語対応の追加:固定の文字列ではなく、国際化ライブラリ（intlなど）を使ってテキストを管理。
//デザイン変更:テーマカラーやフォントスタイルを簡単に変更可能。
//アセットパス管理:画像や音声ファイルをカテゴリーごとに整理して管理。

// アプリのテーマカラー
const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.green;
const Color errorColor = Colors.red;
const Color backgroundColor = Colors.white;

// テキストスタイル
const TextStyle headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

const TextStyle bodyStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

const TextStyle errorStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: errorColor,
);

// アイコンサイズ
const double iconSize = 24.0;

// アセットパス
const String assetsImagesPath = 'assets/images/';
const String assetsSoundsPath = 'assets/sounds/';

// タイマー関連
const int quizTimerDuration = 20; // クイズの制限時間 (秒)

// ランキング関連
const int rankingTopLimit = 50; // ランキングの上位人数

//以下使用例
//
//色を使用
//Container(
//  color: primaryColor,
//  child: Text(
//    'テキスト',
//    style: headingStyle,
//  ),
//);
//
//制限時間の設定に利用
//TimerWidget(
//  duration: quizTimerDuration,
//  onTimeUp: () {
//    print('時間切れ');
//  },
//);
