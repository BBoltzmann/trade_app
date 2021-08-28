import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/margins.dart';

class CountDownDial extends StatefulWidget {
  const CountDownDial({Key key}) : super(key: key);

  @override
  _CountDownDialState createState() => _CountDownDialState();
}

class _CountDownDialState extends State<CountDownDial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(100),
      width: width(100),
      child: CircularCountDownTimer(
        duration: 60 * 60 * 24,
        initialDuration: 0,
        controller: CountDownController(),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        ringColor: red,
        ringGradient: null,
        fillColor: dial,
        fillGradient: null,
        backgroundColor: Colors.white,
        backgroundGradient: null,
        strokeWidth: 20.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.HH_MM_SS,
        isReverse: true,
        isReverseAnimation: true,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          print('Countdown Started');
        },
        onComplete: () {
          print('Countdown Ended');
        },
      ),
    );
  }
}
