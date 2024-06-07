

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/res/colors/app_color.dart';

class RoundButton extends StatelessWidget {

  const RoundButton({
    Key? key ,
    this.buttonColor = AppColor.blueLight  ,
    this.textColor = AppColor.primaryTextColor ,
    required this.title ,
    required this.onPress ,
    this.width = 60 ,
    this.height = 50 ,
  this.loading = false, this.rounded = 0, this.icon = Icons.arrow_right_alt, required this.iconEnable, this.outline = false
  }) : super(key: key);

  final IconData icon;
  final bool iconEnable;
  final bool loading;
  final String title ;
  final double height , width  ;
  final VoidCallback onPress ;
  final double rounded;
  final Color textColor, buttonColor ;
  final bool outline;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: outline ?  Colors.transparent : buttonColor,
          border: Border.all(color: buttonColor),
          borderRadius: BorderRadius.circular(rounded)
        ),
        child: loading ?
        const Center(child: CircularProgressIndicator(color: Colors.white), ) :
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style:  TextStyle(fontSize: 16, color: outline ?  buttonColor : Colors.white)),
              iconEnable == true ? const SizedBox(width: 10,) :  Container(),
             
             
            ],
          ),
        ),
      ),
    );
  }
}
