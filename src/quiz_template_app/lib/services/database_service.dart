/* SQLiteを利用してクイズやユーザーデータを保存・取得するためのデータベースサービスを実装 */

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//カスタマイズポイント
//データ構造の拡張:クイズにカテゴリやタイムリミットを追加。
//ユーザーの追加情報（例: 最終ログイン日）を保存。
//データ操作の最適化:クエリの結果をモデルオブジェクト（UserModel, QuizModel）に直接変換するメソッドを追加。
//エラーハンドリング:データベース操作時のエラー処理を追加。

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  // データベースの初期化
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quiz_app.db');   //データベースのパス指定：quiz_app.db

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // テーブル作成
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        totalPoints INTEGER NOT NULL,
        title TEXT NOT NULL,
        accuracy REAL NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE quizzes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT NOT NULL,
        options TEXT NOT NULL, -- JSON形式で保存
        correctAnswerIndex INTEGER NOT NULL,
        explanation TEXT NOT NULL
      )
    ''');
  }

  // ユーザーの追加
  Future<void> addUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert('users', user, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // ユーザーの取得
  Future<Map<String, dynamic>?> getUser(String id) async {
    final db = await database;
    final result = await db.query('users', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // クイズの追加
  Future<void> addQuiz(Map<String, dynamic> quiz) async {
    final db = await database;
    await db.insert('quizzes', quiz, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // クイズの取得
  Future<List<Map<String, dynamic>>> getQuizzes() async {
    final db = await database;
    return await db.query('quizzes');
  }

  // データベースを閉じる
  Future<void> closeDatabase() async {
    final db = await _database;
    if (db != null) {
      await db.close();
    }
  }
}

//使用例

//ユーザーの追加と取得
//final dbService = DatabaseService();
//
//// ユーザーを追加
//await dbService.addUser({
//  'id': '12345',
//  'name': '山田太郎',
//  'totalPoints': 150,
//  'title': 'クイズマスター',
//  'accuracy': 85.5,
//});
//
//// ユーザーを取得
//final user = await dbService.getUser('12345');
//if (user != null) {
//  print('ユーザー名: ${user['name']}');
//}


//クイズの追加と取得
//// クイズを追加
//await dbService.addQuiz({
//  'question': '大阪城を建てたのは誰？',
//  'options': '["徳川家康", "豊臣秀吉", "織田信長", "伊達政宗"]',
//  'correctAnswerIndex': 1,
//  'explanation': '豊臣秀吉が築城しました。',
//});
//
//// クイズを取得
//final quizzes = await dbService.getQuizzes();
//for (var quiz in quizzes) {
//  print('問題: ${quiz['question']}');
//}
//