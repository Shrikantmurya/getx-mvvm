import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TilesWidget extends StatefulWidget {
  final title;
  final titleValue;
  final IconData? icon;
  const TilesWidget(
      {super.key, required this.title, required this.titleValue, this.icon});

  @override
  State<TilesWidget> createState() => _TilesWidgetState();
}

class _TilesWidgetState extends State<TilesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                  width: 8.0), // Optional spacing between icon and text
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ), // Text widget
            ],
          ),
          Text(
            widget.titleValue,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
