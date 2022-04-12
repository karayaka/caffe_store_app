import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerButtonComponent extends StatefulWidget {
  int start;
  String buttonTitle;
  Function? onPressed;

  TimerButtonComponent({
    Key? key,
    this.start = 120,
    this.buttonTitle = "SMS Gönder",
    this.onPressed,
  }) : super(key: key);

  @override
  _TimerButtonComponentState createState() => _TimerButtonComponentState();
}

class _TimerButtonComponentState extends State<TimerButtonComponent> {
  Timer? _timer;
  late int _percent;
  double prnc = 0.0;

  @override
  void initState() {
    _percent = 120;
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.start != 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            minHeight: 10,
            //backgroundColor: Get.theme.colorScheme.primary,
            value: prnc,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text("Saniye ${widget.start}"),
          ),
        ],
      );
    } else {
      return Container(
        child: ElevatedButton(
          child: Text(widget.buttonTitle),
          onPressed: () {
            startTimer();
            widget.onPressed!();
          },
        ),
      );
    }
  }

  void startTimer() {
    if (widget.start == 0) {
      widget.start = _percent;
    }
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        prnc = (widget.start / _percent).toDouble();
        if (widget.start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            widget.start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
