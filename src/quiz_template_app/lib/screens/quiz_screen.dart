/* クイズ画面を実装する */
import 'package:flutter/material.dart';

//【カスタマイズポイント】
//質問データをローカルデータベースまたはAPIから取得するよう変更可能。
//残り時間を表示するカウントダウンタイマーを追加する。
//ユーザーに解説を表示する機能を拡張。

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  List<Map<String, dynamic>> questions = [
    {
      'question': '大阪の有名な通りは？',
      'options': ['御堂筋', '銀座通り', '表参道', '竹下通り'],
      'answer': 0, // 正解のインデックス
    },
    {
      'question': '大阪城を建てたのは誰？',
      'options': ['徳川家康', '豊臣秀吉', '織田信長', '伊達政宗'],
      'answer': 1,
    },
  ];

  void checkAnswer(int selectedIndex) {
    if (isAnswered) return;

    setState(() {
      isAnswered = true;
      if (selectedIndex == questions[currentQuestionIndex]['answer']) {
        score++;
      }
    });

    // 次の質問への遷移を少し遅らせる
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
        isAnswered = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズ'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);     /* 終了ボタンでログイン画面など前の画面に戻る */
            },
            icon: const Icon(Icons.exit_to_app),
            tooltip: '終了',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...List.generate(
              questions[currentQuestionIndex]['options'].length,
              (index) {
                return ElevatedButton(
                  onPressed: isAnswered
                      ? null
                      : () {
                          checkAnswer(index);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAnswered &&
                            index ==
                                questions[currentQuestionIndex]['answer']
                        ? Colors.green    /* 正解の場合ボタンが緑色に */
                        : Colors.blue,
                  ),
                  child: Text(questions[currentQuestionIndex]['options'][index]),
                );
              },
            ),
            Text(
              'スコア: $score',   /* 現在のスコアを画面下部に表示 */
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
