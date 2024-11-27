/* ユーザーのマイページを表示する */
import 'package:flutter/material.dart';

//【カスタマイズポイント】
//ユーザー情報のデータソース:データを固定値ではなく、ログインしたユーザーのデータから取得するよう変更。
//追加機能:ユーザーがプロフィール情報を編集できる機能。
//        ユーザーの過去のクイズ履歴を表示。
//デザイン:色やスタイルをテーマに合わせて調整。

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ダミーデータ
    // サーバーやローカルデータベースと連携して動的にデータを取得可能にする
    final String userName = 'ユーザー名';
    final int totalPoints = 120;
    final String title = 'クイズマスター';
    final double accuracy = 85.5; // 正答率 (パーセンテージ)

    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(                 /* ユーザー名の頭文字を大きく表示 ユーザーのプロフィール画像に変更可能 */
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Text(
                userName[0], // ユーザー名の頭文字
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '称号: $title',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              '総ポイント: $totalPoints 点',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '正答率: ${accuracy.toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 称号一覧画面に遷移
                Navigator.pushNamed(context, '/titles');
              },
              child: const Text('称号一覧を見る'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 問題追加画面に遷移
                Navigator.pushNamed(context, '/add_question');
              },
              child: const Text('問題を追加する'),
            ),
          ],
        ),
      ),
    );
  }
}
