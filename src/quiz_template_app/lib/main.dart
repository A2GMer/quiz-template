import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));  /* hooks_riverpodを使用するための必須設定。アプリ全体で状態管理を可能にする。 */
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(                         /* アプリのテーマやルートを設定 */
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {                                 /* 各画面のルートをマップ */
        '/': (context) => const LoginScreen(),  /* 初期画面としてLoginScreenを指定 */
        // 他の画面のルートもここで定義
        // '/quiz': (context) => const QuizScreen(),          /* クイズ画面 */
        // '/ranking': (context) => const RankingScreen(),    /* ランキング画面 */
        // '/settings': (context) => const SettingsScreen(),  /* 設定画面 */
      },
    );
  }
}
