import 'dart:async';

import 'package:flutter/material.dart';

class BlinkingWidget extends StatefulWidget {
  final Widget widgetData;
  const BlinkingWidget({super.key, required  this.widgetData});

  @override
  State<BlinkingWidget> createState() => _BlinkingWidgetState();
}

class _BlinkingWidgetState extends State<BlinkingWidget> {
  bool _isVisible = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }


  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _isVisible = !_isVisible; // Toggle visibility
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Visibility(
          visible: _isVisible,
          child: widget.widgetData,
        );
  }

    @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

}
  

  
