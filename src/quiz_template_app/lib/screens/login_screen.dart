/* アプリのログイン画面を実装する */
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(         /* 画面上部タイトル */
        title: const Text('ログイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'メールアドレスでログイン',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'メールアドレス',
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'パスワード',
                prefixIcon: const Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(        /* ログインボタンを表示 */
              onPressed: () {
                // ログイン処理を実装
                Navigator.pushReplacementNamed(context, '/quiz');   /* クイズ画面へ遷移 */
              },
              child: const Text('ログイン'),
            ),
            const SizedBox(height: 10),
            TextButton(           /* 新規登録ボタンを表示 */
              onPressed: () {
                // 新規登録処理の実装
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('新規登録はこちら'),
            ),
          ],
        ),
      ),
    );
  }
}
