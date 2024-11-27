/* クイズの回答選択肢を表示するためのカスタムボタンウィジェット */

import 'package:flutter/material.dart';

//カスタマイズポイント
//サイズや形状の調整:ボタンの幅、高さ、形状を柔軟に調整可能。
//選択後のアニメーション:ボタンが選択された際にフェードや拡大縮小などのエフェクトを追加。
//テキストのスタイル変更:ボタンテキストにフォントや装飾を追加してデザインを向上。

class AnswerButton extends StatelessWidget {
  final String text; // ボタンのテキスト
  final bool isCorrect; // 正解かどうか
  final bool isSelected; // ボタンが選択されたかどうか
  final VoidCallback onPressed; // ボタンが押されたときの処理

  const AnswerButton({
    Key? key,
    required this.text,
    required this.isCorrect,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    if (isSelected) {
      buttonColor = isCorrect ? Colors.green : Colors.red;
    } else {
      buttonColor = Colors.blue;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: isSelected ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(text),
      ),
    );
  }
}

//使用例

//クイズ画面での利用
//import 'package:flutter/material.dart';
//import '../widgets/answer_button.dart';
//
//class QuizExample extends StatelessWidget {
//  final List<String> options = ['選択肢1', '選択肢2', '選択肢3', '選択肢4'];
//  final int correctAnswerIndex = 1;
//  bool isAnswered = false;
//
//  void handleAnswer(BuildContext context, int selectedIndex) {
//    final isCorrect = selectedIndex == correctAnswerIndex;
//    isAnswered = true;
//    ScaffoldMessenger.of(context).showSnackBar(
//      SnackBar(
//        content: Text(isCorrect ? '正解です！' : '不正解です！'),
//        backgroundColor: isCorrect ? Colors.green : Colors.red,
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('クイズ'),
//      ),
//      body: Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: Column(
//          children: List.generate(options.length, (index) {
//            return AnswerButton(
//              text: options[index],
//              isCorrect: index == correctAnswerIndex,
//              isSelected: isAnswered,
//              onPressed: () => handleAnswer(context, index),
//            );
//          }),
//        ),
//      ),
//    );
//  }
//}
