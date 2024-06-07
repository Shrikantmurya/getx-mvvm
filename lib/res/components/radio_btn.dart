import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/app_color.dart';

class EassyRadio extends StatefulWidget {
  final List<String> titles;
  final List<String> values;
  final bool vertical;
  final Function(String) getData;
  final double textSize, width;
  final String initial;
  const EassyRadio({
    Key? key,
    required this.titles,
    required this.values,
    required this.getData,
     this.textSize = 16,
    this.vertical = false, this.width = 0.8, this.initial = '',
  }) : super(key: key);

  @override
  State<EassyRadio> createState() => _EassyRadioState();
}

class _EassyRadioState extends State<EassyRadio> {
  String selectedValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.initial.isEmpty ? widget.values[0] : widget.initial;
  }
 @override
Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width * widget.width;
  return widget.vertical ?
  Column(
    children: List.generate(
      widget.titles.length,
      (index) => SizedBox(
        child: RadioListTile<String>(
          title: Text(widget.titles[index], style: TextStyle(
                                          color: AppColor.greyColor,
                                          fontSize: widget.textSize)),
          value: widget.values[index],
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
            widget.getData(selectedValue);
          },
        ),
      ),
    ),
  )
  : Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: List.generate(
      widget.titles.length,
      (index) => Expanded(
        child: SizedBox(
          width: width/ widget.titles.length,
          child: RadioListTile<String>(
            title: Text(widget.titles[index], style: TextStyle(
                                          color: AppColor.greyColor,
                                          fontSize: widget.textSize),),
            value: widget.values[index],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
              widget.getData(selectedValue);
            },
          ),
        ),
      ),
    ),
  );
}
}
