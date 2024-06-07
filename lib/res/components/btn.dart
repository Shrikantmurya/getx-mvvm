import 'package:flutter/material.dart';

import '../colors/app_color.dart';

buttonWithRightIcon(
    {required double width,
    required double height,
    required String text,
    Function? press,
    required String buttonIcon}) {
  return Container(
      width: width,
      height: height,
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: AppColor.blueDark))),
            // maximumSize: MaterialStateProperty.all(Size(200, 200),),
            backgroundColor: MaterialStateProperty.all(AppColor.blueLight),
            foregroundColor:
                MaterialStateProperty.all<Color>(AppColor.blueLight),
          ),
          onPressed: () {
            press!();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: const TextStyle(color: Colors.white)),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    buttonIcon,
                    fit: BoxFit.cover,
                  )),
            ],
          )));
}

class BtnSmIconText extends StatefulWidget {
  final String title;
  final IconData icn;
  final Color color;
  final double width;
  final Null Function() event;

  const BtnSmIconText(
      {super.key,
      required this.title,
      required this.icn,
      required this.color,
      required this.event,
      this.width = 70.0});

  @override
  State<BtnSmIconText> createState() => _BtnSmIconTextState();
}

class _BtnSmIconTextState extends State<BtnSmIconText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.event,
      child: Container(
          width: widget.width,
          height: 20,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              Icon(
                widget.icn,
                color: AppColor.white,
                size: 15.0,
              ),
            ],
          )),
    );
  }
}

class BtnSmIcon extends StatefulWidget {
  final IconData icn;
  final Color color;
  final Null Function() event;
  final double size;
  const BtnSmIcon(
      {super.key,
      required this.icn,
      required this.color,
      required this.event,
      this.size = 18.0});

  @override
  State<BtnSmIcon> createState() => _BtnSmIconState();
}

class _BtnSmIconState extends State<BtnSmIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.event,
      child: Icon(
        widget.icn,
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}
