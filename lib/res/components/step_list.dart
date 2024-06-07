import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';

class StepList extends StatefulWidget {
  final String title;
  final Column data;
  const StepList({super.key, required this.title, required this.data});

  @override
  State<StepList> createState() => _StepListState();
}

class _StepListState extends State<StepList> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 18,
                width: 18,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.red),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: const BoxDecoration(
                  color: AppColor.lightBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.title,
                      style: ThemeStyles.t14TextStyleWhite,
                    ),
                    Icon(
                      expand ? Icons.arrow_downward : Icons.arrow_forward,
                      color: AppColor.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  expand = !expand;
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(width: 2, color: AppColor.greenColor)),
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: expand ? widget.data : Container(),
              )),
        ),
      ],
    );
  }
}
