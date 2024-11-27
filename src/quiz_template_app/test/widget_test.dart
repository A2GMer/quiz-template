/* Flutterアプリケーションのウィジェットテストを実行するためのテストスクリプト */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/main.dart';

//カスタマイズポイント
//追加テストケース:クイズ回答時の挙動を確認するテスト。
//ランキング画面が正しく表示されるかのテスト。
//エラーシナリオのテスト:ログインに失敗した場合のエラーメッセージ表示をテスト。
//データのモック:APIやデータベースをモック化して、より複雑なシナリオをテスト可能。

void main() {
  testWidgets('アプリが正しく起動し、タイトルが表示される', (WidgetTester tester) async {
    // アプリをテスト環境にセットアップ
    await tester.pumpWidget(const MyApp());

    // 画面に「ログイン」というテキストが表示されているか確認
    expect(find.text('ログイン'), findsOneWidget);

    // 存在しないテキストが表示されていないことを確認
    expect(find.text('存在しないテキスト'), findsNothing);
  });

  testWidgets('ログインボタンを押すとクイズ画面に遷移する', (WidgetTester tester) async {
    // アプリをテスト環境にセットアップ
    await tester.pumpWidget(const MyApp());

    // 「ログイン」ボタンを見つける
    final loginButton = find.text('ログイン');
    expect(loginButton, findsOneWidget);

    // ボタンを押す
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // クイズ画面の要素が表示されることを確認
    expect(find.text('クイズ'), findsOneWidget);
  });
}

//以下使用例

//このテストを実行するには、以下のコマンドを使用します。

//bash
//コードをコピーする
//flutter test
//実行すると、定義されたテストが実行され、アプリの挙動が確認されます。