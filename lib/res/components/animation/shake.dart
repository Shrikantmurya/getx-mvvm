import 'dart:math';
import 'package:flutter/material.dart';

class Shake extends StatefulWidget {
  final Widget shakeWidget;


  const Shake({
    Key? key,
    required this.shakeWidget,
   
  }) : super(key: key);

  @override
  _ShakeState createState() => _ShakeState();
}

class _ShakeState extends State<Shake> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: -0.05, end: 0.05).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _animation.value,
      child: widget.shakeWidget,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}