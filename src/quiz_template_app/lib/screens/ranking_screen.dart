/* ランキング画面を実装する */
import 'package:flutter/material.dart';

//【カスタマイズポイント】
//データの動的取得:rankingsを固定データではなく、サーバーやSQLiteデータベースから取得可能に変更。
//順位表示の改善:同スコアの順位処理や特定の条件で順位を目立たせるカスタマイズ。
//ランキングリセット:毎週ランキングをリセットする機能の追加。
//アイコンやスタイルの変更:順位ごとにアイコンや色を変えるカスタマイズ。

class RankingScreen extends StatelessWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ダミーデータとしてランキングをリストで用意
    // 本番では、このデータをサーバーやローカルデータベースから取得可能に変更
    final List<Map<String, dynamic>> rankings = [
      {'name': 'ユーザー1', 'score': 50, 'title': 'クイズマスター'},
      {'name': 'ユーザー2', 'score': 45, 'title': '知識王'},
      {'name': 'ユーザー3', 'score': 40, 'title': '挑戦者'},
      {'name': 'ユーザー4', 'score': 35, 'title': '初心者'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ランキング'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(    /* ユーザーのランキングリストを動的に作成 */
          itemCount: rankings.length,
          itemBuilder: (context, index) {
            final rank = rankings[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(    /* 各ユーザーの順位を丸いアイコンで表示 */
                  child: Text('${index + 1}'),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                title: Text(rank['name']),
                subtitle: Text(rank['title']),
                trailing: Text('${rank['score']} 点'),
              ),
            );
          },
        ),
      ),
    );
  }
}
