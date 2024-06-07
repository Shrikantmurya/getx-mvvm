import 'package:flutter/material.dart';
import 'package:innerxcrm_student/res/colors/app_color.dart';

formFieldEmailPassWithoutIcon({
  required String label,
  String? initialValue,
  FormFieldSetter? onSaved,
  ValueChanged? onChanged,

  String? errorText,
  int? maxLines,
  TextEditingController? controller,
  TextInputType? keyboard, required bool obscureText,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    child: TextFormField(
      cursorColor: Colors.white,
      
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
      style: const TextStyle(color: AppColor.lightBlue),
      decoration: InputDecoration(
        label: Text(label, style: const TextStyle(color:  AppColor.lightBlue),),
        labelStyle:const TextStyle(color:  AppColor.lightBlue),
        errorText:errorText ,
        hintText: 'Type $label here',
        hoverColor:  AppColor.lightBlue,
        hintStyle: const TextStyle(color:  AppColor.lightBlue),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color:  AppColor.lightBlue), // Color when focused
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color:  AppColor.lightBlue), // Default color
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Color when there's an error
        ),
      ),

    ),
  );
}