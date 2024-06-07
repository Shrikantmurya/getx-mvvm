

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
   InputEmailWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,

      validator: (value){
        if(value!.isEmpty){
           Utils.snackBar('Please Fill', 'Enter mobile no.');
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
      },
      decoration: const InputDecoration(
          label: Text('Mobile N0.'),
          hintText: 'Enter Mobile N0.',
          prefixIcon:Icon(Icons.person)
      ),
    
    );
  }
}
