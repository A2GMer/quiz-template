/*クイズのデータ構造を定義するモデルクラスを実装*/

//【カスタマイズポイント】
//問題のカテゴリ追加:カテゴリ（例: "歴史", "地理"など）のフィールドを追加可能。
//タイムリミット:問題ごとの制限時間を追加。
//複数言語対応:questionやexplanationを多言語対応できるように設計。

class QuizModel {
  final String question; // 問題文
  final List<String> options; // 選択肢
  final int correctAnswerIndex; // 正解の選択肢インデックス
  final String explanation; // 解説

  QuizModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });

  // ファクトリコンストラクタ: JSONデータからQuizModelを生成
  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      question: json['question'] as String,
      options: List<String>.from(json['options'] as List),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
      explanation: json['explanation'] as String,
    );
  }

  // QuizModelをJSON形式に変換
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
      'explanation': explanation,
    };
  }
}

//以下使用例

//1. JSONデータからモデルを生成
//final quizData = {
//  'question': '大阪の有名な通りは？',
//  'options': ['御堂筋', '銀座通り', '表参道', '竹下通り'],
//  'correctAnswerIndex': 0,
//  'explanation': '御堂筋は大阪の代表的な通りです。',
//};

//final quiz = QuizModel.fromJson(quizData);
//print(quiz.question); // 大阪の有名な通りは？

//2. モデルからJSONデータを生成
//final quiz = QuizModel(
//  question: '大阪の有名な通りは？',
//  options: ['御堂筋', '銀座通り', '表参道', '竹下通り'],
//  correctAnswerIndex: 0,
//  explanation: '御堂筋は大阪の代表的な通りです。',
//);
//
//final jsonData = quiz.toJson();
//print(jsonData);
// 出力: {question: 大阪の有名な通りは？, options: [御堂筋, 銀座通り, 表参道, 竹下通り], correctAnswerIndex: 0, explanation: 御堂筋は大阪の代表的な通りです。}
