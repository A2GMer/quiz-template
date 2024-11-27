/* メールアドレスとパスワードによるログイン・登録を管理するための認証サービスを実装 */

import 'dart:async';

//【カスタマイズポイント】
//Firebaseやサーバー連携:Firebase Authenticationやカスタムサーバーを利用して本格的な認証を実装可能。
//エラーメッセージの追加:エラー時に具体的な理由を返すよう改良可能（例: "メールアドレスが見つかりません"）。
//セキュリティ強化:パスワードをハッシュ化して保存し、認証時に検証する仕組みを導入。

class AuthService {
  // 仮のユーザーデータベース (実際にはFirebaseやSQLiteなどを使用)
  final Map<String, String> _users = {
    'test@example.com': 'password123', // テスト用ユーザー
  };

  // 現在ログインしているユーザー
  String? _currentUser;

  // ログイン処理
  Future<String?> login(String email, String password) async {
    // ダミー処理 (実際には非同期通信を利用)
    await Future.delayed(const Duration(seconds: 1));
    if (_users.containsKey(email) && _users[email] == password) {
      _currentUser = email;
      return _currentUser; // 成功時は現在のユーザーを返す
    }
    return null; // 失敗時はnull
  }

  // 新規登録処理
  Future<bool> register(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_users.containsKey(email)) {
      return false; // 既に存在する場合は失敗
    }
    _users[email] = password; // 新規登録
    return true;
  }

  // ログアウト処理
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null; // 現在のユーザーをクリア
  }

  // 現在のユーザーを取得
  String? getCurrentUser() {
    return _currentUser;
  }

  // 現在ログイン中かどうかを確認
  bool isLoggedIn() {
    return _currentUser != null;
  }
}

//以下使用例

//1.ログイン
//final authService = AuthService();
//
//void loginExample() async {
//  final email = 'test@example.com';
//  final password = 'password123';
//
//  final user = await authService.login(email, password);
//  if (user != null) {
//    print('ログイン成功: $user');
//  } else {
//    print('ログイン失敗');
//  }
//}
//
//
//2.新規登録
//final authService = AuthService();
//
//void registerExample() async {
//  final email = 'newuser@example.com';
//  final password = 'securepass';
//
//  final success = await authService.register(email, password);
//  if (success) {
//    print('新規登録成功');
//  } else {
//    print('登録済みのメールアドレス');
//  }
//}
//
//
//3.ログアウト
//authService.logout().then((_) {
//  print('ログアウトしました');
//});
