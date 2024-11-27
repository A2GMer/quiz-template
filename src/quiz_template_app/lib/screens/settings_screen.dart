/* アプリの設定画面を実装する */
import 'package:flutter/material.dart';

//【カスタマイズポイント】
//データの永続化:設定値をSharedPreferencesやデータベースで保存・ロードできるようにする。
//追加オプション:テーマカラーの変更。
//              通知設定の有効化/無効化。
//課金処理の追加:広告非表示オプションを購入可能にする処理を追加。

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double bgmVolume = 0.5; // BGM音量
  double systemVolume = 0.5; // システム音量
  bool hideAds = false; // 広告非表示オプション

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '音量設定',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('BGM音量: ${(bgmVolume * 100).toInt()}%'),
            Slider(
              value: bgmVolume,
              min: 0,
              max: 1,
              divisions: 10,
              label: '${(bgmVolume * 100).toInt()}%',
              onChanged: (value) {
                setState(() {
                  bgmVolume = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text('システム音量: ${(systemVolume * 100).toInt()}%'),
            Slider(
              value: systemVolume,
              min: 0,
              max: 1,
              divisions: 10,
              label: '${(systemVolume * 100).toInt()}%',
              onChanged: (value) {
                setState(() {
                  systemVolume = value;
                });
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'その他の設定',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('広告を非表示にする (有料)'),
              value: hideAds,
              onChanged: (value) {
                setState(() {
                  hideAds = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 設定を保存する処理
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('設定が保存されました。')),
                  );
                },
                child: const Text('設定を保存'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
