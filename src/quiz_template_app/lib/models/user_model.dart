/* ユーザー情報を管理するためのモデルクラス */

//【カスタマイズポイント】
//追加フィールド:プロフィール画像URLやランク情報など、ユーザー関連の詳細情報を追加可能。
//データベース連携:SQLiteやFirestoreなどのデータベースでこのモデルを利用可能。
//動的計算:正答率やランクをリアルタイムで計算・更新する仕組みを組み込むことができます。

class UserModel {
  final String id; // ユーザーの一意のID
  final String name; // ユーザー名
  final int totalPoints; // 獲得した総ポイント
  final String title; // 称号
  final double accuracy; // 正答率 (0.0〜100.0)

  UserModel({
    required this.id,
    required this.name,
    required this.totalPoints,
    required this.title,
    required this.accuracy,
  });

  // ファクトリコンストラクタ: JSONデータからUserModelを生成
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      totalPoints: json['totalPoints'] as int,
      title: json['title'] as String,
      accuracy: (json['accuracy'] as num).toDouble(),
    );
  }

  // UserModelをJSON形式に変換
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'totalPoints': totalPoints,
      'title': title,
      'accuracy': accuracy,
    };
  }
}

//以下使用例

//JSONデータからモデルを生成
//final userData = {
//  'id': '12345',
//  'name': '山田太郎',
//  'totalPoints': 150,
//  'title': '知識王',
//  'accuracy': 92.5,
//};

//モデルからJSONデータを生成
//final user = UserModel.fromJson(userData);
//print(user.name); // 山田太郎
//print(user.totalPoints); // 150

//final user = UserModel(
//  id: '12345',
//  name: '山田太郎',
//  totalPoints: 150,
//  title: '知識王',
//  accuracy: 92.5,
//);

//final jsonData = user.toJson();
//print(jsonData);
// 出力: {id: 12345, name: 山田太郎, totalPoints: 150, title: 知識王, accuracy: 92.5}
