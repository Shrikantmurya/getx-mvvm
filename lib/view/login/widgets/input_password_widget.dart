

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/fonts/app_fonts.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('pass_hint'.tr, 'enter_pass_hint'.tr);
        }
      },
      onFieldSubmitted: (value){

      },
      decoration: InputDecoration(
          label: Text('password_hint'.tr,),
          hintText: 'type_pass_here'.tr,
          prefixIcon:const Icon(Icons.lock_outlined,),
         
       
      ),
     
    );
  }
}
