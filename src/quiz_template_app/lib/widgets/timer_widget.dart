/* クイズの時間制限を表示するためのタイマーウィジェット */

import 'dart:async';
import 'package:flutter/material.dart';

//カスタマイズポイント
//タイマーの色やデザイン:CircularProgressIndicatorの色やスタイルをカスタマイズ。
//アニメーションの追加:タイマー終了間際に視覚的な警告（例: 点滅アニメーション）を追加。
//タイマーリセット:外部から残り時間をリセットする機能を追加。

class TimerWidget extends StatefulWidget {
  final int duration; // タイマーの制限時間 (秒)
  final VoidCallback onTimeUp; // 時間切れ時のコールバック関数

  const TimerWidget({
    Key? key,
    required this.duration,
    required this.onTimeUp,
  }) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int remainingTime; // 残り時間
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.duration;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // タイマーを開始
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          _timer?.cancel();
          widget.onTimeUp();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '残り時間',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: remainingTime / widget.duration,
              strokeWidth: 6.0,
              color: Colors.blue,
            ),
            Text(
              '$remainingTime 秒',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

//使用例

//クイズ画面での利用
//import 'package:flutter/material.dart';
//import '../widgets/timer_widget.dart';
//
//class QuizScreen extends StatelessWidget {
//  const QuizScreen({Key? key}) : super(key: key);
//
//  void handleTimeUp() {
//    print('時間切れ');
//    // 次の問題に進む、または結果画面に遷移
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('クイズ'),
//      ),
//      body: Center(
//        child: TimerWidget(
//          duration: 20, // 制限時間20秒
//          onTimeUp: handleTimeUp,
//        ),
//      ),
//    );
//  }
//}
