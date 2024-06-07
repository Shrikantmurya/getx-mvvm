 import '/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

buildProfileRoundTextform({required FocusNode focusNode,required EdgeInsets edgeInsets,required double width,required double height,required Color color,required String icon,required double iconHeight,required double iconWidth,required TextEditingController? controller,required TextStyle textStyle, required String label,
      String? initialValue,
    FormFieldSetter? onSaved,
    ValueChanged? onChanged,
    required  int? maxLines,
    required TextInputType? keyboard,
    required bool obscureText,
    String? errorText,
  required bool hasFocus})
  {
    return   Focus(
        focusNode: focusNode,

   child:   Container(
        margin: edgeInsets,
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          // Create a circular outline
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: hasFocus ?AppColor.lightYellowColor : AppColor.greyColor,  // Border color
           //width: 1.0, // Border width
          ),
        ),

        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(icon, height: iconHeight,fit: BoxFit.cover,)),
            const VerticalDivider(
              color: AppColor.lightLineColor,
              thickness: 1,
            ),



        Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                formRoundSquareFieldEmailPass(errorText: errorText,maxLines: maxLines,obscureText: obscureText,controller: controller,keyboard: keyboard,label: label,textStyle: textStyle),
              ],)


          ],
        )


    ));

  }
  formRoundSquareFieldEmailPass({
  required String label,
  String? initialValue,
  FormFieldSetter? onSaved,
  ValueChanged? onChanged,
  int? maxLines,
  String? errorText,
  required TextStyle textStyle,
  TextEditingController? controller,
  TextInputType? keyboard, required bool obscureText,
}) {
  return


  Container(
  height: 65,
  width: 250,
    child: TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please type the $label above';
        }
      },
     initialValue: initialValue,
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      onSaved: onSaved,
      keyboardType: keyboard,
      decoration: InputDecoration(
        label: Text(label,style:textStyle),
        border:  InputBorder.none, //
        errorText:errorText ,
       // hintText: 'Type $label here',

      ),

    ),
    );
}

