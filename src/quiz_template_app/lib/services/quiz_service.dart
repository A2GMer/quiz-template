/* クイズデータを管理し、クイズの出題や回答処理を行うサービスを実装 */
import 'dart:convert';
import '../models/quiz_model.dart';
import 'database_service.dart';

//カスタマイズポイント
//難易度の追加:クイズに難易度レベルを追加して、特定の難易度のみを取得可能にする。
//カテゴリ別のクイズ取得:クイズをカテゴリ（例: 歴史、地理）で分類して取得。
//解説の強化:解説に画像やリンクを追加可能にする。

class QuizService {
  final DatabaseService _databaseService = DatabaseService();

  // クイズデータを取得
  Future<List<QuizModel>> fetchQuizzes() async {
    final quizzesData = await _databaseService.getQuizzes();
    return quizzesData.map((data) {
      return QuizModel(
        question: data['question'] as String,
        options: List<String>.from(jsonDecode(data['options'] as String)),
        correctAnswerIndex: data['correctAnswerIndex'] as int,
        explanation: data['explanation'] as String,
      );
    }).toList();
  }

  // クイズをシャッフルして取得
  Future<List<QuizModel>> fetchShuffledQuizzes() async {
    final quizzes = await fetchQuizzes();
    quizzes.shuffle();
    return quizzes;
  }

  // クイズの追加
  Future<void> addQuiz(QuizModel quiz) async {
    final quizData = {
      'question': quiz.question,
      'options': jsonEncode(quiz.options), // JSON形式で保存
      'correctAnswerIndex': quiz.correctAnswerIndex,
      'explanation': quiz.explanation,
    };
    await _databaseService.addQuiz(quizData);
  }

  // 解答をチェック
  bool checkAnswer(QuizModel quiz, int selectedIndex) {
    return quiz.correctAnswerIndex == selectedIndex;
  }
}

//使用例

//クイズデータの取得
//final quizService = QuizService();
//
//void fetchExample() async {
//  final quizzes = await quizService.fetchQuizzes();
//  for (var quiz in quizzes) {
//    print('問題: ${quiz.question}');
//  }
//}


//クイズの追加
//final quizService = QuizService();
//
//void addQuizExample() async {
//  final quiz = QuizModel(
//    question: '大阪の名物は？',
//    options: ['たこ焼き', '寿司', 'ラーメン', 'もんじゃ焼き'],
//    correctAnswerIndex: 0,
//    explanation: '大阪のたこ焼きは有名です。',
//  );
//
//  await quizService.addQuiz(quiz);
//  print('クイズが追加されました');
//}


//解答の確認
//final quizService = QuizService();
//
//void checkAnswerExample() {
//  final quiz = QuizModel(
//    question: '大阪の名物は？',
//    options: ['たこ焼き', '寿司', 'ラーメン', 'もんじゃ焼き'],
//    correctAnswerIndex: 0,
//    explanation: '大阪のたこ焼きは有名です。',
//  );
//
//  final isCorrect = quizService.checkAnswer(quiz, 0);
//  print(isCorrect ? '正解' : '不正解'); // 正解
//}
//