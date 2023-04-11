// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:stop_watch_timer/stop_watch_timer.dart';

class CustomStopwatchCountDown extends StatefulWidget {
  const CustomStopwatchCountDown({
    Key? key,
    this.width,
    this.height,
    required this.secondsToShow,
    required this.textColor,
    this.fontSize,
    this.actionOnEnded,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int secondsToShow;
  final Color textColor;
  final double? fontSize;
  final Future<dynamic> Function()? actionOnEnded;

  @override
  _CustomStopwatchCountDownState createState() =>
      _CustomStopwatchCountDownState();
}

class _CustomStopwatchCountDownState extends State<CustomStopwatchCountDown> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromHour(0),
  );
  late TextStyle textStyle;

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.setPresetSecondTime(widget.secondsToShow);
    textStyle = TextStyle(
      fontSize: widget.fontSize != null ? widget.fontSize : 16,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      color: widget.textColor,
    );
    try {
      if (widget.secondsToShow > 0) {
        _stopWatchTimer.onStartTimer();
        _stopWatchTimer.fetchEnded.listen((value) => widget.actionOnEnded);
      }
    } catch (e) {
      // code that handles the exception
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,
        initialData: _stopWatchTimer.rawTime.value,
        builder: (context, snap) {
          final value = snap.data!;
          final displayTime =
              StopWatchTimer.getDisplayTime(value, milliSecond: false);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  displayTime,
                  style: textStyle,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
